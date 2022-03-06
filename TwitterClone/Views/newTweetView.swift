//
//  newTweetView2.swift
//  TwitterClone
//
//  Created by Georgios Loulakis on 6.03.22.
//

import SwiftUI

struct newTweetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var fullText: String
    @State var tweetMessage:String = ""
    @StateObject private var viewModel = viewTweetModel()
    
    
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                } label : {
                    Image (systemName: "chevron.backward")
                        .renderingMode(.template)
                        .foregroundColor(.blue)
                    Text("Home")
                        .foregroundColor(Color(.systemBlue))
                }
                Spacer()
                Button{
                    fullText = tweetMessage
                    if fullText.isEmpty == false {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    
                } label : {
                    Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(Color(.white))
                        .clipShape(Capsule())
                }
            }
            .padding()
            HStack{
                VStack{
                    Text("Enter your tweet below.")
                        .font(.headline)
                        .padding()
                    
                    TextEditor(text: $tweetMessage)
                        .foregroundColor(Color.gray)
                        .font(.custom("HelveticaNeue", size: 13))
                        .lineSpacing(5)
                }
            }
        }
    }
}

struct newTweetView_Previews: PreviewProvider {
    @State static private var message = ""
    static var previews: some View {
        newTweetView(fullText: $message)
    }
}
