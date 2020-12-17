//
//  RegisterUIView.swift
//  Exerchild
//
//  Created by Kursat on 17.12.2020.
//

import SwiftUI
import CoreData

struct RegisterUIView: View {
    @ObservedObject var datamanager = DataManagerViewModel()
    @State private var isPresented=false
    @State var userEmail:String=""
  
    @Environment(\.managedObjectContext) private var viewContext
    let fetchrequest=NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
    var body: some View {
        
        GeometryReader{geometry in
        VStack{
           
            TextField("Enter the Email",text:$userEmail)
                .frame(width:geometry.size.width*90/100,height: geometry.size.height*10/100)
                .padding(geometry.size.width*1/100)
                .background(Color.white)
                .cornerRadius(25)
                .opacity(0.75)
                .multilineTextAlignment(.center)
                 
            Button(action: {
                addItem(email: userEmail)
                
            }) {
                Text("Enter Email")
            }.frame(width:geometry.size.width*90/100,height: geometry.size.height*5/100)
            .padding(geometry.size.width*1/100)
            .background(Color.white)
            .cornerRadius(25)
            .opacity(0.75)
            
       
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight:0,maxHeight: .infinity,alignment: .center)
        .background(Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all))
        .fullScreenCover(isPresented: $isPresented, content: {Main()})
        }
        
    }

    private func addItem(email:String) {
        withAnimation {
            
            if(email != ""){
                let newItem = UserInfo(context: viewContext)
                newItem.email = email
                do {
                    
                    try viewContext.save()
                    self.isPresented=true
                } catch {
                  
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                
            }
           
        }
    }

    
}
