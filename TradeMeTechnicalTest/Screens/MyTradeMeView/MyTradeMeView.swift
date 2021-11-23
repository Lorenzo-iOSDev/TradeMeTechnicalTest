//
//  MyTradeMeView.swift
//  TradeMeTechnicalTest
//
//  Created by Lorenzo Zemp on 22/11/21.
//

import SwiftUI

struct MyTradeMeView: View {
    var body: some View {
        NavigationView {
                VStack {
                    Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    Text("My TradeMe")
                        .bold()
            }
            .navigationTitle("My TradeMe")
        }
    }
}

struct MyTradeMeView_Previews: PreviewProvider {
    static var previews: some View {
        MyTradeMeView()
    }
}
