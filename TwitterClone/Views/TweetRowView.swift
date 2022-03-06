//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by Georgios Loulakis on 28.02.22.
//

import SwiftUI

struct TweetRowView: View {
    
    @State private var clickMessage:Bool = false
    @State private var clickRetweet:Bool = false
    @State private var clickFavorite:Bool = false
    @State private var clickShare:Bool = false
    
    var avatar_image: String
    var nickname: String
    var username: String
    var created: String
    var message: String
    var message_image: String
    var replies: Int
    var retweets: Int
    var favorited: Int
    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Image(avatar_image)
                Spacer()
                    .frame(width: 5)
                VStack(alignment: .leading){
                    HStack{
                        Text(nickname)
                            .bold()
                            .font(.system(size:17))
                            .lineLimit(nil)
                        Text(username)
                            .font(.system(size:17))
                            .foregroundColor(.gray)
                            .lineLimit(1)
                        Text("\(created)")
                            .font(.system(size:17))
                            .foregroundColor(.gray)
                            .lineLimit(0)
                        Spacer()
                        Image("more")
                    }
                    VStack{
                        Text(message)
                            .font(.system(size:15))
                            .multilineTextAlignment(.leading)
                            .lineLimit(10)
                    }.padding(EdgeInsets(top: 0, leading: 1, bottom: 0, trailing: 9))
                    VStack{
                        if  message_image.isEmpty == false {
                            Image(message_image)
                                .resizable()
                                .frame(width: 334)
                                .scaledToFit()
                                .cornerRadius(20)
                        } 
                    }.frame(width:330)
                    
                    Spacer()
                        .frame(height:12)
                    HStack(alignment: .bottom){
                        Spacer()
                            .frame(width:20)
                        Button{
                            if clickMessage == false {
                                self.clickMessage = true
                            } else {
                                self.clickMessage = false
                            }
                        } label:{
                            Image("reply")
                                .renderingMode(.template)
                                .foregroundColor(clickMessage ? Color.red : Color.gray)
                            Text("\(replies)")
                                .foregroundColor(clickMessage ? Color.red : Color.gray)
                        }
                        Spacer()
                            .frame(width:30)
                        Button{
                            if clickRetweet == false {
                                self.clickRetweet = true
                            } else {
                                self.clickRetweet = false
                            }
                        } label:{
                            Image("retweet")
                                .renderingMode(.template)
                                .foregroundColor(clickRetweet ? Color.green : Color.gray)
                            Text("\(retweets)")
                                .foregroundColor(clickRetweet ? Color.green : Color.gray)
                        }
                        Spacer()
                            .frame(width:30)
                        Button{
                            if clickFavorite == false {
                                self.clickFavorite = true
                            } else {
                                self.clickFavorite = false
                            }
                        } label:{
                            Image("fave")
                                .renderingMode(.template)
                                .foregroundColor(clickFavorite ? Color.blue : Color.gray)
                            Text("\(favorited)")
                                .foregroundColor(clickFavorite ? Color.blue : Color.gray)
                        }
                        Spacer()
                            .frame(width:30)
                        Button{
                            if clickShare == false {
                                self.clickShare = true
                            } else {
                                self.clickShare = false
                            }
                        } label:{
                            Image("share")
                                .renderingMode(.template)
                                .foregroundColor(clickShare ? Color.yellow : Color.gray)
                        }
                    }
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
                }
            }
        }.padding(.top)
        
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView(
            avatar_image: "avatar",
            nickname: "Aimee Harmony",
            username: "@harmony",
            created: "23/06/2019",
            message: "Umami slow-carb unicorn narwhal tousled, you probably haven't heard of them lyft irony mlkshk vexillologist.",
            message_image: "image",
            replies: 15,
            retweets: 63,
            favorited: 106
        )
            .previewInterfaceOrientation(.portrait)
    }
}

