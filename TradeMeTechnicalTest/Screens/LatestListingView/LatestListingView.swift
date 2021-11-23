//
//  LastestListingView.swift
//  TradeMeTechnicalTest
//
//  Created by Lorenzo Zemp on 22/11/21.
//

import SwiftUI

struct LatestListingView: View {
    
    @StateObject var viewModel = LatestListingViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack{
                    List {
                        //Limited to 20 listing
                        ForEach(viewModel.listings.prefix(20)) { listing in
                            ListingCell(listing: listing)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    viewModel.tapListing()
                                }
                        }
                    }
                }
                .navigationTitle("Discover")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.tapSearch()
                        } label: {
                            Image("search")
                                .resizable()
                                .foregroundColor(Color("Tasman500"))
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.tapCart()
                        } label: {
                            Image("cart")
                                .resizable()
                                .foregroundColor(Color("Tasman500"))
                        }
                    }
                }
            }
            .onAppear {
                viewModel.loadListings()
            }
        }
        //alert system based on alertItem in viewModel
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct LatestListingView_Previews: PreviewProvider {
    static var previews: some View {
        LatestListingView()
    }
}
