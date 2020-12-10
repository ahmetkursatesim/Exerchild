//
//  VisualUIView.swift
//  Exerchild
//
//  Created by Kursat on 10.12.2020.
//

import SwiftUI

struct VisualUIView: View {
    var body: some View {
        ZStack{
            VStack{
                TopUIView()
                GeometryReader{geometry in
                    VStack{
                        HStack{
                            Spacer()
                        }
                        Text("Question")
                            .frame(width:geometry.size.width*90/100,height: geometry.size.height*30/100)
                            .padding(geometry.size.width*2/100)
                            .background(Color.white)
                            .cornerRadius(25)
                        Button(action:{
                            
                            
                        }){
                            HStack{
                                Text("A:")
                                Image("default_visual")
                            }
                            
                        }.frame(width:geometry.size.width*90/100,height: geometry.size.height*10/100)
                        .padding(geometry.size.width*1/100)
                        .background(Color.white)
                        .cornerRadius(25)
                        Button(action:{
                            
                            
                        }){
                            HStack{
                                Text("B:")
                                Image("default_visual")
                            }
                            
                        }
                        .frame(width:geometry.size.width*90/100,height: geometry.size.height*10/100)
                        .padding(geometry.size.width*1/100)
                        .background(Color.white)
                        .cornerRadius(25)
                        Button(action:{
                            
                            
                        }){
                            HStack{
                                Text("C:")
                                Image("default_visual")
                            }
                            
                        }
                        .frame(width:geometry.size.width*90/100,height: geometry.size.height*10/100)
                        .padding(geometry.size.width*1/100)
                        .background(Color.white)
                        .cornerRadius(25)
                    }.padding(geometry.size.width*2/100)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight:0,maxHeight: .infinity,alignment: .topLeading)
        .background(Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
        )
    }
}

struct VisualUIView_Previews: PreviewProvider {
    static var previews: some View {
        VisualUIView()
    }
}
