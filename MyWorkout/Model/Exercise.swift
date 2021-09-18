//
//  Exercise.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 9/9/2564 BE.
//

import Foundation

struct Exercise {
    let exerciserName : String
    let videoName : String
    
    enum ExerciseEnum : String {
        case squat = "Squat"
        case planks = "Planks"
        case burpee = "Burpee"
        case lunges = "Lunges"
    }
}

extension Exercise {
    static let exercises = [
        Exercise(exerciserName: ExerciseEnum.squat.rawValue, videoName: "Squat"),
        Exercise(exerciserName: ExerciseEnum.planks.rawValue, videoName: "Planks"),
        Exercise(exerciserName: ExerciseEnum.burpee.rawValue, videoName: "Burpee"),
        Exercise(exerciserName: ExerciseEnum.lunges.rawValue, videoName: "Lunges")
    ]
}
