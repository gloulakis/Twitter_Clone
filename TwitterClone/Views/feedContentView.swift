//
//  feedContentView.swift
//  TwitterClone
//
//  Created by Georgios Loulakis on 28.02.22.
//

import SwiftUI

struct feedContentView: View {
    
    @StateObject private var viewModel = viewTweetModel()
    @State private var newTweetView = false
    @State private var newMessage = ""
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
        List{
            ForEach(viewModel.tweets, id: \.id){ tweet in
                TweetRowView (
                    avatar_image: tweet.avatar_image,
                    nickname: tweet.nickname,
                    username: tweet.username,
                    created: tweet.created,
                    message: tweet.message,
                    message_image: tweet.message_image ?? "",
                    replies: tweet.replies,
                    retweets: tweet.retweets,
                    favorited: tweet.favorited
                )
            }
        }
        .refreshable {
            if newMessage.isEmpty == false {
                addNewTweet()
            }
        }
        .listStyle(.plain)
        .buttonStyle(PlainButtonStyle())
        .listRowInsets(EdgeInsets())
        .onAppear {
            viewModel.fechTweets()
           
        }
            Button{
                newTweetView.toggle()
            } label:{
                Image("newTweet")
            }
            .fullScreenCover(isPresented: $newTweetView) {
                TwitterClone.newTweetView(fullText: $newMessage)
            }
        }
    }
    func addNewTweet (){
        if newMessage.isEmpty == false {
            viewModel.addTweet(message: newMessage)
        }
        newMessage = ""
    }
}

struct feedContentView_Previews: PreviewProvider {
    static var previews: some View {
        feedContentView()
    }
}
