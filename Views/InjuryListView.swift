//
//  InjuryListView.swift
//  iOS-Proj2
//
//  Created by Grace Barnes on 11/9/22.
//

import SwiftUI



struct InjuryListView: View {
    
    @ObservedObject var FVM: FavoritesViewModel
    var injury_type_list: [InjuryType]
    
    var body: some View {
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(injury_type_list){ injury_type in
                        NavigationLink {
                            WorkoutListView(FVM: FVM, exercises: injury_type.exercises)
                        } label: {
                            
                            Image("\(injury_type.body_part_name)")
                                .resizable()
                                .frame(width: 250, height: 300, alignment: .center)
                            Text("\(injury_type.body_part_name)").font(.title2)
                        }
                        .foregroundColor(.black)
                    }
                }
            }.navigationTitle("Specific Injury").navigationBarColor(Color(red: 0.0, green: 0.0, blue: 0.8, opacity: 0.3))
    }
}

