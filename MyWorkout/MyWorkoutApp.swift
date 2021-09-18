//
//  MyWorkoutApp.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 6/9/2564 BE.
//

import SwiftUI

import SwiftUI

@main
struct MyWorkOutApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HistoryStore())
        }
    }
}
