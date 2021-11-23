//
//  ListingCell.swift
//  TradeMeTechnicalTest
//
//  Created by Lorenzo Zemp on 23/11/21.
//

import SwiftUI

struct ListingCell: View {
    let listing: Listing
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: listing.PictureHref)
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(listing.Region)
                    .font(.subheadline)
                    .opacity(0.5)
                
                Text(listing.Title)
                    .font(.title3)
                    .foregroundColor(Color("TextDark"))
                    .minimumScaleFactor(0.8)
                
                Spacer()
                
                //Check if listing has Buy Now, if so uses BuyNow price instead
                //else if its classified or current just show PriceDisplay
                if listing.HasBuyNow ?? false {
                    Text("$\(listing.BuyNowPrice!, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(Color("TextDark"))
                } else if listing.IsClassified ?? false {
                    Text(listing.PriceDisplay)
                        .font(.subheadline)
                        .foregroundColor(Color("TextDark"))
                } else {
                    Text(listing.PriceDisplay)
                        .font(.subheadline)
                        .foregroundColor(Color("TextDark"))
                }
                
                Text("Reserve Met")
                    .font(.subheadline)
                    .opacity(0.5)
            }
        }
    }
}
