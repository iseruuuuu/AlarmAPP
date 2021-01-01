//
//  Timer.swift
//  AlarmAPP4
//
//  Created by 井関竜太郎 on 2020/12/30.
//

import Foundation
import UIKit
import AVKit

class Timerr: UIViewController {
    
    var selectedWakeUpTime:Date?
    private var tempTime: String = "00:00:00"
    private var setTime : String = "00:00:00"
    // var timer: Timer!
    var alartTime = Date()
    private var onAlartTime: [String] = []
    
    var sleepTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    
    func time() {
        updateee()
         _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateee), userInfo: nil, repeats: true)
    }
    
    @objc func updateee() {
        // 現在時刻を取得
        let nowTimeee = getNowTimeee()
        //1秒ごとに取得している？
        print("nowtime:\(nowTimeee)")
        print()
        // 現在時刻が設定時刻と一緒なら
        if setTime == "00:00:00" {
        }else{
            if nowTimeee >= setTime {
                print("時間になったよ！！！")
                
            }else {
                print("まだだよ！")
            }
        }
    }
    
    
    func getNowTimeee() -> String {
        // 現在時刻を取得
        let nowTime: NSDate = NSDate()
        // 成形する
        let format = DateFormatter()
        format.dateFormat = "HH:mm:ss"
        // let nowTimeStr = format.stringFromDate(nowTime)
        let nowTimeStr = format.string(from: nowTime as Date)
        // 成形した時刻を文字列として返す
        return nowTimeStr
    }
    
    func stopTimer(){
        //sleepTimerがnilじゃない場合
        if sleepTimer != nil {
            //タイマーを止める
            sleepTimer?.invalidate()
            //タイマーにnil代入
            sleepTimer = nil
        }else{
            //タイマーを止める
          //  audioPlayer.stop()
        }
    }
}
