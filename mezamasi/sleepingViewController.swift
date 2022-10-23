//
//  sleepingViewController.swift
//  mezamasi
//
//  Created by MAC on 2022/03/13.
//

import Foundation
import UIKit
import AVFoundation

class sleepingViewController: UIViewController {
    
    var currentTime = CurrenTime()
    
    @IBOutlet var timeLabel: UILabel!
    let alarm = Alarm()
    
    override func viewDidLoad() {
        currentTime.delegate = self
    }
    
    @IBAction func closeBtnWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func updateTime(_ time:String) {
        timeLabel.text = time
    }
}
