//
//  ContentView.swift
//  Just Scores
//
//  Created by Luke Welborn on 10/3/22.
//

import SwiftUI


struct ContentView: View {
    var teams: [Team] = []
    
    var body: some View {
        List(teams) {
            team in HStack{
                Text(team.team)
                Text(String(team.total.wins) + "-" + String(team.total.losses))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(teams: testData)
    }
}
