//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Esteban Perez Castillejo on 7/8/24.
//

import SwiftUI

struct EmojiRatingView: View {
    let ratinng: Int
    var body: some View {
        switch ratinng{
        case 1:
            Text("1")
        case 2:
            Text("2")
        case 3:
            Text("3")
        case 4:
            Text("4")
        default:
            Text("5")
        }
    }
}

#Preview {
    EmojiRatingView(ratinng: 3)
}
