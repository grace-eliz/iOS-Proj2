//
//  ContentView.swift
//  Shared
//
//  Created by graceerk on 11/6/22.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
        
    var backgroundColor: Color?
    
    init( backgroundColor: Color?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
 
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                
                GeometryReader { geometry in
                    self.backgroundColor
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }

            }

        }
    }
}

extension View {
 
    func navigationBarColor(_ backgroundColor: Color?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }

}

struct ContentView: View {
    @ObservedObject var FVM = FavoritesViewModel()
    @ObservedObject var IVM = InjuryViewModel()
    @ObservedObject var EVM = ExerciseViewModel()
    
    var body: some View {
        TabView{
            InjuryLocationView(FVM: FVM, IVM: IVM)
                .tabItem{
                    Text("Locate Injury")
                    Image(systemName: "bandage")
                }
            SearchView(FVM: FVM, EVM: EVM)
                .tabItem{
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                }
            FavoritesView(FVM: FVM, EVM: EVM)
                .tabItem{
                    Text("Favorites")
                    Image(systemName: "star")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FavoritesViewModel())
    }
}
