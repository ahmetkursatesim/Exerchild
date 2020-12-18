//
//  CoreDataViewModel.swift
//  Exerchild
//
//  Created by Kursat on 17.12.2020.
//

import SwiftUI

import CoreData
class CoreDataViewModel : ObservableObject {
    func fetchUser(viewContext:NSManagedObjectContext,entityname:String)->Bool{
        
        do {
            let fetchrequest=NSFetchRequest<NSFetchRequestResult>(entityName: entityname)
            let items=try viewContext.fetch(fetchrequest) as! [NSManagedObject]
            let userInfos=items as! [UserInfo]
            if(userInfos.count>0){
                return true
            }
            return false
            
        }catch{
            return false
        }
     
        
        
    }
    
}
