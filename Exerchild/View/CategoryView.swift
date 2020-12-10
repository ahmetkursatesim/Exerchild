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
                    Button(action:{self.isPresentedN=true}){
                        Text("Numeric")
                    }
                    .fullScreenCover(isPresented: $isPresentedN, content: {NumericUIView()})
                    Button(action:{self.isPresentedV=true}){
                        Text("Visual")
                    }
                    .fullScreenCover(isPresented: $isPresentedV, content: {VisualUIView()})
                    Button(action:{self.isPresentedC=true}){
                        Text("Crossword")
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
