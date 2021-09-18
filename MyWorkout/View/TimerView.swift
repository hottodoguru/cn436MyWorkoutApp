//
//  TimerView.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 9/9/2564 BE.
//

import SwiftUI

struct TimerView : View {
    @State private var timeRemaining = 3
    @Binding var timerDone : Bool
    var timerFontSize : CGFloat
    let timeColor = [Color.white , Color.red , Color.green , Color.blue]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body : some View {
        Text("\(timeRemaining)")
            .font(.system(size: timerFontSize,design: .rounded))
            .onReceive(timer, perform: { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timerDone = true
                }
            })
            .foregroundColor(timeColor[timeRemaining])
    }
}

struct TimerView_Preview : PreviewProvider {
    static var previews: some View {
        TimerView(timerDone: .constant(true), timerFontSize: 90)
    }
}
