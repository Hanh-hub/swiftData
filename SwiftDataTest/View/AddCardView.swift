//
//  AddCardView.swift
//  SwiftDataTest
//
//  Created by Hanh Vo on 10/9/23.
//

import SwiftUI
import SwiftData

struct AddCardView: View {

    @State var name: String = ""
    @State var showAddCatView: Bool = false
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = CardViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter a name", text: $vm.word)
            
            TextField("Enter definition", text: $vm.definition)
            
            Button {
                showAddCatView = true
            } label: {
                Text("Add new category")
            }
            .sheet(isPresented: $showAddCatView, content: {
               // AddCategory(name: $vm.currentCategory)
                AddCategory2(id: $vm.id)
            })
            
            

            Button(action: {
                //vm.modelContext = modelContext
                vm.insertCard2()
                dismiss()
            }, label: {
                Text("Save")
            })
        }
        .onAppear(perform: {
            vm.modelContext = modelContext
        })
        .padding()
        
        
    }
}

//#Preview {
//    AddCardView()
//}


