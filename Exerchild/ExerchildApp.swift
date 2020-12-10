//
//  ExerchildApp.swift
//  Exerchild
//
//  Created by Kursat on 10.12.2020.
//

import SwiftUI
import Firebase
@main
struct ExerchildApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(Appdelegate.self) var appDelegate
    var body: some Scene {
        
        WindowGroup {
            
            //ContentView()
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
            Main()
        }
    }
}
class Appdelegate:NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication,
       didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       print("firebase configured")
       FirebaseApp.configure()
       return true
     }
    
    
    
}
