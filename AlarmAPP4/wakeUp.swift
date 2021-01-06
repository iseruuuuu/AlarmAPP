//
//  wakeUp.swift
//  AlarmAPP4
//
//  Created by 井関竜太郎 on 2020/12/30.
//

import Foundation
import UIKit
import AVFoundation

class wakeUp: UIViewController,AVAudioPlayerDelegate {
    
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    
    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var again: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    var viewController = ViewController()
    var Notfication = Notification()
    
    var audioplayer:AVAudioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        again.layer.borderWidth = 3
        again.layer.borderColor = UIColor.red.cgColor
        again.layer.cornerRadius = 11.0
        finishButton.layer.borderWidth = 3
        finishButton.layer.borderColor = UIColor.blue.cgColor
        finishButton.layer.cornerRadius = 11.0
        
        
    }
    
    @IBAction func action(_ sender: AnyObject)
    {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"),for: UIControl.State())
                activePlayer = 2
            }
            else {
                sender.setImage(UIImage(named: "Nought.png"),for: UIControl.State())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 &&
                gameState[combination[0]] == gameState[combination[1]] &&
                gameState[combination[1]] == gameState[combination[2]]  {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    time2.text = "残念！もう一度挑戦してみよう"
                }
                else
                {
                    time2.text = "残念！もう一度挑戦してみよう"
                }
                
                again.isHidden = false
                time1.isHidden = false
                time2.isHidden = false
                return
            }
        }
        
        gameIsActive = false
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false {
            time2.isHidden = false
            again.isHidden = true
            finishButton.isHidden = false
            time2.isHidden = false
            time2.text = "クリア！おめでとう！"
        }
    }
    
    
    
    
    @IBAction func playAgain(_ sender: AnyObject) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        again.isHidden = true
        time2.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    
    
    @IBAction func play(_ sender: Any) {
        dismiss(animated: true, completion:  nil)
        Notfication.noSound = true
        print(Notfication.noSound)
        //ボタンを押したら、「時間をセットする」を出現させる。
        
        // Notfication.stopp()
        // 通知の削除
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        // 指定した通知を削除する
        let identifiers = ["identifier-1", "identifier-10", "identifier-100"]
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
        print("タイマーを止めたよ！")
        
    }
}


