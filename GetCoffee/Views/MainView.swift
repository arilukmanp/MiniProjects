//
//  MainView.swift
//  GetCoffee
//
//  Created by Ari on 03/12/22.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: TabSelection = .Home
    
    
    var body: some View {
        NavigationStack {
            TabView (selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.circle")
                        Text("Home")
                    }
                    .tag(TabSelection.Home)
                
                ExploreScreen()
                    .tabItem {
                        Image(systemName: "location.circle")
                        Text("Explore")
                    }
                    .tag(TabSelection.Explore)
                
                ProfileScreen()
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
                    .tag(TabSelection.Profile)
            }
            .tint(.brown)
            .navigationTitle(selectedTab.rawValue)
        }
    }
    
    @ViewBuilder
    func ExploreScreen() -> some View {
        VStack (spacing: 0) {
            Text("Not Yet Available")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
            
            Text("Currently Explore menu on active development")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 24)
            
            Button {
                selectedTab = .Profile
            } label: {
                Text("Go To Profile")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(.indigo)
                    .cornerRadius(50)
            }
        }
    }
    
    @ViewBuilder
    func ProfileScreen() -> some View {
        VStack (spacing: 0) {
            Text("Not Yet Available")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
            
            Text("Currently Profile menu on active development")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 24)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
