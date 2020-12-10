//
//  GeneralUIView.swift
//  Exerchild
//
//  Created by Kursat on 10.12.2020.
//

import SwiftUI
struct TopUIView: View {
    @State private var isPresented=false
    var body: some View {
        HStack{
            Button(action:{self.isPresented=true}){
             
                Text("Back")
            }
            .fullScreenCover(isPresented: $isPresented, content: {CategoryView()})
            
            
        }
    }
}

struct BottomUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}