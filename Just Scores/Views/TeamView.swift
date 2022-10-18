//
//  TeamView.swift
//  Just Scores
//
//  Created by Luke Welborn on 10/4/22.
//

import SwiftUI

struct TeamView: View {
    
    @State var results = [Game]()
    @Binding var year: Int
    @Binding var team: String
    func fetchGames() {

        let urlTeam = team.replacingOccurrences(of: " ", with: "%20")

        guard let baseUrl = URL(string: "http://palladium.local:5050/games?team="
                + urlTeam + "&year=" + String(year)) else {

            print("Invalid URL")
            return
        }

        let request = URLRequest(url: baseUrl)
        URLSession.shared.dataTask(with: request) { data, response, _ in
                    if let data = data {
                        if let response = try? JSONDecoder().decode([Game].self, from: data) {
                            DispatchQueue.main.async {
                                self.results = response
                            }
                            return
                        }
                    }
                }.resume()

    }
    
    var body: some View {
        List(results, id: \.id){ game in VStack{
            GameMiniView(game: .constant(basicG))
        } }.onAppear(perform: fetchGames)}

    }

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(year: .constant(2018), team: .constant("Clemson"))
    }
}
