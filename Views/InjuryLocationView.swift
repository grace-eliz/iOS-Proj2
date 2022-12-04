//
//  InjuryLocationView.swift
//  iOS-Proj2
//
//  Created by graceerk on 11/7/22.
//

import SwiftUI

struct InjuryLocationView: View {
    @ObservedObject var FVM : FavoritesViewModel
    @ObservedObject var IVM : InjuryViewModel
    
    var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: twoColumnGrid) {
                    ForEach(IVM.injuries){ injury in
                        NavigationLink{
                            InjuryListView(FVM: FVM, injury_type_list: injury.injury_type_list)
                            
                        } label: {
                            VStack{
                                Image("\(injury.injury_type)").resizable().aspectRatio(contentMode: .fit)
                                Text(injury.injury_type.capitalized)
                            }
                        }
                        
                    }
                }.padding()
                
            }
            .navigationTitle("Locate Injury")
        }.buttonStyle(PlainButtonStyle())
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
