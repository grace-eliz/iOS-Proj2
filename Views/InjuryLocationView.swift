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
        Text("Hello, Injury List!")
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
