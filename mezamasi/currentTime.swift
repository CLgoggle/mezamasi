//
//  currentTime.swift
//  mezamasi
//
//  Created by MAC on 2022/03/13.
//

import Foundation

class CurrenTime{
    
    var timer: Timer?
    var currentTime: String?
    var df = DateFormatter()
    weak var delegate: sleepingViewController?
    
    init() {
        if timer == nil{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCurrentTime),
                                         userInfo: nil, repeats: true)
            }
    }
    @objc private func updateCurrentTime(){
        df.dateFormat = "HH:mm"
        df.timeZone = TimeZone.current
        let timezoneDate = df.string(from: Date())
        currentTime = timezoneDate
        delegate?.updateTime(currentTime!)
    }
}
