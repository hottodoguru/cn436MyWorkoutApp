//
//  SuccessView.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 6/9/2564 BE.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedTab : Int
    var body: some View {
        VStack(alignment:.center) {
            Image(systemName: "hand.raised.fill")
                .resizable()
                .frame(width : 75 , height: 75)
                .foregroundColor(.purple)
            Text(NSLocalizedString("Nice !", comment: "Nice !"))
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text(NSLocalizedString("""
                Good job completing all exercises!
                Remember tomorrow's another day.
                So eat well and get some rest.
                """,comment: "Success Comment"))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
        }
        Button(NSLocalizedString("Continue",comment: "Continue")) {
            presentationMode.wrappedValue.dismiss()
            selectedTab = Exercise.exercises.count + 1
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(1))
    }
}
