//
//  Alarm.swift
//  mezamasi
//
//  Created by MAC on 2022/03/06.
//

import Foundation
import AVFoundation

class Alarm{
    
    var selectedWakeUpTime:Date?
    var audioPlayer: AVAudioPlayer!
    var sleepTimer: Timer?
    var seconds = 0
    var saveData: UserDefaults = UserDefaults.standard
    func runTimer(){
        seconds = calculateInterval(userAwakeTime: selectedWakeUpTime!)
        guard sleepTimer == nil else { return }
        if sleepTimer == nil{
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer),userInfo: nil, repeats: true)
            
        }
    }
    
    @objc private func updateTimer(){
        if seconds != 0{
            seconds -= 1
            
            print(seconds)
        }else{
            sleepTimer?.invalidate()
            sleepTimer = nil
            
            let soundFilePath = Bundle.main.path(forResource: saveData.string(forKey:"キー"), ofType: "mp3")!
            
            let sound:URL =  URL(fileURLWithPath: soundFilePath)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
                
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print("Cannot load file")
            }
            audioPlayer.play()
            print(audioPlayer.isPlaying)
        }
    }
    
    func stopTimer(){
        if sleepTimer != nil {
            sleepTimer!.invalidate()
            sleepTimer = nil
        }
    }
    
    private func calculateInterval(userAwakeTime:Date)-> Int{
        var interval = Int(userAwakeTime.timeIntervalSinceNow)
        if interval < 0{
            interval = 86400 - (0 - interval)
        }
        let calendar = Calendar.current
        let seconds = calendar.component(.second, from: userAwakeTime)
        return interval - seconds
    }
    
}
