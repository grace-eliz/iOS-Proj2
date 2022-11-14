//
//  ExerciseViewModel.swift
//  iOS-Proj2
//
//  Created by graceerk on 11/14/22.
//

import Foundation

class ExerciseViewModel : ObservableObject{
    @Published var exercises = [Exercise]()
    
    init(){
        
        readJSONFile()
        
    }

    func readJSONFile(){
        
        // 1. pathString
        let pathString = Bundle.main.path(forResource: "exercises", ofType: "json")
        
        
        if let path = pathString{
            
            // 2. URL
            let url = URL(fileURLWithPath: path)
            
            // 3. Data object
            do{
                let data = try Data(contentsOf: url)
                
                // 4. json decoder
                let jsonDecoder = JSONDecoder()
                
                // 5. get json data
                var jsonData = try jsonDecoder.decode(AllExercises.self, from: data)
                
                exercises = jsonData.exercises
                
                
            } catch{
                
                
            }
            }else{
                print("Exercise data not found.")
        }
    }
}

