//
//  TradeMeTabView.swift
//  TradeMeTechnicalTest
//
//  Created by Lorenzo Zemp on 22/11/21.
//

import SwiftUI

struct TradeMeTabView: View {
    var body: some View {
        TabView {
            LatestListingView()
                .tabItem {
                    Image("search")
                    Text("Discover")
                }
            
            WatchlistView()
                .tabItem {
                    Image("watchlist")
                    Text("Watchlist")
                }
            
            MyTradeMeView()
                .tabItem {
                    Image("profile")
                    Text("My Trade Me")
                }
        }
        .accentColor(Color("Tasman500"))
    }
}

struct TradeMeTabView_Previews: PreviewProvider {
    static var previews: some View {
        TradeMeTabView()
    }
}
