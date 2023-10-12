//
//  CardsManager.swift
//  SwiftDataTest
//
//  Created by Hanh Vo on 10/10/23.
//

import Foundation
import SwiftData

@MainActor
class CardManager: ObservableObject {
    @Published var categories: [Category] = []
    
    func getCategories() async {
        self.categories = await SwiftDataManager.shared.fetchCategories()
    }
}
