//
//  sleepTime.swift
//  AlarmAPP4
//
//  Created by 井関竜太郎 on 2020/12/29.
//

import Foundation
import UIKit
import AVKit

class sleepTime: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    var viewController = ViewController()
    
    private var tempTime: String = "00:00:00"
    private var setTime : String = "00:00:00"
    
    
    var Timerr: Timer!
    var alartTime = Date()
    private var onAlartTime: [String] = []
    var audioPlayer: AVAudioPlayer!
    var timeCount = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNowTime2()
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getNowTime2), userInfo: nil, repeats: true)
        
      //  updateee()
      //  _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateee), userInfo: nil, repeats: true)
        
        
        for time in onAlartTime {
            print("onAlartTime:\(time)")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //余計な文かも
        //  alarmModel = Alarms2()
        //  super.viewWillAppear(animated)
       /* if alarm.sleepTimer != nil{
            //再生されているタイマーを止める
            alarm.stopTimer()
        }
 */
    }
    
    
    
    //表示のためのもの
    @objc func getNowTime2()-> String {
        let date = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let component = calendar.components([
            .hour,
            .minute,
            .second
        ], from: date as Date)
        let hour = String(format: "%02d", component.hour!)
        let min = String(format: "%02d", component.minute!)
        let sec = String(format: "%02d", component.second!)
        let nowTime2 = ("現在の時間：" + String(hour) + "時" + String(min) + "分" + String(sec) + "秒")
        timeLabel.text = nowTime2
        return nowTime2
    }
    
    

    
    @IBAction func stop(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        timeCount = true
        //タイマーを止めなければいけない。
        //現在時間が止まっていない。お
    }    
}
