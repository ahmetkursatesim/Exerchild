//
//  NumericUIView.swift
//  Exerchild
//
//  Created by Kursat on 10.12.2020.
//

import SwiftUI

struct NumericUIView: View {
    @ObservedObject var datamanager = DataManagerViewModel()
    @State var questionArray=[QuestionStringModel]()
    @State var shuffledQuestionNumber=[Int]()
    @State var questionText=""
    @State var currentQnumber=0
    @State var option1=""
    @State var option2=""
    @State var option3=""
    var body: some View {
     
        ZStack{
            VStack{
                TopUIView()
                GeometryReader{geometry in
                    VStack{
                        HStack{
                            Spacer()
                        }
                        Text(self.questionText)
                            .frame(width:geometry.size.width*90/100,height: geometry.size.height*30/100)
                            .padding(geometry.size.width*2/100)
                            .background(Color.white)
                            .cornerRadius(25)
                        Button(action:{
                            if(self.questionArray.count>0){
                                
                                self.questionArray.remove(at:self.currentQnumber)
                                let infoArray=datamanager.shuffledList(questionArray:self.questionArray)
                                self.currentQnumber=Int(infoArray[0])!
                                self.questionText=infoArray[1]
                                self.option1=infoArray[2]
                                self.option2=infoArray[3]
                                self.option3=infoArray[4]
                            }
                           
                          
                            
                            
                            
                        }){
                            HStack{
                                Text("A:")
                                Text(self.option1)
                            }
                            
                        }.frame(width:geometry.size.width*90/100,height: geometry.size.height*10/100)
                        .padding(geometry.size.width*1/100)
                        .background(Color.white)
                        .cornerRadius(25)
                        Button(action:{
                            if(self.questionArray.count>0){
                                
                                self.questionArray.remove(at:self.currentQnumber)
                                let infoArray=datamanager.shuffledList(questionArray:self.questionArray)
                                self.currentQnumber=Int(infoArray[0])!
                                self.questionText=infoArray[1]
                                self.option1=infoArray[2]
                                self.option2=infoArray[3]
                                self.option3=infoArray[4]
                            }
                            
                        }){
                            HStack{
                                Text("B:")
                                Text(self.option2)
                            }
                            
                        }
                        .frame(width:geometry.size.width*90/100,height: geometry.size.height*10/100)
                        .padding(geometry.size.width*1/100)
                        .background(Color.white)
                        .cornerRadius(25)
                        Button(action:{
                            if(self.questionArray.count>0){
                                
                                self.questionArray.remove(at:self.currentQnumber)
                                let infoArray=datamanager.shuffledList(questionArray:self.questionArray)
                                self.currentQnumber=Int(infoArray[0])!
                                self.questionText=infoArray[1]
                                self.option1=infoArray[2]
                                self.option2=infoArray[3]
                                self.option3=infoArray[4]
                            }
                            
                        }){
                            HStack{
                                Text("C:")
                                Text(self.option3)
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
        .onAppear(perform: {
            
            datamanager.fetchNumericQuestion(){element in
                
                self.questionArray=element
                let infoArray=datamanager.shuffledList(questionArray: element)
                self.currentQnumber=Int(infoArray[0])!
                self.questionText=infoArray[1]
                self.option1=infoArray[2]
                self.option2=infoArray[3]
                self.option3=infoArray[4]
            }
        })
    }
}

struct NumericUIView_Previews: PreviewProvider {
    static var previews: some View {
        NumericUIView()
    }
}
