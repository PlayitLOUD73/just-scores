//
//  team.swift
//  Just Scores
//
//  Created by Luke Welborn on 10/3/22.
//

import Foundation

struct WinList {
    var games: Int
    var wins: Int
    var losses: Int
    var ties: Int
    
}

struct Team: Identifiable {
    var id = UUID()
    var year: Int
    var team: String
    var conference: String
    var division: String
    var expectedWins: Float
    var total: WinList
    var conferenceGames: WinList
    var homeGames: WinList
    var awayGames: WinList
    
}

#if DEBUG
let testData = [
    Team(year: 2018, team: "Boston College", conference: "ACC", division: "Atlantic", expectedWins: 7.5,
            total: WinList(games: 12, wins: 7, losses: 5, ties: 0),
            conferenceGames: WinList(games: 8, wins: 4, losses: 4, ties: 0),
            homeGames: WinList(games: 7, wins: 5, losses: 2, ties: 0),
            awayGames: WinList(games: 5, wins: 2, losses: 3, ties: 0)),
    Team(year: 2018, team: "Clemson", conference: "ACC", division: "Atlantic", expectedWins: 13.9,
            total: WinList(games: 15, wins: 15, losses: 0, ties: 0),
            conferenceGames: WinList(games: 9, wins: 9, losses: 0, ties: 0),
            homeGames: WinList(games: 7, wins: 7, losses: 0, ties: 0),
            awayGames: WinList(games: 5, wins: 5, losses: 0, ties: 0)),
    Team(year: 2018, team: "Duke", conference: "ACC", division: "Atlantic", expectedWins: 7.4,
            total: WinList(games: 13, wins: 8, losses: 5, ties: 0),
            conferenceGames: WinList(games: 8, wins: 3, losses: 5, ties: 0),
            homeGames: WinList(games: 6, wins: 3, losses: 3, ties: 0),
            awayGames: WinList(games: 6, wins: 4, losses: 2, ties: 0)),
    Team(year: 2018, team: "Florida State", conference: "ACC", division: "Atlantic", expectedWins: 4,
            total: WinList(games: 12, wins: 5, losses: 7, ties: 0),
            conferenceGames: WinList(games: 8, wins: 3, losses: 5, ties: 0),
            homeGames: WinList(games: 7, wins: 4, losses: 3, ties: 0),
            awayGames: WinList(games: 5, wins: 1, losses: 4, ties: 0))
]

#endif
