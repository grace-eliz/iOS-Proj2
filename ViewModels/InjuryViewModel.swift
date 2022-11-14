//
//  InjuryViewModel.swift
//  iOS-Proj2
//
//  Created by graceerk on 11/7/22.
//

import Foundation

class InjuryViewModel : ObservableObject{
    @Published var favoritesSet = Set<Int>()
    @Published var injuries = [Injury]()
    
    init(){
        
        readJSONFile()
        
    }
    
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
    
    func readJSONFile(){
        
        // 1. pathString
        let pathString = Bundle.main.path(forResource: "injuries", ofType: "json")
        
        
        if let path = pathString{
            
            // 2. URL
            let url = URL(fileURLWithPath: path)
            
            // 3. Data object
            do{
                let data = try Data(contentsOf: url)
                
                // 4. json decoder
                let jsonDecoder = JSONDecoder()
                
                // 5. get json data
                var jsonData = try jsonDecoder.decode(AllInjuries.self, from: data)
                
                injuries = jsonData.injuries
                
                
            } catch{
                
                
            }
            }else{
                print("Injury data not found.")
        }
    }
}
