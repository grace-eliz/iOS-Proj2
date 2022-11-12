//
//  WorkoutView.swift
//  iOS-Proj2
//
//  Created by Amy Cunningham on 11/11/22.
//

import SwiftUI

struct WorkoutListView: View {
    var exercises: [Exercise]
    @ObservedObject var IVM = InjuryViewModel()
    
    var body: some View {
        ScrollView {
            VStack() {
                ForEach(exercises) { exercise in
                    NavigationLink {
                        HStack{
    //                        print("poopy doopy@ :)")
                            Text(exercise.video_name)
                                    .font(.largeTitle)
                            Button {
                                IVM.updateFavorite(exercise_id: exercise.id)
                                print(IVM.isFavorite(exercise_id: exercise.id))
                            } label: {
                                Image(systemName: IVM.isFavorite(exercise_id: exercise.id) ? "star.fill" : "star")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(.orange)
                                    .accentColor(.yellow)
                            }
                            
                        }.padding(10)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20).fill(.white).frame(height: 320).shadow(radius: 10).padding(.horizontal)
                            VStack(spacing: 0) {
                                AsyncImage(url: URL(string: "\(exercise.video_thumbnail)")) { image in
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
                                Text("\(exercise.video_name)")
                                    .padding(.top, -50)

                            }
                        }
                    }
                    .foregroundColor(.black)

                }
            }
        }
    }
}
