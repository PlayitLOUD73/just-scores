//
//  GameSuperSmallView.swift
//  Just Scores
//
//  Created by Luke Welborn on 10/7/22.
//

import SwiftUI

struct GameSuperSmallView: View {
    @Binding var game: Game
    var body: some View {
        Button(action: {}) {
            VStack {
                HStack {
                    Text(game.home_team)
                    Text(String(game.home_points))
                }.padding(.horizontal, 10.0).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.black)
                HStack {
                    Text(game.away_team)
                    Text(String(game.away_points))
                }.padding(.horizontal, 10.0).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.black)
            }
        }
            .padding(.horizontal, 15.0)
            .frame( width: 150.0, height: 80.0)
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 2.0))
            .padding(.horizontal)
}

    struct GameSuperSmallView_Previews: PreviewProvider {
        static var previews: some View {
            GameSuperSmallView(game: .constant(games[0]))
        }
    }
}
