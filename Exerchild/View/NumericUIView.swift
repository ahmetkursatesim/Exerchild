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
    @State private var isAlertA=false
    @State private var isAlertB=false
    @State private var isAlertC=false
    @State var questionText=""
    @State var currentQnumber=0
    @State var correctAnswer=""
    @State var score="Score:0"
    @State var option1=""
    @State var option2=""
    @State var option3=""
    var body: some View {
     
        ZStack{
            VStack{
                TopUIView()
                GeometryReader{geometry in
                    
                    VStack{
                        
                        HStack(){
                            Spacer()
                            Text(self.score)
                                .frame(width:geometry.size.width*20/100,height: geometry.size.height*5/100)
                                .padding(geometry.size.width*2/100)
                                .background(Color.white)
                                .cornerRadius(25)
                                .opacity(0.75)
                          
                        }
                        Text(self.questionText)
                            .frame(width:geometry.size.width*90/100,height: geometry.size.height*30/100)
                            .padding(geometry.size.width*2/100)
                            .background(Color.white)
                            .cornerRadius(25)
                            .opacity(0.75)
                        Button(action:{
                            if(self.questionArray.count>1){
                            self.isAlertA=true
                                if(self.correctAnswer==self.option1){
                                let tmp=self.score.split(separator: ":")
                                let tmpSc=Int(tmp[1])!+1
                                self.score="Score:"+String(tmpSc)
                            }
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
                        .opacity(0.75)
                        .alert(isPresented: self.$isAlertA){
                            if(self.questionArray.count>1){
                                print(self.correctAnswer)
                                print(self.option1)
                            if(self.correctAnswer==self.option1){
                                return Alert(title: Text("Question Result"), message: Text("Correct"), dismissButton: .default(Text("Next Question!"),action:{
                                    self.questionArray.remove(at:self.currentQnumber)
                                    self.questionArray=datamanager.qlist(questionArray: self.questionArray)
                                    let infoArray=datamanager.shuffledList(questionArray:self.questionArray)
                                    self.currentQnumber=Int(infoArray[0])!
                                    self.questionText=infoArray[1]
                                    self.option1=infoArray[2]
                                    self.option2=infoArray[3]
                                    self.option3=infoArray[4]
                                    self.correctAnswer=infoArray[5]
                                }))
                            }else{
                                return Alert(title: Text("Question Result"), message: Text("Wrong"), dismissButton: .default(Text("Next Question!"),action:{
                                    self.questionArray.remove(at:self.currentQnumber)
                                    self.questionArray=datamanager.qlist(questionArray: self.questionArray)
                                    let infoArray=datamanager.shuffledList(questionArray:self.questionArray)
                                    self.currentQnumber=Int(infoArray[0])!
                                    self.questionText=infoArray[1]
                                    self.option1=infoArray[2]
                                    self.option2=infoArray[3]
                                    self.option3=infoArray[4]
                                    self.correctAnswer=infoArray[5]
                                    
                                }))
                            }
                        }else{
                            return Alert(title: Text("Question Result"), message: Text("Last Question"), dismissButton: .default(Text("Last Question!"),action:{
                                
                            }))
                        }
                        }
                        Button(action:{
                            self.isAlertB=true
                            if(self.questionArray.count>1){
                               if(self.correctAnswer==self.option2){
                                   let tmp=self.score.split(separator: ":")
                                   let tmpSc=Int(tmp[1])!+1
                                   self.score="Score:"+String(tmpSc)
                               }
                       
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
                        .opacity(0.75)
                        .alert(isPresented: self.$isAlertB){
                            if(self.questionArray.count>1){
                                print(self.correctAnswer)
                                print(self.option2)
                            if(self.correctAnswer==self.option2){
                                return Alert(title: Text("Question Result"), message: Text("Correct"), dismissButton: .default(Text("Next Question!"),action:{
                                    self.questionArray.remove(at:self.currentQnumber)
                                    self.questionArray=datamanager.qlist(questionArray: self.questionArray)
                                    let infoArray=datamanager.shuffledList(questionArray:self.questionArray)
                                    self.currentQnumber=Int(infoArray[0])!
                                    self.questionText=infoArray[1]
                                    self.option1=infoArray[2]
                                    self.option2=infoArray[3]
                                    self.option3=infoArray[4]
                                    self.correctAnswer=infoArray[5]
                                    
                                }))
                            }else{
                                return Alert(title: Text("Question Result"), message: Text("Wrong"), dismissButton: .default(Text("Next Question!"),action:{
                                    self.questionArray.remove(at:self.currentQnumber)
                                    self.questionArray=datamanager.qlist(questionArray: self.questionArray)
                                    let infoArray=datamanager.shuffledList(questionArray:self.questionArray)
                                    self.currentQnumber=Int(infoArray[0])!
                                    self.questionText=infoArray[1]
                                    self.option1=infoArray[2]
                                    self.option2=infoArray[3]
                                    self.option3=infoArray[4]
                                    self.correctAnswer=infoArray[5]
                                    
                                }))
                            }
                            }
                            else{
                                return Alert(title: Text("Question Result"), message: Text("Last Question"), dismissButton: .default(Text("Last Question!"),action:{

                                }))
                                
                            }
                            
                            
                        }
                        Button(action:{
                            self.isAlertC=true
                            if(self.questionArray.count>1){
                               if(self.correctAnswer==self.option3){
                                   let tmp=self.score.split(separator: ":")
                                   let tmpSc=Int(tmp[1])!+1
                                   self.score="Score:"+String(tmpSc)
                               }
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
                        .opacity(0.75)
                        .padding(geometry.size.width*2/100)
                        .alert(isPresented: self.$isAlertC){
                            if(self.questionArray.count>1){
                                if(self.correctAnswer==self.option3){
                                    return Alert(title: Text("Question Result"), message: Text("Correct"), dismissButton: .default(Text("Next Question!"),action:{
                                        self.questionArray.remove(at:self.currentQnumber)
                                        self.questionArray=datamanager.qlist(questionArray: self.questionArray)
                                        let infoArray=datamanager.shuffledList(questionArray:self.questionArray)
                                        self.currentQnumber=Int(infoArray[0])!
                                        self.questionText=infoArray[1]
                                        self.option1=infoArray[2]
                                        self.option2=infoArray[3]
                                        self.option3=infoArray[4]
                                        self.correctAnswer=infoArray[5]
                                        
                                    }))
                                }else{
                                    return Alert(title: Text("Question Result"), message: Text("Wrong"), dismissButton: .default(Text("Next Question!"),action:{
                                        self.questionArray.remove(at:self.currentQnumber)
                                        self.questionArray=datamanager.qlist(questionArray: self.questionArray)
                                        let infoArray=datamanager.shuffledList(questionArray:self.questionArray)
                                        self.currentQnumber=Int(infoArray[0])!
                                        self.questionText=infoArray[1]
                                        self.option1=infoArray[2]
                                        self.option2=infoArray[3]
                                        self.option3=infoArray[4]
                                        self.correctAnswer=infoArray[5]
                                        
                                    }))
                                }
                               
                            }else{
                                return Alert(title: Text("Question Result"), message: Text("Last Question"), dismissButton: .default(Text("Last Question!"),action:{
                                    
                                }))
                                
                            }
                        
                        }
                    }
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
                print("sdsds")
                self.correctAnswer=infoArray[5]
            }
        })
    }
}

struct NumericUIView_Previews: PreviewProvider {
    static var previews: some View {
        NumericUIView()
    }
}

