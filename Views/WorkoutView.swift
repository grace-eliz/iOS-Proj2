//
//  WorkoutView.swift
//  iOS-Proj2
//
//  Created by Amy Cunningham on 11/11/22.
//

import SwiftUI

struct WorkoutListView: View {
    var exercises: [Exercise]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(exercises) { exercise in
                    NavigationLink {
                        
                    } label: {
                        HStack{
                            AsyncImage(url: URL(string: "\(exercise.video_thumbnail)"))
                                .aspectRatio(contentMode: .fit)
                            Text("\(exercise.video_name)")

                        }
                    }
                    .foregroundColor(.black)
                    
                }
            }
        }
    }
}
