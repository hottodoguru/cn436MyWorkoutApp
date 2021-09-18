//
//  DateExtension.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 6/9/2564 BE.
//

import Foundation

extension Date {
    func formatted(as format:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    func isSameDay (as day: Date) -> Bool {
        self.yearMonthDay == day.yearMonthDay
    }
    
    var yearMonthDay : String {
        self.formatted(as: "yyyy MM dd")
    }
}
