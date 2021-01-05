//
//  Notification.swift
//  AlarmAPP4
//
//  Created by 井関竜太郎 on 2021/01/01.
//

import Foundation
import UIKit
import AVKit

class Notification: UIViewController {
    var not1 = false
    
    var stopNot = false
    
    //var audioPlayer : AVAudioPlayer!
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        
    }
    
    
    func n1() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
            guard granted else {
                return
            }
            for i in 1...64 {
                let content = UNMutableNotificationContent()
                content.title = "上司"
                //content.body = "起きろ！！朝だぞ！ \(i)回目！！"
                content.body = "起きろ！！朝だぞ！ \(i)回目！！"
                content.sound = UNNotificationSound.default
                let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: TimeInterval(0 + (3 * i)), repeats: false)
                let request = UNNotificationRequest.init(identifier: "identifier-\(i)", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    
    
    
    func n() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
            guard granted else {
                return
            }
            for i in 1...20 {
                let content = UNMutableNotificationContent()
                content.title = "上司"
                //content.body = "起きろ！！朝だぞ！ \(i)回目！！"
                content.body = "起きろ！！朝だぞ！ \(i)回目！！"
                content.sound = UNNotificationSound.default
                let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: TimeInterval(60 + (3 * i)), repeats: true)
                let request = UNNotificationRequest.init(identifier: "identifier-\(i)", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    func sound() {
        //音源のパス
        let soundFilePath = Bundle.main.path(forResource: "n90", ofType: "mp3")!
        //パスのURL
        let sound:URL = URL(fileURLWithPath: soundFilePath)
        do {
            //AVAudioPlayerを作成
            audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
        } catch {
            print("Could not load file")
        }
        //再生
        audioPlayer.play()
    }
    
    func stopp() {
        audioPlayer.stop()
    }
    
    
    
    
}
