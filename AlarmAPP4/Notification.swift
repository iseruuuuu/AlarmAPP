//
//  Notification.swift
//  AlarmAPP4
//
//  Created by 井関竜太郎 on 2021/01/01.
//

import Foundation
import UIKit

class Notification: UIViewController {
    var not1 = false
    override func viewDidLoad() {
    }
    
    func n() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
            guard granted else {
                return
            }
            for i in 1...64 {
                let content = UNMutableNotificationContent()
                content.title = "上司"
                content.body = "起きろ！！朝だぞ！ \(i)回目！！"
                content.sound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "sound.mp3"))
                let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: TimeInterval(1 + (3 * i)), repeats: false)
                let request = UNNotificationRequest.init(identifier: "identifier-\(i)", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
                //ここの操作ができない。
                if i == 10 {
                    self.not1 = true
                    print("64回")
                }
            }
        }
    }
    
    func n1() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
            guard granted else {
                return
            }
            for i in 65...128 {
                let content = UNMutableNotificationContent()
                content.title = "上司"
                content.body = "起きろ！！朝だぞ！ \(i)回目！！"
                content.sound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "sound.mp3"))
                let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: TimeInterval(1 + (3 * i)), repeats: false)
                let request = UNNotificationRequest.init(identifier: "identifier-\(i)", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
                if i == 128 {
                    print("しつこい！")
                }
            }
        }
    }
}
