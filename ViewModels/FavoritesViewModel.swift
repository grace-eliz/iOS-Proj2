//
//  FavoritesViewModel.swift
//  iOS-Proj2
//
//  Created by Grace Barnes on 11/14/22.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favoritesSet = Set<Int>()
    
    func updateFavorite(exercise_id: Int){
        if(!favoritesSet.contains(exercise_id)){
            favoritesSet.insert(exercise_id)
        }
        else{
            favoritesSet.remove(exercise_id)
        }
    }
    
    func isFavorite(exercise_id: Int) -> Bool{
        return favoritesSet.contains(exercise_id)
    }
}
