//
//  GameMiniView.swift
//  Just Scores
//
//  Created by Luke Welborn on 10/4/22.
//

import SwiftUI

struct GameMiniView: View {
    var body: some View {
        Button(action: {}) {
            VStack {
                Text("Team 1\nTeam 2")
                        .padding(.horizontal, 30.0).frame(maxWidth: .infinity, alignment: .leading)
            }
        }
            .padding(.horizontal, 30.0)
            .frame(height: 100.0).frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 4.0))
            .padding(.horizontal)

}

    struct GameMiniView_Previews: PreviewProvider {
        static var previews: some View {
            GameMiniView()
        }
    }
}
