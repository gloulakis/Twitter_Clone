//
//  newTweetView.swift
//  TwitterClone
//
//  Created by Georgios Loulakis on 3.03.22.
//

import SwiftUI

struct newTweetView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Close profile screen")
        }
    }
}

struct newTweetView_Previews: PreviewProvider {
    static var previews: some View {
        newTweetView()
    }
}
