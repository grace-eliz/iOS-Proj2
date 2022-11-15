//
//  Exercise.swift
//  iOS-Proj2
//
//  Created by graceerk on 11/14/22.
//

import Foundation

struct AllExercises: Decodable {
    var exercises: [Exercise]
}

struct Exercise: Identifiable, Decodable{
    var id: Int
    var video_name: String
    var video_thumbnail: String
    var video_id: String
    var video_url: String
    var num_sets: Int
    var time_per_set: Int
}
