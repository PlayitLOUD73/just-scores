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

        guard let baseUrl = URL(string: "http://palladium.local:5050/games?team="
                + team + "&year=" + String(year)) else {

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
                .frame(height: 80.0).frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 2.0))
                .padding(.horizontal)
        } }.onAppear(perform: fetchGames)}

    }

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(year: .constant(2018), team: .constant("Clemson"))
    }
}
