//
//  InjuryLocationView.swift
//  iOS-Proj2
//
//  Created by graceerk on 11/7/22.
//

import SwiftUI

struct InjuryLocationView: View {
    @ObservedObject var IVM = InjuryViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(IVM.injuries){ injury in

                        NavigationLink{
                            
                        } label: {
                            Text("\(injury.injury_type)")
                        }
               
                    }
                }
                
            }
        }.navigationTitle("Country Capitals")
        /*VStack{
            ForEach(IVM.injuries){ injury in
                Text(injury.injury_type)
            }
        }*/
        
    }
}

struct InjuryLocationView_Previews: PreviewProvider {
    static var previews: some View {
        InjuryLocationView()
            .environmentObject(InjuryViewModel())
    }
}
