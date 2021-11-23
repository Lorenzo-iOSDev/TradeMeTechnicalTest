//
//  NetworkManager.swift
//  TradeMeTechnicalTest
//
//  Created by Lorenzo Zemp on 23/11/21.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager() //makes network manager a singleton
    private let cache = NSCache<NSString, UIImage>() //cache for cacheing listing images that have already been downloaded
    
    private init() {    }
    
    func loadLatestListings(completed: @escaping (Result<[Listing], TMError>) -> Void) {
        let url = URL(string: "https://api.tmsandbox.co.nz/v1/listings/latest.json")
        
        guard let requestURL = url else {
            return completed(.failure(.invalidURL))
        }

        var request = URLRequest(url: requestURL)

        //set request method to GET and adds authorization keys/signatures to URLRequest
        request.httpMethod = "GET"
        request.setValue("OAuth oauth_consumer_key=A1AC63F0332A131A78FAC304D007E7D1, oauth_signature_method=PLAINTEXT, oauth_signature=EC7F18B17A062962C6930A8AE88B16C7&", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        //starts task to retrieve JSON payload
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            //Checks for error in task, if there is an error it returns a TMError object which will display an alert on the screen of the user
            if let error = error {
                print("Error took place \(error)")
                return completed(.failure(.unableToComplete))
            }

            //Checks that response is valid and is response code 200 else it returns a TMError object which will display an alert on the screen of the user
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            //Checks that data if valid and prints out data as a string to the console
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
                
                //If data is valid the Do Try Catch block will try to decode the JSON payload into Codable object ListingResponse
                //If an error is caught, an NSError message will be printed out to console and completion handler will return a TMError object to display an alert on the users screen
                do {
                    let decoder = JSONDecoder()
                    let listings = try decoder.decode(ListingResponse.self, from: data)
                    completed(.success(listings.List))
                    print(listings)
                } catch let jsonError as NSError {
                    print("Error parsing json")
                    print(jsonError)
                    completed(.failure(.invalidData))
                }
                
            }
        }
        task.resume()
    }
    
    //Function to download image from a URL string
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        //sets cache key as the url string
        let cacheKey = NSString(string: urlString)
        
        //checks if image with corresponding url key already exists
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        //checks if URL is valid
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        //Starts download task
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            //Checks that data is valid and creates UIImage out of Data
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            //sets cache for downloaded image and returns completion handler with image
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
