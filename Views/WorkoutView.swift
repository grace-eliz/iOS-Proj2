//
//  WorkoutView.swift
//  iOS-Proj2
//
//  Created by Amy Cunningham on 11/11/22.
//

import SwiftUI
import AVKit

struct WorkoutView: View {
    @ObservedObject var FVM : FavoritesViewModel
    var exercise: Exercise

    var body: some View {
        VStack{
            HStack{
                Text(exercise.video_name)
                    .font(.title)
                Button {
                    FVM.updateFavorite(exercise_id: exercise.id)
                    print(FVM.isFavorite(exercise_id: exercise.id))
                } label: {
                    Image(systemName: FVM.isFavorite(exercise_id: exercise.id) ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.orange)
                        .accentColor(.yellow)
                }
                
            }
            
            WebView(video: "\(exercise.video_id)")
                .scaledToFit()
            TimerView(exercise: exercise)
                .padding(10)
            if(exercise.description != nil) {
                Text("\(exercise.description!)").padding()
            }
            Spacer()
        }
        .padding(10).navigationTitle("").navigationBarColor(Color(red: 0.0, green: 0.0, blue: 0.8, opacity: 0.3))
    }
}

class TimeManager: ObservableObject{
    @Published var seconds : Int
    @Published var curr_set = 1
    
    var exercise: Exercise
    @Published var num_sets: Int
    
    var timer : Timer?
    
    init(exercise: Exercise){
        self.exercise = exercise
        seconds = exercise.time_per_set
        num_sets = exercise.num_sets
        
        
    }
    
    func start(){
        if (timer == nil){
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                
                if(self.seconds > 0){
                    self.seconds -= 1
                }
                else {
                    if (self.curr_set < self.exercise.num_sets){
                        self.curr_set += 1
                        self.reset()
                    }
                }
            }
        }
        
    }
    func stop(){
        if(timer != nil){
            timer?.invalidate()
            timer = nil
        }
    }
    
    func reset(){
        timer?.invalidate()
        seconds = exercise.time_per_set
        timer = nil
        
    }
    
}

struct TimerView: View {
    
    @ObservedObject var TM : TimeManager
    
    
    init(exercise: Exercise){
        TM = TimeManager(exercise: exercise)
    }
    var body: some View {
        VStack{
            Text("Set \(TM.curr_set)/\(TM.num_sets)")
            Text(formattedString)
                .font(.largeTitle)
            
            HStack {
                Button {
                    TM.start()
                } label: {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30).foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.7, opacity: 0.4))
                }
                
                Button {
                    TM.stop()
                } label: {
                    Image(systemName: "pause.circle")
                        .resizable()
                        .frame(width: 30, height: 30).foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.7, opacity: 0.4))
                }
                Button {
                    TM.reset()
                } label: {
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .frame(width: 30, height: 30).foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.7, opacity: 0.4))
                }
            }
            
        }
    }
    
    
    var formattedString: String {
        let minutes = (TM.seconds % 3600) / 60
        let seconds = (TM.seconds % 3600 ) % 60
        
        return String(format: "%.2i:%.2i", minutes, seconds)
    }
}
