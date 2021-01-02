//  ViewController.swift
//  AlarmAPP4
//  Created by  on 2020/12/28.
//時間を設定した時間と現在時間が同じになったら、通知がなる。



import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var NowTime: UILabel!
    @IBOutlet weak var setTimeee: UILabel!
    
    @IBOutlet weak var setButton: UIButton!
    
    
    //追加したもの１２/３１
    @IBOutlet weak var set: UIButton!
    @IBOutlet weak var move: UIButton!
    
    @IBOutlet weak var notSet: UIButton!
    
    //設定した時間を代入する。
    private var tempTime: String = "00:00:00"
    private var setTime : String = "00:00:00"
    var timer: Timer!
    var alartTime = Date()
    private var onAlartTime: [String] = []
    var timerr = Timerr()
    var stop = false
    
    var notification = Notification()
    
    var app = AppDelegate()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButton.layer.borderWidth = 3
        setButton.layer.borderColor = UIColor.blue.cgColor
        setButton.layer.cornerRadius = 11.0
        
        move.layer.borderWidth = 3
        move.layer.borderColor = UIColor.red.cgColor
        move.layer.cornerRadius = 11.0
        //datePickerの表示の設定
        //datePicker.datePickerMode = UIDatePicker.Mode.time
        datePicker.datePickerMode = .time
        datePicker.setDate(Date(), animated: false)
        // 時間管理してくれる (テキスト用)
        getNowTime2()
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getNowTime2), userInfo: nil, repeats: true)
        updateee()
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateee), userInfo: nil, repeats: true)
        for time in onAlartTime {
            print("onAlartTime:\(time)")
        }
       
        print(app.notification11)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    //datePickerは特に必要なない？？
    @IBAction func datePicker(_ sender: AnyObject) {
        // DPの値を成形
        let format = DateFormatter()
        //時間を変換
        //format.dateFormat = "現在の時間：" + "HH時mm分ss秒"
        format.dateFormat = "HH:mm:00"
        // 一時的にDPの値を保持
        tempTime = format.string(from: datePicker.date)
        print(tempTime)
    }
    
    
    @IBAction func set(_ sender: Any) {
        move.isHidden = false
        //false
        print(app.notification11)
    }
    
    
    
    @IBAction func notSet(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecond2", sender: nil)
    }
    
    
    @IBAction func move(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecond", sender: nil)
    }
    
    
    @IBAction func Button2(_ sender: Any) {
        
        //もし通知をオフにしていたら、設定案内画面に飛ぶ。
        if app.notification11 == true {
            print("通知を設定してね！")
            self.performSegue(withIdentifier: "toSecond2", sender: nil)
        }else{
        // アラームをセット
        setTime = tempTime
        // date pickerでセットした値を代入
        alartTime = (datePicker.date as NSDate) as Date
        //取得できている！
        print(datePicker.date)
        //設定した時間
        setTimeee.text = "時間をセットしたよ！"
        let format2 = DateFormatter()
        format2.dateFormat = "HH時mm分00秒"
        NowTime.text =  "起床の時間 : " + "\(format2.string(from: datePicker.date))"
        
    }
    }
    
    
    @objc func updateee() {
        // 現在時刻を取得
        let nowTimeee = getNowTimeee()
        //1秒ごとに取得している.
        print("nowtime:\(nowTimeee)")
        // 現在時刻が設定時刻と一緒なら
        if setTime == "00:00:00" {
        }else{
            if nowTimeee == setTime {
                print("時間になったよ！！！")
                
                move.isHidden = false
                stop = true
                
                if notification.not1 == false {
                //通知ができた！！！！６４個まで！！
                notification.n()
                }else {
                   // notification.n1()
                }
                //時間になったら、画面遷移をする！
                //self.performSegue(withIdentifier: "toSecond", sender: nil)
                
            }else{
                ///時間を過ぎたら、機能なし。　→変更の余地あり。
                if nowTimeee > setTime {
                    //  print("時間が過ぎたよ！")
                }else{
                    print("まだだよ！")
                }
            }
        }
    }
    
    
    func getNowTimeee() -> String {
        // 現在時刻を取得
        let nowTime: NSDate = NSDate()
        // 成形する
        let format = DateFormatter()
        format.dateFormat = "HH:mm:ss"
        let nowTimeStr = format.string(from: nowTime as Date)
        // 成形した時刻を文字列として返す
        return nowTimeStr
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
        myLabel.text = nowTime2
        return nowTime2
    }
}
