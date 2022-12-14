//
//  InjuryLocationView.swift
//  iOS-Proj2
//
//  Created by graceerk on 11/7/22.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("No error")
            }
        }
    }
    
    func scheduleNotifications(selectedDate: Date) {
        let content = UNMutableNotificationContent()
        content.title = "PocketPT"
        content.subtitle = "Don't forget to do your favorite exercises!"
        content.sound = .default
        content.badge = 1

        let selectedHour = Calendar.current.dateComponents([.hour], from: selectedDate).hour
        let selectedMin = Calendar.current.dateComponents([.minute], from: selectedDate).minute
        var dateComponents = DateComponents()
        dateComponents.hour = selectedHour
        dateComponents.minute = selectedMin
                
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct InjuryLocationView: View {
    @ObservedObject var FVM : FavoritesViewModel
    @ObservedObject var IVM : InjuryViewModel
    @State var popupShowing = false
    @State private var currentDate = Date()
    @State var notificationsAllowed = false
    @State var isLocationNavBarHidden : Bool = false

    
    var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ZStack {
            VStack(alignment: .trailing, spacing: 0) {
                Button {
                    popupShowing = true
                } label: {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 20)
                .padding(.top, 10)
                .foregroundColor(.white).frame(maxWidth: .infinity, alignment: .trailing)
                .background(
                    Color(red: 0.0, green: 0.0, blue: 0.8, opacity: 0.3))
                
                NavigationView{
                    ScrollView{
                        LazyVGrid(columns: twoColumnGrid) {
                            ForEach(IVM.injuries){ injury in
                                NavigationLink{
                                    InjuryListView(FVM: FVM, injury_type_list: injury.injury_type_list)
                                } label: {
                                    VStack{
                                        Image("\(injury.injury_type)").resizable().aspectRatio(contentMode: .fit)
                                        Text(injury.injury_type.capitalized).font(.title)
                                    }
                                }
                                
                            }
                        }.padding()
                        
                    }.navigationTitle("Locate Injury").navigationBarColor(Color(red: 0.0, green: 0.0, blue: 0.8, opacity: 0.3)).navigationViewStyle(.columns)
                }.buttonStyle(PlainButtonStyle())
                    .padding(.top, -15)
            }
        }
        .popover(isPresented: $popupShowing) {
            ZStack {
                VStack(alignment: .leading) {
                    Text("Configure Notifications")
                        .font(Font.title.weight(.semibold))
                        .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.7, opacity: 0.4))
                        .frame(alignment: .leading)
                    Button {
                        NotificationManager.instance.requestAuthorization()
                    } label: {
                        if (notificationsAllowed) {
                            Text("Turn off Notifications")
                        } else {
                            Text("Allow Notifications")
                        }
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(Color(red: 0.0, green: 0.0, blue: 0.7, opacity: 0.4))
                    .cornerRadius(5)
                    .frame(alignment: .center)
                    .padding(.top, -6)
                    .font(Font.title3.weight(.medium))
                    
                    DatePicker("Time of Notification:", selection: $currentDate, displayedComponents: [.hourAndMinute])
                        .fixedSize()
                        .padding(.top, 15)
                        .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.7, opacity: 0.4))
                        .font(Font.title3.weight(.medium))

                    Button {
                        NotificationManager.instance.scheduleNotifications(selectedDate: currentDate)
                    } label: {
                        Text("Confirm Time")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(Color(red: 0.0, green: 0.0, blue: 0.7, opacity: 0.4))
                    .cornerRadius(5)
                    .font(Font.title3.weight(.medium))
                    .frame(alignment: .center)
                    .padding(.top, -6)
                }
                
            }
        }
    }
}
