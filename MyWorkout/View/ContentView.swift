//
//  ContentView.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 6/9/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9
    @EnvironmentObject private var history : HistoryStore
    var body: some View {
        let exercisecount = Exercise.exercises.count
        TabView(selection: $selectedTab){
            WelcomeView(selectedTab : $selectedTab)
                .tag(exercisecount + 1)
            ForEach(0 ..< exercisecount) { index in
                ExerciseView(selectedTab: $selectedTab,index: index)
                    .tag(index)
                    .environmentObject(history)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HistoryStore())
    }
}
