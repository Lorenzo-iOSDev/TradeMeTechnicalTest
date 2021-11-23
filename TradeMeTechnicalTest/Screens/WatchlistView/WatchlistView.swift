//
//  WatchlistView.swift
//  TradeMeTechnicalTest
//
//  Created by Lorenzo Zemp on 22/11/21.
//

import SwiftUI

struct WatchlistView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                Text("Watchlist")
                    .bold()
            }
            .navigationTitle("Watchlist")
        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
    }
}
