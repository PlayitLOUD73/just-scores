//
// Created by Luke Welborn on 10/4/22.
//

import Foundation

struct Game: Hashable, Codable, Identifiable {
      var id: Int
//    var season: Int
//    var week: Int
//    var season_type: String
//    var start_date: Date
//    var start_time_tbd: Bool
//    var neutral_site: Bool
//    var conference_game: Bool
//    var attendance: Int
//    var venue_id: Int
//    var venue: String
//    var home_id: Int
    var home_team: String
/*    var home_conference: String
    var home_division: String*/
    var home_points: Int
/*    var home_line_scores: [Int]
    var home_post_win_prob: Float
    var home_pre_game_elo: Int
    var home_post_game_elo: Int
    var away_id: Int*/
    var away_team: String
/*    var away_conference: String
    var away_division: String*/
    var away_points: Int
//    var away_line_scores: [Int]
//    var away_post_win_prob: Float
//    var away_pre_game_elo: Int
//    var away_post_game_elo: Int
//    var excitement_index: Float
//    var highlights: String
//    var notes: String
}
