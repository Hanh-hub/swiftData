//
//  ContentView.swift
//  SwiftDataTest
//
//  Created by Hanh Vo on 10/8/23.
//

import SwiftUI
import SwiftData
struct ContentView: View {

    @Query var cats: [Category]
    
   // @StateObject var mgn = CardManager()
    
    @State var showView: Bool = false
    var body: some View {
       NavigationStack {
            TabView {
                Button(action: {showView = true}, label: {
                    Text("click to add card")
                })
                .sheet(isPresented: $showView, content: {
                    AddCardView()
                })
                    .tabItem {
                        Text("Add card")
                    }
                CategoryListView2()
                    .tabItem {
                        Text("List of Card")
                    }
            }

        }
        .padding()
    }
}
//
//#Preview {
//    ContentView()
//        .modelContainer(for: [Category.self, Card.self])
//    
//}
