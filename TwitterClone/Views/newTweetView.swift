//
//  newTweetView.swift
//  TwitterClone
//
//  Created by Georgios Loulakis on 3.03.22.
//

import SwiftUI

struct newTweetView: View {
    
    @StateObject private var viewModel = viewTweetModel()
    @State private var fullText: String = ""
    
    let test = feedContentView()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnTweet : some View {
        HStack{
            Button{
                newTweet(mess: "test")
            } label: {
                Text("Tweet")
                    .font(.system(size:12))
            }
            .padding(.trailing)
            .padding(.leading)
            .background(Color.blue)
            .cornerRadius(15)
            .foregroundColor(.white)
        }
        
    }
    
    var btnBack : some View {
        Button(action: { self.presentationMode.wrappedValue.dismiss()}) {
            HStack{
                Image ("chevron.backward")
                    .renderingMode(.template)
                    .foregroundColor(.blue)
                Text("Home")
                    .foregroundColor(.blue)
            }
        }
    }
    
    var body: some View {
        VStack{
            Text("Enter your tweet below.")
                .font(.headline)
            
            TextEditor(text: $fullText)
                .foregroundColor(Color.gray)
                .font(.custom("HelveticaNeue", size: 13))
                .lineSpacing(5)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: btnBack,trailing: btnTweet)
            
        }
    }
    
    func newTweet (mess:String){
        viewModel.json(message: mess)
    }
}



struct newTweetView_Previews: PreviewProvider {
    static var previews: some View {
        
        newTweetView()
        
    }
}
