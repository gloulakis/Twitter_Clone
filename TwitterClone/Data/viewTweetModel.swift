//
//  viewTweetModel.swift
//  TwitterClone
//
//  Created by Georgios Loulakis on 28.02.22.
//

import Foundation

class viewTweetModel:ObservableObject{
    
    @Published var tweets: [tweetsData] = []

    func fechTweets() {
        
        guard let url = Bundle.main.url(forResource: "tweets", withExtension: "json") else {
            return
        }
        guard let data = try? Data(contentsOf: url) else {return}
        
        let decoder = JSONDecoder()
        
        do{
            let tweet =  try decoder.decode([tweetsData].self, from: data)
            self.tweets = tweet
        } catch let error {
            print ("Error: \(error.localizedDescription)")
            print(error)
        }
    }
    
    func writeJSON(message:String) {
        
        let tweet = tweetsData(
            id: Int.random(in: 100...10000),
            username:"@Gloulakis",
            nickname:"George Loulakis",
            created: DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short),
            message:message,
            message_image:nil,
            replies:Int.random(in: 10...2000),
            retweets:Int.random(in: 5...100),
            favorited:Int.random(in: 50...200),
            avatar_image:""
        )
           let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
           let jsonURL = documentDirectory
               .appendingPathComponent("tweets")
               .appendingPathExtension("json")
           try? JSONEncoder().encode(tweet).write(to: jsonURL, options: .atomic)
       }
    
    func addTweet(message:String){
        
        let tweet = tweetsData(
            id: Int.random(in: 100...10000),
            username:"@Gloulakis",
            nickname:"George Loulakis",
            created: DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short),
            message:message,
            message_image:nil,
            replies:Int.random(in: 10...2000),
            retweets:Int.random(in: 5...100),
            favorited:Int.random(in: 50...200),
            avatar_image:""
        )
        
        tweets.append(tweet)
    }
    
    
    func json(message:String){
        
        let tweet = tweetsData(
            id: Int.random(in: 100...10000),
            username:"@Gloulakis",
            nickname:"George Loulakis",
            created: DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short),
            message:message,
            message_image:nil,
            replies:Int.random(in: 10...2000),
            retweets:Int.random(in: 5...100),
            favorited:Int.random(in: 50...200),
            avatar_image:""
        )
        
        do {
            
            var fileURL = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("tweets.json")
            
            let jsonData = try JSONEncoder().encode(tweet)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonData)
        
            
            
            let decodedSentences = try JSONDecoder().decode([tweetsData].self, from: jsonData)
            print(decodedSentences)
        } catch { print(error) }
        
        
        
       /* guard let data = try? JSONSerialization.data(withJSONObject: tweet, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)*/
    }
    
}


