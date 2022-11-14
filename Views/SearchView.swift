//
//  SearchView.swift
//  iOS-Proj2
//
//  Created by graceerk on 11/7/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchQuery = ""
    @State var searchWork : DispatchWorkItem? = nil
    @ObservedObject var EVM = ExerciseViewModel()
    @State var exerciseSearchResults = [Exercise]()


    var body: some View {
        
        NavigationView{
            
            ScrollView{
                
                VStack{
                    
                    ForEach(exerciseSearchResults){ exercise in
                        
                        NavigationLink {
                            //
                            Text("\(exercise.video_name)")
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
            }.navigationTitle("Exercises")
                .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Exercises")
                .onAppear(perform: {
                    self.exerciseSearchResults = self.EVM.exercises

                })
                .onChange(of: searchQuery) { newSQ in
                    searchWork?.cancel()
                    searchWork = DispatchWorkItem(block: {
                        runSearch(newSQ: newSQ)
                    })
                    DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(50), execute: searchWork!)
                }
            
        }
    
    }
    
    func getResultNames(exerciseSearchResults: [Exercise]) -> [String]{
        var nameResults = [String]()
        for exercise in exerciseSearchResults{
            nameResults.append(exercise.video_name)
        }
        return nameResults
    }
    
    func runSearch(newSQ : String){
        
        // update the search results
        if !newSQ.isEmpty{
            
            // CAN WE RUN THIS in a background thread
            DispatchQueue.global().async {
                // run algorithm to fetch some results from a large database
                Thread.sleep(forTimeInterval: 0.3) // 100 ms
            }
            
            // return the results
            self.exerciseSearchResults = self.EVM.exercises.filter{$0.video_name.localizedCaseInsensitiveContains(newSQ)}
        }
        else{
            self.exerciseSearchResults = self.EVM.exercises
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
