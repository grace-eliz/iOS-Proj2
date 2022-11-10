//
//  InjuryListView.swift
//  iOS-Proj2
//
//  Created by Grace Barnes on 11/9/22.
//

import SwiftUI

struct InjuryListView: View {
    var injury_type_list: [InjuryType]
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ForEach(injury_type_list){ injury_type in
                    Text("\(injury_type.body_part_name)")
                }
            }
        }
    }
}

