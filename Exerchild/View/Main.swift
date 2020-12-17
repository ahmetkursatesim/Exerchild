//
//  Main.swift
//  Exerchild
//
//  Created by Kursat on 10.12.2020.
//

import SwiftUI

struct Main: View {
    @State private var isPresented=false
    @State private var isPresentedS=false
    var body: some View {
        ZStack{
            VStack(alignment:.center){
                HStack{
                    Button(action:{self.isPresented=true}){
                        Image("play")
                    }
                    .fullScreenCover(isPresented: $isPresented, content: {NumericUIView()})
                    Button(action:{self.isPresentedS=true}){
                        Image("jackpot")
                        
                    }.fullScreenCover(isPresented: $isPresentedS, content: {ScoreUIView()})
                   
                }
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

struct topMain: View {
    var body: some View {
        VStack{
            Spacer()
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
