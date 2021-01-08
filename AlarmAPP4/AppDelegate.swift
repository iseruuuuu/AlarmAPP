//
//  AppDelegate.swift
//  AlarmAPP4
//
//  Created by 井関竜太郎 on 2020/12/28.
//

import UIKit
import os
import BackgroundTasks

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    
    //バックグラウンドでの処理内容
    var window: UIWindow?
    var backgroundTaskID : UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 0)
    
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                if !granted {
                    let alert = UIAlertController(title: "エラー", message: "プッシュ通知が拒否されています。設定から有効にしてください。", preferredStyle: .alert)
                    let closeAction = UIAlertAction(title: "閉じる", style: .default) { _ in exit(1) }
                    alert.addAction(closeAction)
                    self.window?.rootViewController?.present(alert, animated: true, completion: nil)
                }
            })
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
   

    func applicationDidEnterBackground(_ application: UIApplication) {
   }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

   

    func applicationWillTerminate(_ application: UIApplication) {
    }

    
    
    
    
    
    /*
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 通知許可の取得
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound, .badge]){
            (granted, _) in
            if granted{
                UNUserNotificationCenter.current().delegate = self
                print("通知オン")
            }
            else {
                print("通知オフ")
            }
        }
        /*
         // 第一引数: Info.plistで定義したIdentifierを指定
         // 第二引数: タスクを実行するキューを指定。nilの場合は、デフォルトのバックグラウンドキューが利用されます。
         // 第三引数: 実行する処理
         BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.isekiSample.refresh", using: nil) { task in
         // バックグラウンド処理したい内容 ※後述します
         self.handleAppProcessing(task: task as! BGProcessingTask)
         }
         */
        
        return true
    }
 */
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        self.backgroundTaskID = application.beginBackgroundTask(){
            [weak self] in
            application.endBackgroundTask((self?.backgroundTaskID)!)
            self?.backgroundTaskID = UIBackgroundTaskIdentifier.invalid
        }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        application.endBackgroundTask(self.backgroundTaskID)
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([ .badge, .sound, .alert ])
    }
}

/*
// 通知を受け取ったときの処理
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        os_log("Notified")
        // アプリ起動時も通知を行う
        completionHandler([.sound, .alert ])
        
        //  self.notification11 = true
    }
}

*/









/*
 func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
 // Called when a new scene session is being created.
 // Use this method to select a configuration to create the new scene with.
 return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
 }
 
 func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
 // Called when the user discards a scene session.
 // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
 // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
 }
 }
 
 
 
 // 通知を受け取ったときの処理
 extension AppDelegate: UNUserNotificationCenterDelegate {
 func userNotificationCenter(_ center: UNUserNotificationCenter,
 willPresent notification: UNNotification,
 withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
 
 os_log("Notified")
 // アプリ起動時も通知を行う
 completionHandler([.sound, .alert ])
 }
 }
 
 
 */
