//
//  FeedView.swift
//  TwitterClone
//
//  Created by Georgios Loulakis on 1.03.22.
//

import SwiftUI

struct FeedView: View {
    
    @State private var tweetmessage = ""
    @State private var message = ""
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing){
                feedContentView()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Home")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Image("oval")
                        }
                        ToolbarItemGroup() {
                            Button {
                                // do nothing
                            } label: {
                                Image("iconSparkle")
                            }
                        }
                    }
                HStack{
                    NavigationLink(destination: newTweetView() ) {
                        Image("newTweet")
                    }
                }
            }
        }  
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
