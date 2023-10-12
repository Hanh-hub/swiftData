//
//  ViewModel.swift
//  SwiftDataTest
//
//  Created by Hanh Vo on 10/8/23.
//

import Foundation
import SwiftData

class CardViewModel: ObservableObject {
    @Published var currentCategory: String = ""
    @Published var word: String = ""
    @Published var definition: String = ""
    @Published var id: PersistentIdentifier?
    
    
    var modelContext: ModelContext?
    
//    init(modelContext: ModelContext) {
//        self.modelContext = modelContext
//    }
    
    func insertCard(){
        let card = Card(word: word, definition: definition)
        let category = Category(title: currentCategory)
        card.category = category
        modelContext?.insert(card)
        do {
            try modelContext?.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func insertCard2(){
        guard let id = id else {return}
        let card = Card(word: word, definition: definition)
        let category = modelContext?.model(for: id) as? Category
        
        card.category = category
        modelContext?.insert(card)
        do {
            try modelContext?.save()
        } catch let error {
            print("Error saving card ", error.localizedDescription)
        }
    }
    
    
    
}

