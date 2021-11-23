//
//  RemoteImage.swift
//  TradeMeTechnicalTest
//
//  Created by Lorenzo Zemp on 23/11/21.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    //Load image function to start downloading image by passing in a URL string
    func load(fromUrlString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        //Use SF Symbol photo.fill if there is no image from listing
        image?.resizable() ?? Image(systemName: "photo.fill")
    }
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String?
    
    //on appear checks if URL string is nil before attempting to load an image as some Listings may not have images
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                if urlString != nil {
                    imageLoader.load(fromUrlString: urlString!)
                }
            }
    }
}
