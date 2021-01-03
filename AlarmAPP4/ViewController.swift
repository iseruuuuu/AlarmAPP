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
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    //datePickerは特に必要なない？？
    @IBAction func datePicker(_ sender: AnyObject) {
        let format = DateFormatter()
        format.dateFormat = "HH:mm:00"
        tempTime = format.string(from: datePicker.date)
        print(tempTime)
    }
    
    
    @IBAction func set(_ sender: Any) {
        move.isHidden = false
    }
    
    
    
    @IBAction func notSet(_ sender: Any) {
        
    }
    
    
    @IBAction func move(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecond", sender: nil)
    }
    
    
    @IBAction func Button2(_ sender: Any) {
        
        if (UIApplication.shared.currentUserNotificationSettings?.types.contains( UIUserNotificationType.alert))! {
            
            move.isHidden = true
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
            
        } else {
            // ダイアログ(AlertControllerのインスタンス)を生成します
            //   titleには、ダイアログの表題として表示される文字列を指定します
            //   messageには、ダイアログの説明として表示される文字列を指定します
            let dialog = UIAlertController(title: "通知をオンにしてください。", message: "協力お願いします", preferredStyle: .alert)
            // 選択肢(ボタン)を2つ(OKとCancel)追加します
            //   titleには、選択肢として表示される文字列を指定します
            //styleには、通常は「.default」、キャンセルなど操作を無効にするものは「.cancel」、削除など注意して選択すべきものは「.destructive」を指定します
            dialog.addAction(UIAlertAction(title: "設定する", style: .default, handler:{ action in
                let url = NSURL(string:UIApplication.openSettingsURLString)!
                UIApplication.shared.openURL(url as URL)
            }))
            // 生成したダイアログを実際に表示します
            self.present(dialog, animated: true, completion: nil)
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
                move.isHidden = false
                stop = true
                notification.n()
                print("時間になったよ")
             
            }else{
                ///時間を過ぎたら、機能なし。　→変更の余地あり。
                if nowTimeee > setTime {
                    print("時間が過ぎたよ！")
                   
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
