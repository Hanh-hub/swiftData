//
//  CategoryListView2.swift
//  SwiftDataTest
//
//  Created by Hanh Vo on 10/10/23.
//

import SwiftUI

import SwiftData



struct CategoryListView2: View {
    
    @Query var categories: [Category]
    @StateObject var mng = CardManager()
    var body: some View {
        VStack {
            ForEach(mng.categories){cat in
                NavigationLink(cat.title) {
                    List(cat.words ?? []){word in
                        Text(word.word)
                    }
                }

            }
        }
        .onAppear {
            Task {
                await mng.getCategories()
            }
            
        }
    }
}

//struct CategoryListViewContainer: View {
//    @State var currentCat: Category?
//    @State var vm = CardViewModel()
//
//    @Query var categories: [Category]
//    var body: some View {
//        CategoryListView(categories: categories , selectedCategory: $vm.currentCategory)
//    }
//}
#Preview {
   // CategoryListViewContainer()
    CategoryListView2()
        .modelContainer(for: [Category.self])
}
