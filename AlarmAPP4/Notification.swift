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
    
    var stopNot = false
        
    override func viewDidLoad() {
        
    }
    func n() {
        
        if stopNot == false {
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
            guard granted else {
                return
            }
            for i in 1...64 {
                let content = UNMutableNotificationContent()
                content.title = "上司"
                content.body = "起きろ！！朝だぞ！ \(i)回目！！"
                content.sound = UNNotificationSound.default
                let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: TimeInterval(0 + (3 * i)), repeats: false)
                let request = UNNotificationRequest.init(identifier: "identifier-\(i)", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
        }else{
            print("通知が終わった")
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
