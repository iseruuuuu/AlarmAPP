/*

//  ViewController.swift
//  AlarmAPP4
//  Created by  on 2020/12/28.
//時間を設定した時間と現在時間が同じになったら、通知がなる。



import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var NowTime: UILabel!
    @IBOutlet weak var setTimeee: UILabel!
    //設定した時間を代入する。
    private var tempTime: String = "00:00:00"
    private var setTime : String = "00:00:00"
    var timer: Timer!
    var alartTime = Date()
    private var onAlartTime: [String] = []
    
    var timerr = Timerr()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //datePickerの表示の設定
        datePicker.datePickerMode = UIDatePicker.Mode.time
        datePicker.setDate(Date(), animated: false)
        // 時間管理してくれる (テキスト用)
        getNowTime2()
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getNowTime2), userInfo: nil, repeats: true)
        // 時間管理してくれる
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
    /*
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
        timer = nil
    }
 */
    
    
    @objc func updateee() {
        
        // 現在時刻を取得
        let nowTimeee = getNowTimeee()
        // timeLabelに反映
        NowTime.text = nowTimeee
        //1秒ごとに取得している？
        print("nowtime:\(nowTimeee)")
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
    
    
    //datePickerは特に必要なない？？
    @IBAction func datePicker(_ sender: AnyObject) {
        // DPの値を成形
        let format = DateFormatter()
        //時間を変換
        //format.dateFormat = "現在の時間：" + "HH時mm分ss秒"
        format.dateFormat = "HH:mm:ss"
        // 一時的にDPの値を保持
        tempTime = format.string(from: datePicker.date)
        print(tempTime)
    }
    
    @IBAction func Button(_ sender: AnyObject) {
        
        timerr.selectedWakeUpTime = datePicker.date
        timerr.time()
        
        
        // アラームをセット
        setTime = tempTime
        // date pickerでセットした値を代入
        alartTime = (datePicker.date as NSDate) as Date
        //取得できている！
        print(datePicker.date)
        //設定した時間
        NowTime.text = tempTime
        setTimeee.text = setTime
 
        
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "view1") as! sleepTime
        nextView.modalPresentationStyle = .fullScreen
        self.present(nextView, animated: true, completion: nil)
        
        print("時間を設定したよ")
        
        
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

 */
