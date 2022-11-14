//
//  WorkoutView.swift
//  iOS-Proj2
//
//  Created by Amy Cunningham on 11/11/22.
//

import SwiftUI

struct WorkoutListView: View {
    var exercises: [Exercise]
    @ObservedObject var IVM = InjuryViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack() {
                ForEach(exercises) { exercise in
                    NavigationLink {
                        VStack{
                            HStack{
                                //                        print("poopy doopy@ :)")
                                Text(exercise.video_name)
                                    .font(.largeTitle)
                                Button {
                                    IVM.updateFavorite(exercise_id: exercise.id)
                                    print(IVM.isFavorite(exercise_id: exercise.id))
                                } label: {
                                    Image(systemName: IVM.isFavorite(exercise_id: exercise.id) ? "star.fill" : "star")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .aspectRatio(contentMode: .fill)
                                        .foregroundColor(.orange)
                                        .accentColor(.yellow)
                                }
                                
                                
                            }.padding(10)
                            
                            TimerView(exercise: exercise)
                            
                        }
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
        }
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
                        .frame(width: 30, height: 30)
                }
                
                Button {
                    TM.stop()
                } label: {
                    Image(systemName: "pause.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                Button {
                    TM.reset()
                } label: {
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .frame(width: 30, height: 30)
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
