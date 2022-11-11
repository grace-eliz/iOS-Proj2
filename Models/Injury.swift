//
//  Injury.swift
//  iOS-Proj2
//
//  Created by graceerk on 11/7/22.
//

import Foundation

struct AllInjuries: Decodable {
    var num_injury_types: Int
    var injuries: [Injury]
}

struct Injury: Identifiable, Decodable{
    var id: Int
    var injury_type: String
    var injury_type_list: [InjuryType]
}
        
struct InjuryType: Identifiable, Decodable {
    var id: Int
    var body_part_name: String
    var exercises: [Exercise]
}

struct Exercise: Decodable{
    var id: Int
    var video_name: String
    var video_url: String
    var num_sets: Int
    var time_per_set: Int
    
}

