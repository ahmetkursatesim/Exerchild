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
    
    func fetchNumericQuestion(completion: @escaping (([QuestionStringModel]) -> Void)) {
        var QuestionList=[QuestionStringModel]()
        self.ref.child("matematik").observeSingleEvent(of: .value, with:{
            (snapshot) in
            let numericQuestion=snapshot.value as! NSDictionary
            print(numericQuestion)
            for(key,value) in numericQuestion{
                let tmpval=value as! NSDictionary
                let temp=QuestionStringModel(questionNumber: "1",questionText: tmpval["soru"] as! String,correctAnswer: tmpval["cevap"]as! String,wrongAnswer1: tmpval["yanlis1"]as! String,wrongAnswer2: tmpval["yanlis2"] as! String)
            QuestionList.append(temp)
                
            }
            if (QuestionList.count>0){
                completion(QuestionList)
            }
        
        }
        )
     }
    
    func shuffList(totalCount:Int)-> Array<Int>{
        var numbers:Array<Int>=[]
        for n in 0...totalCount-1{
            
            numbers.append(n)
        }
        return numbers
    
    }
    func shuffledList(questionArray:[QuestionStringModel])->Array<String>{
        let shuffledQuestionNumber=(shuffList(totalCount: questionArray.count) as NSArray).shuffled() as! [Int]
        let questionText=questionArray[shuffledQuestionNumber[0]].questionText
        let array=[questionArray[shuffledQuestionNumber[0]].correctAnswer,questionArray[shuffledQuestionNumber[0]].wrongAnswer1,questionArray[shuffledQuestionNumber[0]].wrongAnswer2]
        let numbers=[0,1,2]
        let shuffledNumber=(numbers as NSArray).shuffled() as! [Int]
        
        let option1=array[shuffledNumber[0]]
        let option2=array[shuffledNumber[1]]
        let option3=array[shuffledNumber[2]]
        
        return [questionText,option1,option2,option3]
    }
    
    func fetchVisualQuestion() -> NSDictionary?{
        var value={} as? NSDictionary
        self.ref.child("visual").observeSingleEvent(of: .value, with:{
            (snapshot) in
             value=snapshot.value as? NSDictionary
        
        }
        )
        
        return value
    }
    
    func fetchCrosswordQuestion() -> NSDictionary?{
        var value={} as? NSDictionary
        self.ref.child("crossword").observeSingleEvent(of: .value, with:{
            (snapshot) in
             value=snapshot.value as? NSDictionary
        
        }
        )
        
        return value
    }
    
    
    
    
}

