//
//  HistoryStoreDevData.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 9/9/2564 BE.
//

import Foundation


extension HistoryStore {
     func createDevData() {
        exerciseDays = [
            ExerciseDay(date: Date().addingTimeInterval(-86400),exercises: [
                Exercise.exercises[0].exerciserName,
                Exercise.exercises[1].exerciserName,
                Exercise.exercises[2].exerciserName,
                Exercise.exercises[3].exerciserName
            ]),
            ExerciseDay(date: Date().addingTimeInterval(-86400 * 2),exercises: [
                Exercise.exercises[0].exerciserName,
                Exercise.exercises[1].exerciserName
            ])
        ]
    }
}
