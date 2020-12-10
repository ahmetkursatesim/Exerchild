//
//  ExerchildApp.swift
//  Exerchild
//
//  Created by Kursat on 10.12.2020.
//

import SwiftUI

@main
struct ExerchildApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView()
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
            Main()
        }
    }
}
