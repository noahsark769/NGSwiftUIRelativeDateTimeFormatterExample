//
//  ContentView.swift
//  NGSwiftUIRelativeDateTimeFormatterExample
//
//  Created by Noah Gilmore on 10/19/19.
//  Copyright © 2019 Noah Gilmore. All rights reserved.
//

import SwiftUI

// Code demonstrating the issue:
struct ContentView: View {
    static let formatter = RelativeDateTimeFormatter()

    var body: some View {
        let unixEpoch = Date(timeIntervalSince1970: 0)
        let components = Calendar.current.dateComponents(
            [.day, .year, .month, .minute, .second],
            from: Date(),
            to: unixEpoch
        )
        return VStack {
            Text("Current date is:")
            Text("\(components, formatter: Self.formatter)").bold()
            Text("since the unix Epoch")
            Spacer()
        }
    }
}

// Solution 1
//struct ContentView: View {
//    static let formatter = RelativeDateTimeFormatter()
//
//    var body: some View {
//        let unixEpoch = Date(timeIntervalSince1970: 0)
//        return VStack {
//            Text("Current date is:")
//            Text("\(unixEpoch, formatter: Self.formatter)").bold()
//            Text("since the unix Epoch")
//            Spacer()
//        }
//    }
//}

// Solution 2
//struct ContentView: View {
//    static let formatter = RelativeDateTimeFormatter()
//
//    var body: some View {
//        let unixEpoch = Date(timeIntervalSince1970: 0)
//        let components = Calendar.current.dateComponents(
//            [.day, .year, .month, .minute, .second],
//            from: Date(),
//            to: unixEpoch
//        )
//        return VStack {
//            Text("Current date is:")
//            Text("\(Self.formatter.localizedString(from: components))").bold()
//            Text("since the unix Epoch")
//            Spacer()
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
