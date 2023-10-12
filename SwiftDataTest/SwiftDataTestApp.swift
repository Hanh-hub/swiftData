//
//  SwiftDataTestApp.swift
//  SwiftDataTest
//
//  Created by Hanh Vo on 10/8/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Category.self, Card.self])
        }
    }
}

