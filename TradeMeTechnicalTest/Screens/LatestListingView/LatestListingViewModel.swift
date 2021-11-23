//
//  LatestListingViewModel.swift
//  TradeMeTechnicalTest
//
//  Created by Lorenzo Zemp on 23/11/21.
//

import SwiftUI

final class LatestListingViewModel: ObservableObject {
    
    //Array of listings decoded from JSON payload
    @Published var listings: [Listing] = []
    
    //AlertItem optional for when there is an alert to show the user on the screen
    @Published var alertItem: AlertItem?
    
    //functions to show alerts for placeholders
    
    func tapListing() { alertItem = AlertContext.listingAlert }
    
    func tapSearch() { alertItem = AlertContext.searchAlert }
    
    func tapCart() { alertItem = AlertContext.cartAlert }
    
    //starts loading listing from API and decoding/storing it into listings object
    func loadListings() {
        NetworkManager.shared.loadLatestListings { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let listings):
                    self.listings = listings
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
