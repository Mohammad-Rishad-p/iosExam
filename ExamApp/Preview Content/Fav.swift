//
//  Fav.swift
//  ExamApp
//
//  Created by ddukk9 on 22/11/24.
//

import SwiftUI

struct Fav: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Banner Section
                Text("Promotions")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(1...5, id: \.self) { index in
                            VStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.yellow)
                                    .padding()
                                    .background(Color.yellow.opacity(0.2))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)

                                Text("Promotion \(index)")
                                    .font(.caption)
                                    .bold()
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)

                // Categories Section
                Text("Shop by Category")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(1...8, id: \.self) { index in
                            VStack {
                                Image(systemName: categoryIcon(for: index))
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.blue)
                                    .padding()
                                    .background(Color.blue.opacity(0.1))
                                    .clipShape(Circle())

                                Text("Category \(index)")
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // Featured Items Grid
                Text("Featured Items")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(1...10, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Image(systemName: "heart.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.red)
                                .padding()
                                .background(Color.red.opacity(0.2))
                                .cornerRadius(10)
                                .shadow(radius: 5)

                            Text("Item \(index)")
                                .font(.subheadline)
                                .fontWeight(.bold)

                            Text("$\(index * 10)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .background(Color(.systemGroupedBackground)) // Light gray background
    }
    
    // Function to return category-specific icons
    private func categoryIcon(for index: Int) -> String {
        let icons = [
            "house.fill", "cart.fill", "gamecontroller.fill",
            "headphones", "laptopcomputer", "book.fill",
            "camera.fill", "flame.fill"
        ]
        return icons[index % icons.count] // Cycle through available icons
    }
}

struct Fav_Previews: PreviewProvider {
    static var previews: some View {
        Fav()
    }
}

