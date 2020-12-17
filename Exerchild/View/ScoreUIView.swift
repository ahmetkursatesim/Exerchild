//
//  ScoreUIView.swift
//  Exerchild
//
//  Created by Kursat on 17.12.2020.
//

import SwiftUI

struct ScoreUIView: View {
    @State private var isPresented=false
    
    var testData=[ScoreModel(score: 15,name: "xxx"),ScoreModel(score: 12,name: "xxx"),ScoreModel(score: 10,name: "xxx")]
    var body: some View {
        VStack{
            HStack{
                Button(action:{self.isPresented=true}){
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
                .fullScreenCover(isPresented: $isPresented, content: {Main()})
                Spacer()
            }
            
            List{
                ForEach(testData){ scores in
                    Text(String(scores.score))
                }

            }
        }
        .background(Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
        )
        
       
    }
}

struct ScoreUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreUIView()
    }
}
