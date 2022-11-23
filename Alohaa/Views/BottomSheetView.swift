//
//  BottomSheetView.swift
//  Alohaa
//
//  Created by Ari on 23/11/22.
//

import SwiftUI

struct BottomSheetView: View {
    var body: some View {
        VStack (alignment: .leading) {
            titleBar
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    FacilityCard(title: "Walk", icon: "figure.walk.motion", iconColor: .green)
                    FacilityCard(title: "Food", icon: "fork.knife.circle.fill", iconColor: .orange)
                    FacilityCard(title: "Stays", icon: "house.fill", iconColor: .teal)
                    FacilityCard(title: "Ride", icon: "sailboat.fill", iconColor: .purple)
                }
                .padding(.horizontal, 12)
            }
            
            Text("About Destination")
                .fontWeight(.bold)
                .padding(EdgeInsets(top: 20, leading: 16, bottom: 2, trailing: 20))
            
            Text("Pink Beach or Pantai Merah , as it aptly named, is one of seven pink beaches on the planet. This was awesome")
                .padding(.horizontal)
            
            Spacer()
            
            actionBar
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}

extension BottomSheetView {
    private var titleBar: some View {
        HStack {
            if #available(iOS 16.1, *) {
                Text("Pink Beach, Flores")
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
            } else {
                Text("Pink Beach, Flores")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            
            Text("4.8")
                .font(.body)
                .fontWeight(.semibold)
        }
        .padding()
    }
    
    private var actionBar: some View {
        HStack {
            Text("$81,39")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            Spacer()
            
            Link(destination: URL(string: "https://www.indonesia.travel/gb/en/destinations/bali-nusa-tenggara/labuan-bajo/pink-beach")!) {
                HStack {
                    Image(systemName: "bag")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Join Tour")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 14)
                .background(
                    LinearGradient(colors: [.purple, .indigo], startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(.greatestFiniteMagnitude)
            }
            .contentShape(RoundedRectangle(cornerRadius: .greatestFiniteMagnitude))
        }
        .padding()
    }
}

private struct FacilityCard: View {
    let title: String
    let icon: String
    let iconColor: Color
    
    var body: some View {
        VStack (spacing: 5) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(iconColor)
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .padding(20)
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
        .padding(.horizontal, 4)
    }
}
