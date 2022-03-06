//
//  FeedView.swift
//  TwitterClone
//
//  Created by Georgios Loulakis on 1.03.22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing){
                feedContentView()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Home")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Image("avatar_G")
                                .resizable()
                                .frame(width: 40 , height: 40)
                        }
                        ToolbarItemGroup() {
                            Button {
                                // do nothing
                            } label: {
                                Image("iconSparkle")
                            }
                        }
                    }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
.previewInterfaceOrientation(.portrait)
    }
}
