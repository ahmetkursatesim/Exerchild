//
//  DataManagerViewModel.swift
//  Exerchild
//
//  Created by Kursat on 10.12.2020.
//

import SwiftUI
import FirebaseDatabase
class DataManagerViewModel: ObservableObject {
    var ref:DatabaseReference=Database.database().reference()
    func fetchQuestion() -> NSDictionary?{
        var value={} as? NSDictionary
        self.ref.child("matematik").observeSingleEvent(of: .value, with:{
            (snapshot) in
             value=snapshot.value as? NSDictionary
        
        }
        )
        return value
    }
    
    
}

