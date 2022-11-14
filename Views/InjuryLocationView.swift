//
//  InjuryLocationView.swift
//  iOS-Proj2
//
//  Created by graceerk on 11/7/22.
//

import SwiftUI

struct InjuryLocationView: View {
    @ObservedObject var FVM : FavoritesViewModel
    @ObservedObject var IVM = InjuryViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(IVM.injuries){ injury in
                        NavigationLink{
                            InjuryListView(FVM: FVM, injury_type_list: injury.injury_type_list)
                            
                        } label: {
                            Image("\(injury.injury_type)")
                        }
                    }
                }
                
            }.navigationTitle("Injury Location")
        }
    }
}

//struct InjuryLocationView_Previews: PreviewProvider {
//    @State var favorite : Bool
//    static var previews: some View {
//
//        InjuryLocationView()
//            .environmentObject(InjuryViewModel())
//    }
//}
