//
//  ContentView.swift
//  Credit-App
//
//  Created by Abdelrahman Shehab on 13/04/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: -  PROPERTY
    
    var cards: [Card] = cardData
    
    // MARK: -  BODY
    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { card in
                    CardView(card: card)
                }
            }//: VSTACK
            .padding(20)
        }// SCROLL
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
    }
}
