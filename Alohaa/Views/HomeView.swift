//
//  ContentView.swift
//  Alohaa
//
//  Created by Ari on 22/11/22.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingAlert = false
    @State private var isShowingSheet = false
    
    var body: some View {
        ZStack (alignment: .leading) {
            bgImage
            
            VStack (alignment: .leading) {
                titleBar
                
                Text("Start Your\nAdventure\nand Go\nTravel Now")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                Text("Discover local destinations beauty with Alohaa and travel with pride.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 36)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    private var bgImage: some View {
        Image("tropical-beach")
            .resizable()
            .overlay {
                Color.black
                    .opacity(0.6)
            }
            .ignoresSafeArea()
    }
    
    private var titleBar: some View {
        HStack (alignment: .center) {
            IconButton(
                action: { isShowingAlert = true },
                icon: "cloud.sun.fill"
            )
            .alert("Not Yet Available", isPresented: $isShowingAlert, actions: {}, message: {
                Text("Currently on active development")
            })
            
            Spacer()
            
            Text("Travel")
                .font(.title2)
                .foregroundColor(.white)
            
            Spacer()
            
            IconButton(
                action: { isShowingSheet = true },
                icon: "cart.badge.plus"
            )
            .sheet(isPresented: $isShowingSheet) {
                    BottomSheetView()
                        .padding(.top, 20)
                .presentationDetents([.medium, .fraction(0.65)])
            }
        }
        .padding(.bottom, 40)

    }
}

private struct IconButton: View {
    let action: () -> Void
    let icon: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: icon)
                .symbolRenderingMode(.multicolor)
                .tint(.white)
        }
        .frame(width: 40, height: 40)
        .background(.black.opacity(0.3))
        .clipShape(Circle())
        .contentShape(Circle())
    }
}
