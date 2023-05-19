//
//  CardModel.swift
//  Credit-App
//
//  Created by Abdelrahman Shehab on 14/04/2023.
//

import Foundation
import SwiftUI

// MARK: -  Card MODEL

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
