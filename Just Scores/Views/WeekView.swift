//
//  WeekView.swift
//  Just Scores
//
//  Created by Luke Welborn on 10/6/22.
//

import SwiftUI

struct WeekView: View {
    
    @State var week: Int = 5
    @State var gameFilter: String = "Top 25"
    @State var conferenceList = ["Top 25", "ACC", "B1G", "B12", "PAC", "SEC"]
    @State var games = [BasicGame]()
    
    func fetchGames() {
        guard let baseUrl = URL(string: "http://palladium.local:5050/gamesWeek?year=2022&week=4") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: baseUrl)
        URLSession.shared.dataTask(with: request) { data, response, _ in
            if let data = data {
                if let response = try? JSONDecoder().decode([BasicGame].self, from: data) {
                    DispatchQueue.main.async {
                        self.games = response
                    }
                    return
                }
            }
        }.resume()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Picker("Year", selection: $gameFilter) { ForEach(conferenceList, id: \.self) { Text(String($0))} }.navigationBarTitle("Week " + String(week), displayMode: .inline).navigationBarItems(trailing:
                                                                                                                                                                                                            HStack {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "calendar.circle").imageScale(.large)
                        }
                    })}
                List(games, id: \.id) {game in HStack {
                    GameMiniView(game: .constant(game))
                }
                }
            }.onAppear(perform: fetchGames)
            
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
