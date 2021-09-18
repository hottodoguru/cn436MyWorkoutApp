//
//  TodayProgessView.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 18/9/2564 BE.
//

import SwiftUI

struct TodayProgressView: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var history : HistoryStore
    var body: some View {
        VStack(alignment: .leading) {
            Button("\(Image(systemName: "chevron.left.circle.fill"))") {
                presentationMode.wrappedValue.dismiss()
            }
            .font(.title)
            .padding()
            Form {
                let today = history.getTodayExerciseInfo()
                ForEach(0..<Exercise.exercises.count) { index in
                    HStack {
                        Text(Exercise.exercises[index].exerciserName)
                        Spacer()
                        if today?.exercises != nil , today!.exercises.contains(Exercise.exercises[index].exerciserName) {
                            Image(systemName: "checkmark").foregroundColor(.green)
                        } else {
                            Image(systemName: "checkmark").foregroundColor(.red)
                        }
                    }
                    .padding()
                    .font(.system(size: 20 , design:.rounded))
                }
            }
        }
    }
}

struct TodayProgressView_Previews: PreviewProvider {
    static var previews: some View {
        TodayProgressView()
            .environmentObject(HistoryStore())
    }
}
