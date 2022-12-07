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
                            NavigationLink {
                                WorkoutView(FVM: FVM, exercise: EVM.exercises[favorite])
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20).fill(.white).frame(width: 320, height: 320).shadow(radius: 10).padding(.horizontal)
                                    VStack(spacing: 0) {
                                        AsyncImage(url: URL(string: "\(EVM.exercises[favorite].video_thumbnail)")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .cornerRadius(20)
                                                .padding(.top, -30)
                                                .shadow(radius: 10)
                                        } placeholder: {
                                            Color.gray
                                        }
                                        .frame(width: 300, height: 350)
                                        Text("\(EVM.exercises[favorite].video_name)")
                                            .padding(.top, -50)
                                        
                                    }
                                }
                            }.foregroundColor(.black)
                        }
                    }
                    else {
                        Text("To add favorites, visit a workout and click the star icon")
                            .padding([.top, .bottom], 40)
                    }

                }.padding(10)
            }.navigationTitle("Favorites")
        }.navigationBarTitleDisplayMode(.inline)
    }
}


