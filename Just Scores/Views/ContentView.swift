//
//  ContentView.swift
//  Just Scores
//
//  Created by Luke Welborn on 10/6/22.
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WeekView().tabItem{                               Image(systemName: "calendar")
                Text("Today")
            
        }
            ConferenceView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Analyze")
                            }
            Text("Deep Look").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "stop.fill")
                    Text("Home")
                }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
