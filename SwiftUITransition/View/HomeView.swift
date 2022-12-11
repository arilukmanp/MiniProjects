//
//  HomeView.swift
//  SwiftUITransition
//
//  Created by Ari on 11/12/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    @State private var cardIndex = 0
    @State private var isShowCard = true
    
    // MARK: - BODY
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            VStack (alignment: .leading) {
                Text("Whats New\nin SwiftUI?")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .fontDesign(.rounded)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            if (!isShowCard) {
                Rectangle()
                    .onAppear {
                        isShowCard.toggle()
                    }
            } else {
                CardView(data: cardData[cardIndex], cardIndex: cardIndex)
                    .onTapGesture {
                        withAnimation(Animation.spring()) {
                            cardIndex = (cardIndex + 1) % cardData.count
                            isShowCard.toggle()
                        }
                    }
            }
        }
    }
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

// MARK: - CARD VIEW
struct CardView: View {
    let data: Card
    @State var cardIndex: Int
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(data.image)
                .resizable()
                .scaledToFit()
            
            VStack (alignment: .leading, spacing: 0) {
                Text(data.category)
                    .font(.headline)
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .transition(.slideAppear)
                
                Text(data.heading)
                    .font(.title)
                    .fontWeight(.black)
                    .fontDesign(.rounded)
                    .padding(.vertical, 5)
                
                Text(data.author.uppercased())
                    .font(.caption)
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                
                HStack (spacing: 0) {
                    ForEach(0..<data.rating, id: \.self) {_ in
                        Image(systemName: "star.fill")
                            .font(.subheadline)
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 24)
                .transition(.slideAppear)
                
                Text(data.excerpt)
                    .foregroundColor(.gray)
                    .padding(.bottom)
            }
            .padding()
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, style: StrokeStyle(lineWidth: 0.2)))
        .padding()
        .transition(.carousel)
    }
}

// MARK: - EXTENSION
extension AnyTransition {
    static var carousel: AnyTransition {
        AnyTransition.asymmetric(insertion: .slide, removal: .offset(x: -500, y: -200))
    }
    
    static var slideAppear: AnyTransition {
        AnyTransition.asymmetric(insertion: .offset(x: 200, y: 0), removal: .slide.animation(.easeIn))
    }
}
