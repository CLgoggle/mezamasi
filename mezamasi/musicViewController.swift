//
//  musicViewController.swift
//  mezamasi
//
//  Created by MAC on 2022/07/24.
//

import UIKit
import AVFoundation

class musicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var table: UITableView!
    
    var songNameArray = [String]()
    var fileNameArray = [String]()
    
    var audioPlayer : AVAudioPlayer!
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        
        table.delegate = self
        
        songNameArray = ["わたしヴァンパイア", "ベノム", "マミ"]
        fileNameArray = ["わたしヴァンパイア", "ベノム", "マミ"]
        // Do any additional setup after loading the view.
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        return  cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        saveData.set(fileNameArray[indexPath.row], forKey:"キー")
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        audioPlayer.play()
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
