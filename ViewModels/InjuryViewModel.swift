//
//  InjuryViewModel.swift
//  iOS-Proj2
//
//  Created by graceerk on 11/7/22.
//

import Foundation

class InjuryViewModel : ObservableObject{
    
    var injuries = [Injury]()
    
    init(){
        
        readJSONFile()
        
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
                
                for i in 0..<jsonData.injuries.count {
                    jsonData.injuries[i].id = UUID()
                }
                
                injuries = jsonData.injuries
                
                
            } catch{
                
                
            }
            
            
            
        }else{
            
        }
        
        
        
        
        
    }
    
    
}
