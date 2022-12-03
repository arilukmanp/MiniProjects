//
//  HomeView.swift
//  GetCoffee
//
//  Created by Ari on 20/11/22.
//

import SwiftUI
import ActivityView

struct HomeView: View {
    @State var coffeeShopData = CoffeeShopProvider

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(coffeeShopData) { coffeeShop in
                    ZStack {
                        NavigationLink(destination: CoffeeShopDetailView(coffeeShop: coffeeShop)) {
                            EmptyView()
                        }
                        .opacity(0)

                        ContentRow(coffeeShop: coffeeShop)
                    }
                }
                .onDelete { indexSet in
                    coffeeShopData.remove(atOffsets: indexSet)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Coffee Shop")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ContentRow: View {
    @State var coffeeShop: CoffeeShop
    @State private var isAlertShow = false
    @State private var item: ActivityItem?


    var body: some View {
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
                    
                    Spacer()
                    
                    Image(systemName: coffeeShop.isFavorite ? "heart.fill": "heart")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                .padding(.vertical, 8)
            }
            .frame(height: 120)
        }
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button {
                coffeeShop.isFavorite.toggle()
            } label: {
                Image(systemName: coffeeShop.isFavorite ? "heart.slash" : "heart")
            }
            .tint(.pink)
            
            Button {
                item = shareItem()
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .tint(.indigo)
        }
        .contextMenu {
            Button {
                isAlertShow.toggle()
            } label: {
                Text("Save Location")
                Image(systemName: "pin")
            }
            
            Button {
                coffeeShop.isFavorite.toggle()
            } label: {
                Text(coffeeShop.isFavorite ? "Remove from Favorite" : "Mark as Favorite")
                Image(systemName: coffeeShop.isFavorite ? "heart.slash" : "heart")
            }

            Button {
                item = shareItem()
            } label: {
                Text("Share")
                Image(systemName: "square.and.arrow.up")
            }
        }
        .activitySheet($item)
        .alert(isPresented: $isAlertShow) {
            Alert(title: Text("Not Yet Available"), message: Text("Currently on active development"))
        }
    }
    
    
    func shareItem() -> ActivityItem {
        return ActivityItem(
            items: "I've coffee shop recommendation for you, it is \(coffeeShop.name) in \(coffeeShop.location)"
        )
    }
}
