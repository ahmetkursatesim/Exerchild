//
//  DataManagerViewModel.swift
//  Exerchild
//
//  Created by Kursat on 10.12.2020.
//

import SwiftUI
import FirebaseDatabase
import CoreData
class DataManagerViewModel: ObservableObject {
    
    var ref:DatabaseReference=Database.database().reference()
    
    func fetchNumericQuestion(completion: @escaping (([QuestionStringModel]) -> Void)) {
        var QuestionList=[QuestionStringModel]()
        self.ref.child("matematik").observeSingleEvent(of: .value, with:{
            (snapshot) in
            let numericQuestion=snapshot.value as! NSDictionary
            print(numericQuestion)
            var qnumber=0
            for(key,value) in numericQuestion{
                let tmpval=value as! NSDictionary
                let temp=QuestionStringModel(questionNumber: qnumber,questionText: tmpval["soru"] as! String,correctAnswer: tmpval["cevap"] as! String,wrongAnswer1: tmpval["yanlis1"]as! String,wrongAnswer2: tmpval["yanlis2"] as! String)
                QuestionList.append(temp)
                qnumber=qnumber+1
                
            }
            if (QuestionList.count>0){
                completion(QuestionList)
            }
        
        }
        )
     }
    
    func shuffList(questionArray:[QuestionStringModel])-> Array<Int>{
        var numbers:Array<Int>=[]
        for n in questionArray{
            
            numbers.append(n.questionNumber)
        }
        return numbers
    
    }
    func qlist(questionArray:[QuestionStringModel])-> [QuestionStringModel]{
        var  qlist:[QuestionStringModel]=[]
        for n in 0...questionArray.count-1{
            let temp=QuestionStringModel(questionNumber: n,questionText:questionArray[n].questionText ,correctAnswer:questionArray[n].correctAnswer,wrongAnswer1:questionArray[n].wrongAnswer1,wrongAnswer2: questionArray[n].wrongAnswer2)
            
            qlist.append(temp)
        }
        return qlist
    
    }
    
    func shuffledList(questionArray:[QuestionStringModel])->Array<String>{
            let shuffledQuestionNumber=(shuffList(questionArray: questionArray) as NSArray).shuffled() as! [Int]
            let questionText=questionArray[shuffledQuestionNumber[0]].questionText
            let questionNumber=questionArray[shuffledQuestionNumber[0]].questionNumber
            let correctAnswer=questionArray[shuffledQuestionNumber[0]].correctAnswer
            let array=[correctAnswer,questionArray[shuffledQuestionNumber[0]].wrongAnswer1,questionArray[shuffledQuestionNumber[0]].wrongAnswer2]
            let numbers=[0,1,2]
            let shuffledNumber=(numbers as NSArray).shuffled() as! [Int]
            
            let option1=array[shuffledNumber[0]]
            let option2=array[shuffledNumber[1]]
            let option3=array[shuffledNumber[2]]
            
            return [String(questionNumber),questionText,option1,option2,option3,correctAnswer]
            
            
        
        
       
    }
    
    func fetchUser(viewContext:NSManagedObjectContext,entityname:String)->Bool{
        
        do {
            
            let fetchrequest=NSFetchRequest<NSFetchRequestResult>(entityName: entityname)
            let items=try viewContext.fetch(fetchrequest) as! [NSManagedObject]
            let userInfos=items as! [UserInfo]
            if(userInfos.count>0){
                return true
            }
            return false
            
        }catch{
            return false
        }
     
        
        
    }
}

