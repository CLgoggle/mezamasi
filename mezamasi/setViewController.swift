//
//  setViewController.swift
//  mezamasi
//
//  Created by MAC on 2022/03/20.
//

import UIKit
import AVFoundation

class setViewController: UIViewController {
    
    let alarm = Alarm()
    
    @IBOutlet var sleepTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.time
        sleepTimePicker.setDate(Date(), animated: false)
        
        // Do any additional setup after loading the view.
    }
    
    func ViewDidAppear(_ animated:Bool){
        if alarm.sleepTimer != nil{
            alarm.stopTimer()
        }
    }
    
    @IBAction func alarmBtnWasPressed(_ sender: UIButton) {
        alarm.selectedWakeUpTime = sleepTimePicker.date
        alarm.runTimer()
        performSegue(withIdentifier: "setToSleeping", sender: nil)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
