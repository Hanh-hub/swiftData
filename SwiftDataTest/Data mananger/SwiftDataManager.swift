//
//  SwiftDataManager.swift
//  SwiftDataTest
//
//  Created by Hanh Vo on 10/10/23.
//

import Foundation
import SwiftData

class SwiftDataManager {
    static let shared = SwiftDataManager()
    var modelContext: ModelContext?
    var container: ModelContainer?
    
    private init(){
        do {
            container   = try ModelContainer(for: Card.self, Category.self)
            print("model container init",  container as Any)
            
            
        } catch let error {
            print("error setting up container", error.localizedDescription)
        }
        
        
        if let container = container {
            modelContext = ModelContext(container)
            print("context init", modelContext as Any)
            
        } else {
            print("contaienr is nil")
        }
    }
    
    func fetchCategories() async -> [Category]{
        
        let descriptor = FetchDescriptor<Category>(sortBy: [SortDescriptor(\.title)])
        do {
            return try modelContext?.fetch(descriptor) ?? []
        } catch let error {
            print("cannot fetch", error.localizedDescription)
            return []
        }
 
    }
}
