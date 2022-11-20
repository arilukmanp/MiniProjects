//
//  ContentView.swift
//  GetCoffee
//
//  Created by Ari on 20/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchInput: String = ""
    
    private var cofeeShopResult: [CoffeeShop] {
        return CoffeeShopProvider.all().shuffled()
    }
    
    
    var body: some View {
        NavigationStack {
            List(cofeeShopResult) { coffeeShop in
                NavigationLink(destination: CoffeeShopDetailView(coffeeShop: coffeeShop)) {
                    HStack (spacing: 16) {
                        Image(coffeeShop.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .cornerRadius(16)
                        
                        VStack (alignment: .leading, spacing: 0) {
                            Text(coffeeShop.name)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .padding(.vertical, 8)
                            
                            Text(coffeeShop.location)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            HStack (alignment: .center) {
                                Image(systemName: "star.fill")
                                    .font(.caption)
                                    .foregroundColor(.yellow)
                                
                                Text("4.5")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 8)
                        }
                        .frame(height: 120)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Coffee Shop")
            .searchable(
                text: $searchInput,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search Coffee Shop"
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
