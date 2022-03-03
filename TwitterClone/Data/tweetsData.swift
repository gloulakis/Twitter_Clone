//
//  tweetsData.swift
//  TwitterClone
//
//  Created by Georgios Loulakis on 28.02.22.
//

import Foundation

struct tweetsData:Codable {
    
    var id: Int
    var username: String
    var nickname: String
    var created: String
    var message: String
    var message_image: String?
    var replies: Int
    var retweets: Int
    var favorited: Int
    var avatar_image: String
    
}
