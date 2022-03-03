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
}


