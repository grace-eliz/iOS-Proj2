//
//  FavoritesView.swift
//  iOS-Proj2
//
//  Created by graceerk on 11/7/22.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var FVM: FavoritesViewModel
    @ObservedObject var EVM: ExerciseViewModel
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    if(!(FVM.favoritesSet.isEmpty)){
                        ForEach(FVM.favoritesSet.sorted(), id: \.self) { favorite in
                            Text("\(EVM.exercises[favorite].video_name)")
                        }
                    }
                    else {
                        Text("No Favorites")
                            .padding([.top, .bottom], 40)
                    }

                }.padding(10)
            }.navigationTitle("Favorites")
        }.navigationBarTitleDisplayMode(.inline)
    }
}


