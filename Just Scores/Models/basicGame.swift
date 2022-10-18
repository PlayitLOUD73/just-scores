//
//  basicGame.swift
//  Just Scores
//
//  Created by Luke Welborn on 10/8/22.
//

import Foundation

struct MiniTeam: Hashable, Codable, Identifiable {
    var id: Int
    var abbreviation: String
    var color: String
    var logo: String
    var points: Int
}

struct BasicGame: Hashable, Codable, Identifiable {
    var id: Int
    var home_team: MiniTeam
    var away_team: MiniTeam
}
