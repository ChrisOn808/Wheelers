//
//  ContentView.swift
//  Wheelers
//
//  Created by Formation on 24/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(Date().formatted(date: .numeric, time: .omitted))
            .fontWeight(.bold)
            .font(.system(size: 25))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
