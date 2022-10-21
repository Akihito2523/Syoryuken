//
//  ViewController.swift
//  Syoryuken
//
//  Created by 鳥山彰仁 on 2022/10/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //BGM
    var player: AVAudioPlayer?
    
    //写真
    @IBOutlet weak var attackImage: UIImageView!
    
    //空の配列
    var imageArrayAttack : Array<UIImage> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let displayImage = UIImage(named: "attak1")
        attackImage.image = displayImage
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func syoryukenButton(_ sender: Any){
        
        //BGM
        if let soundURL = Bundle.main.url(forResource: "Shoryuken", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
            } catch {
                print("error")
            }
        }
        
        // 画像を配列に格納
        while let attackImage = UIImage(named: "attak\(imageArrayAttack.count+1)") {
            imageArrayAttack.append(attackImage)
        }
        // アニメーションの適用
        attackImage.animationImages = imageArrayAttack
        // 1.5秒間隔
        attackImage.animationDuration = 1
        // 1回繰り返し
        attackImage.animationRepeatCount = 1
        // アニメーションを開始
        attackImage.startAnimating()
    }
    
}
