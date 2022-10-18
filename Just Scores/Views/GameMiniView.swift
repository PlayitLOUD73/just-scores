//
//  GameMiniView.swift
//  Just Scores
//
//  Created by Luke Welborn on 10/4/22.
//

import SwiftUI

struct GameMiniView: View {
    @Binding var game: BasicGame
    var body: some View {
        Button(action: {}) {
            VStack {
                HStack {
                    AsyncImage(url: URL(string: game.home_team.logo), scale: 20.0).frame(width: 25, height:25)
                    Text(game.home_team.abbreviation)
                    Text(String(game.home_team.points))
                }.padding(.horizontal, 10.0).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.black)
                HStack {
                    AsyncImage(url: URL(string: game.away_team.logo), scale: 20.0).frame(width: 25, height:25)
                    Text(game.away_team.abbreviation)
                    Text(String(game.away_team.points))
                }.padding(.horizontal, 10.0).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.black)
            }
        }
            .padding(.horizontal, 15.0)
            .frame(height: 80.0).frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2.0))
            .padding(.horizontal)
}

    struct GameMiniView_Previews: PreviewProvider {
        static var previews: some View {
            GameMiniView(game: .constant(basicG))
        }
    }
}
