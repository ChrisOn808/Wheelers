//
//  Tabview.swift
//  Wheelers
//
//  Created by Apprenant 79 on 26/04/2023.
//

import SwiftUI

struct Tabview: View {
    @State private var selectedScreen = 0
    var body: some View {
        TabView {
            Recherche()
                        .tabItem {
                            Label("Recherche", systemImage: "magnifyingglass")
                        }
            Discussion()
                        .tabItem {
                            Label("Discussion", systemImage: "ellipsis.message.fill")
                        }
            MonProfile()
                        .tabItem {
                            Label("Mon profile", systemImage: "person.fill")
                        }
            MonTrajet(dismissModal: .constant(false))
                        .tabItem {
                            Label("Mon trajet", systemImage: "road.lanes")
                        }
                }
    }
}
struct Tabview_Previews: PreviewProvider {
    static var previews: some View {
        Tabview()
    }
}
