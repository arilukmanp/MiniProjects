//
//  CoffeeShopDetailView.swift
//  GetCoffee
//
//  Created by Ari on 20/11/22.
//

import SwiftUI

struct CoffeeShopDetailView: View {
    let coffeeShop: CoffeeShop
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack (alignment: .bottomTrailing) {
                    Image(coffeeShop.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .clipped()
                    
                    RatingView(rating: "4.5")
                }
                .padding(.bottom, 20)
                
                Text(coffeeShop.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                
                Text(coffeeShop.review)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            }   
        }
        .navigationTitle(Text("Coffee Shop Detail"))
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct RatingView: View {
    let rating: String
    
    var body: some View {
        HStack (alignment: .center) {
            Image(systemName: "star.fill")
                .font(.body)
                .foregroundColor(.yellow)
            
            Text(rating)
                .font(.system(size: 14))
                .fontWeight(.medium)
                
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.white)
        .cornerRadius(50)
        .padding()
    }

}

struct CoffeeShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopDetailView(
            coffeeShop: CoffeeShop(
                image: "bojaeatery",
                name: "Boja Eatery",
                location: "Jl. Sumatera No. 21, Kota Bandung",
                review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class",
                isFavorite: false
            )
        )
    }
}
