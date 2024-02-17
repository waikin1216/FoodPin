//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Wai Kin Ng on 17/2/2024.
//

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant:Restaurant
    var body: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .ignoresSafeArea()
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant(showError: false, showOption: false, isFavorite: false, name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", image: "cafedeadend"))
}
