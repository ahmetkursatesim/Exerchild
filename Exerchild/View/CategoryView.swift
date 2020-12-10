//
//  CategoryView.swift
//  Exerchild
//
//  Created by Kursat on 10.12.2020.
//

import SwiftUI

struct CategoryView: View {
    @State private var isPresentedV=false
    @State private var isPresentedN=false
    @State private var isPresentedC=false
    
    var body: some View {
        
        ZStack{
            VStack(alignment:.center){
                
                HStack{
                    
                    Button(action:{self.isPresentedN=true}){
                        Image("numbers")
                    }
                    .fullScreenCover(isPresented: $isPresentedN, content: {NumericUIView()})
                    Button(action:{self.isPresentedV=true}){
                        Image("numbers")
                    }
                    .fullScreenCover(isPresented: $isPresentedV, content: {VisualUIView()})
                    
                }
                
                Button(action:{self.isPresentedC=true}){
                    Image("numbers")
                }
                .fullScreenCover(isPresented: $isPresentedC, content: {CrosswordUIView()})
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight:0,maxHeight: .infinity,alignment: .center)
        .background(Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
        )
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
