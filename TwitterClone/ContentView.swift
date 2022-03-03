//
//  ContentView.swift
//  TwitterClone
//
//  Created by Georgios Loulakis on 28.02.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            FeedView()
                .tabItem {
                    VStack{
                        Image("group4")
                    }
                }
            Text("feed")
                .tabItem {
                    VStack{
                        Image("group3")
                    }
                }
            Text("feed")
                .tabItem {
                    VStack{
                        Image("group2")
                    }
                }
            Text("feed")
                .tabItem {
                    VStack{
                        Image("group")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
