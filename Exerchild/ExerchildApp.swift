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
    @ObservedObject var datamanager = CoreDataViewModel()
    @UIApplicationDelegateAdaptor(Appdelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            let flag=datamanager.fetchUser(viewContext:persistenceController.container.viewContext,entityname: "UserInfo")
            
            if(flag){
                Main()
            }else{
                RegisterUIView().environment(\.managedObjectContext, persistenceController.container.viewContext)
             
            }
           
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
