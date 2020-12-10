//
//  Datamanager.swift
//  Exerchild
//
//  Created by Kursat on 10.12.2020.
//

import SwiftUI


class Datamanager{
    var ref:DatabaseReference=Database.database().reference()
    func loadRemoteQuestion(){
        
        self.ref.child("matematik").observeSingleEvent(of: .value, with:{
            (snapshot) in
            let value=snapshot.value as? NSDictionary
            print(value)
            
            
        }
        )
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
