//
//  SwiftUIView.swift
//  MyWorkout
//
//  Created by Chanoknun Choosaksilp on 6/9/2564 BE.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int
    
    let titleText:String
    var body: some View {
        VStack{
            Text(titleText)
                .font(.largeTitle)
            HStack{
                ForEach(0 ..< 4) { index in
                    let fill = index == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index+1).circle\(fill)")
                        .onTapGesture {
                            selectedTab = index
                        }
                }
            }
            .font(.title2)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(selectedTab: .constant(0) ,titleText: "Squat")
            .previewLayout(.sizeThatFits)
        HeaderView(selectedTab: .constant(1),titleText: "Squat")
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .accessibilityLarge)
            .previewLayout(.sizeThatFits)
    }
}
