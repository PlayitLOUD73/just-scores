//
//  ConferenceView.swift
//  Just Scores
//
//  Created by Luke Welborn on 10/3/22.
//

import SwiftUI

struct ConferenceView: View {

    @State var results = [Team]()
    @State var conference: String = "ACC"
    @State var year: Int = 2022
    @State var conferenceList = ["ACC", "B1G", "B12", "PAC", "SEC"]
    @State var isOpen: Bool = false
    @State var team: String = "Clemson"
    func fetchTeams() {

        guard let baseUrl = URL(string: "http://palladium.local:5050/records?conference="
                + conference + "&year=" + String(year)) else {

            print("Invalid URL")
            return
        }

        let request = URLRequest(url: baseUrl)
        URLSession.shared.dataTask(with: request) { data, response, _ in
                    if let data = data {
                        if let response = try? JSONDecoder().decode([Team].self, from: data) {
                            DispatchQueue.main.async {
                                self.results = response
                            }
                            return
                        }
                    }
                }.resume()

    }

    var body: some View {
        VStack {
            HStack { Picker("Conference", selection: $conference) {
                ForEach(conferenceList, id: \.self) {item in Text(item)}
            }
            Picker("Year", selection: $year) { ForEach(1960...2022, id: \.self) { Text(String($0))} }}
            List(results, id: \.id) { team in HStack {
                Button(action: {
                    self.isOpen.toggle()
                    self.team = team.team
                }, label: {
                    Text(team.team).padding(.horizontal, 10.0).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.black)
                    Text(String(team.total.wins) + "-" + String(team.total.losses)).padding(.horizontal, 10.0).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.black)
                })}
                
            }.onAppear(perform: fetchTeams).onChange(of: self.conference) { _ in self.fetchTeams()}
                    .onChange(of: self.year) { _ in self.fetchTeams()}
        }.sheet(isPresented: $isOpen){
            TeamView(year: self.$year, team: self.$team)
        }

    }
}

struct ConferenceView_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceView()
    }
}
