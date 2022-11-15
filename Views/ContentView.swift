//
//  ContentView.swift
//  Shared
//
//  Created by graceerk on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var FVM = FavoritesViewModel()
    @ObservedObject var IVM = InjuryViewModel()
    @ObservedObject var EVM = ExerciseViewModel()
    
    var body: some View {
        TabView{
            InjuryLocationView(FVM: FVM, IVM: IVM)
                .tabItem{
                    Text("Locate Injury")
                    Image(systemName: "bandage")
                }
            SearchView(FVM: FVM, EVM: EVM)
                .tabItem{
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                }
            FavoritesView(FVM: FVM, EVM: EVM)
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
