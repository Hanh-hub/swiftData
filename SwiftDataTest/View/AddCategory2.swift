//
//  AddCategory2.swift
//  SwiftDataTest
//
//  Created by Hanh Vo on 10/10/23.
//

import SwiftUI
import SwiftData

struct AddCategory2: View {
    @State var name: String = ""
    @Environment(\.modelContext) var context
    @Binding var id: PersistentIdentifier?
   
   // @Binding var selectedCat: Category?
    
    @Environment(\.dismiss) var dismiss
    
    
    
    var body: some View {
        VStack {

            
            TextField("Enter a name", text: $name)
            Button {
                let category = Category(title: name)
                context.insert(category)
                do {
                    try context.save()
                    id = category.persistentModelID
                } catch {
                    print(error.localizedDescription)
                }
                
            
                dismiss()

            } label: {
                Text("SAVe")
            }
        }
        .padding()


    }
}
struct AddCategoryContainer: View {
    @State var id: PersistentIdentifier?
    var body: some View {
        AddCategory2(id: $id)
            
    }
}

#Preview {
    AddCategoryContainer()
        .modelContainer(for: [Category.self])
}
