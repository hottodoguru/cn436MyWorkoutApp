//
//  RatingView.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 6/9/2564 BE.
//

import SwiftUI

struct RatingView: View {
    @AppStorage<Int> var rating : Int
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: (index > rating) ? "star": "star.fill")
                    .font(.title)
                    .foregroundColor((index > rating) ? .none : .yellow)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: AppStorage(wrappedValue: 0, "ratingForExercise1"))
            .previewLayout(.sizeThatFits)
    }
}
