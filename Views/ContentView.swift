//
//  ContentView.swift
//  Shared
//
//  Created by graceerk on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var FVM = FavoritesViewModel()
    
    var body: some View {
        TabView{
            InjuryLocationView(FVM: FVM)
                .tabItem{
                    Text("Locate Injury")
                    Image(systemName: "bandage")
                }
            SearchView(FVM: FVM)
                .tabItem{
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                }
            FavoritesView(FVM: FVM)
                .tabItem{
                    Text("Favorites")
                    Image(systemName: "star")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FavoritesViewModel())
    }
}
