//
//  SwiftUIView.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 18/9/2564 BE.
//

import SwiftUI

struct FooterView: View {
    @EnvironmentObject private var history : HistoryStore
       @Binding var selectedTab : Int
       @Binding var showHistory : Bool
       var body: some View {
           VStack {
               let today = history.getTodayExerciseInfo()
               HStack {
                   ForEach(0..<Exercise.exercises.count) { index in
                       let fill = (index == selectedTab) ? ".fill" : ""
                       if today?.exercises != nil , today!.exercises.contains(Exercise.exercises[index].exerciserName) {
                           Image(systemName: "\(index + 1).circle\(fill)")
                               .onTapGesture {
                                   selectedTab = index
                               }
                               .font(.largeTitle)
                               .foregroundColor(.green)
                       } else {
                           Image(systemName: "\(index + 1).circle\(fill)")
                               .onTapGesture {
                                   selectedTab = index
                               }
                               .font(.largeTitle)
                               .foregroundColor(.red)
                       }
                   }
               }
               Button(NSLocalizedString("History", comment: "History")) {
                   showHistory = true
               }
               .padding()
           }
       }
   }

   struct FooterVIew_Previews: PreviewProvider {
       static var previews: some View {
           FooterView(selectedTab: .constant(0), showHistory: .constant(false))
               .previewLayout(.sizeThatFits)
               .environmentObject(HistoryStore())
       }
   }
