//
//  CardModel.swift
//  SwiftUITransition
//
//  Created by Ari on 11/12/22.
//

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var image: String
    var category: String
    var heading: String
    var author: String
    var rating: Int
    var excerpt: String
}

let cardData: [Card] = [
    Card(image: "navigation", category: "SwiftUI", heading: "Navigation API", author: "iSwift Bootcamp", rating: 4, excerpt: "Leverage programmatic control over your app’s navigation behavior to set its launch state, manage transitions between size classes, respond to deep links, and more."),
    Card(image: "charts", category: "SwiftUI", heading: "Swift Charts", author: "iSwift Bootcamp", rating: 5, excerpt: "Visualize data with highly customizable charts that look and feel great across all Apple platforms. Swift Charts uses the compositional syntax of SwiftUI to create views with many possibilities, from line and bar charts to advanced types like stream graphs."),
    Card(image: "layout", category: "macOS", heading: "Advance Layout Control", author: "iSwift Bootcamp", rating: 4, excerpt: "Build advanced, reusable layouts to power the design of your app. In addition to VStack and HStack, SwiftUI now offers a new Grid API to simultaneously align views both horizontally and vertically."),
    Card(image: "share", category: "iOS", heading: "New Share API", author: "iSwift Bootcamp", rating: 5, excerpt: "The new Transferable protocol makes your data available for the clipboard, drag and drop, and the Share Sheet, which can now be invoked directly using SwiftUI.")
]
