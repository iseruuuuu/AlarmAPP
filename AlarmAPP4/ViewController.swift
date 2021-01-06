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
    @IBOutlet weak var set: UIButton!
    @IBOutlet weak var move: UIButton!
    
    //設定した時間を代入する。
    private var tempTime: String = "00:00:00"
    private var setTime : String = "00:00:00"
    var timer: Timer!
    var alartTime = Date()
    private var onAlartTime: [String] = []
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
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    @IBAction func datePicker(_ sender: AnyObject) {
        let format = DateFormatter()
        format.dateFormat = "HH:mm:00"
        tempTime = format.string(from: datePicker.date)
        print(tempTime)
    }
    
    
    @IBAction func set(_ sender: Any) {
        
        let dialog = UIAlertController(title: "タイマーを再設定しますか？", message: "選択してください", preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "通知を止める", style: .default, handler:{ action in
            if self.getNowTimeee() <= self.setTime {
                //まだ通知がくる時間ではない時は、通知を止める機能は動かない。
                print("通知がまだないです。")
            }else{
                //通知が来ていたら、出現する。
                self.move.isHidden = false
                self.setButton.isHidden = false
                
            }
        }))
        dialog.addAction(UIAlertAction(title: "タイマーをリセットする", style: .default, handler:{ action in
            
            
            self.setButton.isHidden = false
            self.move.isHidden = false
            self.setTimeee.text = "時間を設定しよう！"
            self.NowTime.text =  "起床時刻 : 00時00分00秒"
            //通知が来ないから、タイマーを止められる
            self.setTime = String(0)
            
        }))
        dialog.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(dialog, animated: true, completion: nil)
        
        
    }
    
    @IBAction func move(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecond", sender: nil)
    }
    
    
    @IBAction func Button2(_ sender: Any) {
        
        //もし通知をオンにしていたら。
        if (UIApplication.shared.currentUserNotificationSettings?.types.contains( UIUserNotificationType.alert))! {
            move.isHidden = true
            setTime = tempTime
            alartTime = (datePicker.date as NSDate) as Date
            print("設定した時間は:\(alartTime)")
            setTimeee.text = "時間をセットしたよ！"
            let format2 = DateFormatter()
            format2.dateFormat = "HH時mm分00秒"
            NowTime.text =  "起床の時間 : " + "\(format2.string(from: datePicker.date))"
        } else {
            let dialog = UIAlertController(title: "通知をオンにしてください。", message: "協力お願いします", preferredStyle: .alert)
            dialog.addAction(UIAlertAction(title: "設定する", style: .default, handler:{ action in
                let url = NSURL(string:UIApplication.openSettingsURLString)!
                UIApplication.shared.openURL(url as URL)
            }))
            self.present(dialog, animated: true, completion: nil)
        }
    }
    
    
    @objc func updateee() {
        
        
        if UIApplication.shared.applicationState == .active {
            
        }else{
            //print("Background: \(NowTime)")
        }
        // 現在時刻を取得
        let nowTimeee = getNowTimeee()
        
        print("nowtime:\(nowTimeee)")
        // 現在時刻が設定時刻と一緒なら
        if setTime == "00:00:00" {
        }else{
            if nowTimeee == setTime {
                move.isHidden = false
                stop = true
                
                notification.n1()
                print("時間になりました")
            }else{
                ///時間を過ぎたら、機能なし。　→変更の余地あり。
                if nowTimeee > setTime {
                    
                    //print("時間が過ぎたよ！")
                    move.isHidden = false
                }else{
                    print("まだだよ！")
                }
            }
        }
    }
    
    
    func getNowTimeee() -> String {
        // 現在時刻を取得
        let nowTime: NSDate = NSDate()
        let format = DateFormatter()
        format.dateFormat = "HH:mm:ss"
        let nowTimeStr = format.string(from: nowTime as Date)
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
