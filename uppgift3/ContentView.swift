//
//  ContentView.swift
//  uppgift3
//
//  Created by Anton Smedberg on 2023-10-11.
//

import SwiftUI

struct ContentView: View {
    let fruits = [
        Fruit(name: "Apelsin", color: .orange),
        Fruit(name: "Banan", color: .yellow),
        Fruit(name: "Citron", color: .yellow)
    ]
    @State private var selectedFruit: Fruit? = nil

    var body: some View {
        NavigationView {
            List(fruits, id: \.name) { fruit in
                NavigationLink(destination: FruitView(fruit: fruit, isSelected: $selectedFruit)) {
                    Text(fruit.name)
                        .foregroundColor(fruit.color)
                }
            }
            .navigationBarTitle("Frukter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FruitView: View {
    let fruit: Fruit
    @Binding var isSelected: Fruit?

    var body: some View {
        VStack {
            Text("Du har valt:")
                .font(.title)
                .padding(.bottom, 20)

            Text(fruit.name)
                .font(.largeTitle)
                .foregroundColor(fruit.color)
                .padding(.bottom, 40)

            Spacer()
        }
        .navigationBarTitle("Frukt")
    }
}

struct Fruit: Identifiable {
    var id = UUID()
    var name: String
    var color: Color
}





