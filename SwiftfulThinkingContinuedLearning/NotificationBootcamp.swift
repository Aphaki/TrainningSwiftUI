//
//  NotificationBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/07/21.
//

import SwiftUI

class NotificationManager {
    static let shared = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("알림 허가 에러: \(error)")
            } else {
                print("알림 허용")
            }
        }
    }
    
    func schedule5SecondsNotification() {
        let content = UNMutableNotificationContent()
        content.title = "여기는 5초후 알림 타이틀!!!"
        content.subtitle = "여기는 5초후 알림 서브타이틀!!!"
        content.sound = .default
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func scheduleAlarmNotification() {
        let content = UNMutableNotificationContent()
        content.title = "여기는 지정시각 알림 타이틀!!"
        content.subtitle = "여기는 지정시각 알림 서브타이틀!!"
        content.sound = .default
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        
        var dateComponent = DateComponents()
        dateComponent.hour = 11
        dateComponent.minute = 4
        dateComponent.weekday = 5
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct NotificationBootcamp: View {
    var body: some View {
        VStack {
            Button {
                NotificationManager.shared.requestAuthorization()
            } label: {
                Text("알림 허가")
                    .font(.headline)
                    .padding()
                    .background(.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button {
                NotificationManager.shared.schedule5SecondsNotification()
            } label: {
                Text("클릭 5초후 알림이 옵니다")
                    .font(.headline)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button {
                NotificationManager.shared.scheduleAlarmNotification()
            } label: {
                Text("지정 시각이 되면 알림이 옵니다")
                    .font(.headline)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button {
                NotificationManager.shared.cancelNotification()
            } label: {
                Text("알림 지우기")
                    .font(.headline)
                    .padding()
                    .background(.brown)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct NotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBootcamp()
    }
}
