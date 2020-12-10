//
//  NumericUIView.swift
//  Exerchild
//
//  Created by Kursat on 10.12.2020.
//

import SwiftUI

struct NumericUIView: View {
    var body: some View {
       
        
            ZStack{
                TopUIView()
                
                
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight:0,maxHeight: .infinity,alignment: .topLeading)
            .background(Image("background")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            )
        
        
        
        
        
        
    }
}

struct NumericUIView_Previews: PreviewProvider {
    static var previews: some View {
        NumericUIView()
    }
}
