//
//  ContentView.swift
//  Shared
//
//  Created by graceerk on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            InjuryLocationView()
                .tabItem{
                    Text("Locate Injury")
                    Image(systemName: "bandage")
                }
            SearchView()
                .tabItem{
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                }
            FavoritesView()
                .tabItem{
                    Text("Favorites")
                    Image(systemName: "star")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
