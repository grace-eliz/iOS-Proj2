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
                    if FVM.favoritesSet.count == 0 {
                        Text("To add favorites, visit a workout and click the star icon").padding()
                    }
                    else {
                        ForEach(FVM.favoritesSet.sorted(), id: \.self) { favorite in
                            Text("\(EVM.exercises[favorite].video_name)")
                        }
                    }

                }
            }
        }
    }
}


