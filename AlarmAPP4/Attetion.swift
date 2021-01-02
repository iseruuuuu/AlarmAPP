//
//  Attetion.swift
//  AlarmAPP4
//
//  Created by 井関竜太郎 on 2021/01/02.
//

import Foundation
import UIKit

class Attention: UIViewController {
    
    
    @IBOutlet weak var check: UIButton!
    @IBOutlet weak var ok: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        check.layer.borderWidth = 3                                             // 枠線の幅
        check.layer.borderColor = UIColor.red.cgColor                            // 枠線の色
        check.layer.cornerRadius = 11.0                                             // 角丸のサイズ
        
        ok.layer.borderWidth = 3
        ok.layer.borderColor = UIColor.blue.cgColor
        ok.layer.cornerRadius = 11.0
        
    }
}
