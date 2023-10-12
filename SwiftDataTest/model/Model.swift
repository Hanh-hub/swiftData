//
//  Model.swift
//  SwiftDataTest
//
//  Created by Hanh Vo on 10/8/23.
//

import Foundation
import SwiftData

@Model
class Category {
    @Attribute(.unique) var title: String
    init(title: String) {
        self.title = title
    }
    @Relationship(deleteRule: .cascade, inverse: \Card.category) var words: [Card]?
}


@Model
class Card {
    @Attribute(.unique) var word: String
    var definition: String
    var category: Category?
    
    init(word: String, definition: String) {
        self.word = word
        self.definition = definition
    }
    
}
