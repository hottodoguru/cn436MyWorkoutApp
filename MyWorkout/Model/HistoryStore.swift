//
//  HistoryStore.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 9/9/2564 BE.
//

import Foundation

struct ExerciseDay : Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String]
    
}
class HistoryStore : ObservableObject {
    @Published var exerciseDays : [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
    
    func addDoneExercise(_ exerciseName: String){
        let today = Date()
        if today.isSameDay(as: exerciseDays[0].date) {
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(
                ExerciseDay(date: today,exercises: [exerciseName]),
                at: 0
            )
        }
    }
    func getTodayExerciseInfo() -> ExerciseDay? {
        let today = exerciseDays.first {
            Date().isSameDay(as: $0.date)
        }
        return today
    }
    
    func getFirstIncompleteExercise() -> Int? {
        let allExercise = Exercise.exercises.map {
            $0.exerciserName
        }
        let firstExercise = allExercise.first {
            getTodayExerciseInfo()?.exercises.contains($0) == false
        }!
        return allExercise.firstIndex(of: firstExercise)
    }
    func getURL() -> URL?{
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{
            return nil
        }
        return url.appendingPathComponent("history.plist")
    }
    
    func addExercise(exercise: String){
        let index = exerciseDays.firstIndex {
            Date().isSameDay(as: $0.date)
        }
        if index == nil {
            exerciseDays.append(ExerciseDay(date: Date(),exercises: [exercise]))
        }else{
            if !exerciseDays[index!].exercises.contains(exercise) {
                exerciseDays[index!].exercises.append(exercise)
            }
        }
        save()
    }
    func load() {
        guard let url = getURL() else {
            print("Can't find url")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let plistData = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)
            let convertPlistData = plistData as? [[Any]] ?? []
            exerciseDays = convertPlistData.map {
                ExerciseDay(date: $0[1] as? Date ?? Date(), exercises: $0[2] as? [String] ?? [])
            }
        } catch {
            print("Error loaded file")
        }
    }
    
    func save() {
        guard let url = getURL() else {
            print("Can't find url")
            return
        }
        
        let plistData = exerciseDays.map {
            [$0.id.uuidString , $0.date , $0.exercises]
        }
        do {
            let data = try PropertyListSerialization.data(fromPropertyList: plistData, format: .binary, options: .zero)
            try data.write(to: url, options: .atomic)
        } catch {
            print("Can't save file")
        }
    }
    
}
