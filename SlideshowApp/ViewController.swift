//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Fumitaka Hijino on 2018/01/27.
//  Copyright © 2018年 Fumitaka Hijino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //画像名の配列
    var images = ["smallDog1.jpg", "smallDog2.jpg", "smallDog3.jpg"]
    
    //現在表示している画像の配列番号（初期値として0をセット）
    var currentImageNo = 0
    
    // timerを定義
    var timer: Timer!
    
    // 画像を次に進める
    func forwardImage() {
        
        if currentImageNo == 2 {
            currentImageNo = 0
        }
        else {
            currentImageNo += 1
        }
        image.image = UIImage(named: images[currentImageNo])
    }
    
    // 画像を前に戻す
    func backwardImage() {
 
        if currentImageNo == 0 {
            currentImageNo = 2
        }
        else {
            currentImageNo -= 1
        }
        image.image = UIImage(named: images[currentImageNo])
        
    }
    
    
    @IBOutlet weak var startOrStop: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var backwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 最初の画像をセット
        image.image = UIImage(named: images[currentImageNo])
        
        // 再生ボタンをセット
        startOrStop.setTitle("再生", for: .normal)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // 進むボタンの動作
    @IBAction func forwardButton(_ sender: Any) {
        forwardImage()
    }

    // 戻るボタンの動作
    @IBAction func returnButton(_ sender: Any) {
        backwardImage()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のImageViewControllerを取得する
        let imageViewController:ImageViewController = segue.destination as! ImageViewController
                // 遷移先の画像に現在の画像を渡す
                imageViewController.selectedImage = image.image!
        
        // タイマーを破棄して、nilにする
        if timer != nil {
        timer.invalidate()
        timer = nil
        }
        
        // ボタン表示を「再生」に変更
        startOrStop.setTitle("再生", for: .normal)
        
        // 「進む」ボタンと「戻る」ボタンをタップ有効にする
        forwardButton.isEnabled = true
        backwardButton.isEnabled = true
        
        // 「進む」ボタンと「戻る」ボタンの色をデフォルトに戻す
        forwardButton.setTitleColor(nil, for: .normal)
        backwardButton.setTitleColor(nil, for: .normal)
        
    }
    
    // タイマーの処理内容（ターゲット）
    @objc func updateTimer(timer: Timer) {
        forwardImage()
    }
    
    // 再生/停止ボタンを押した時の動作
    @IBAction func startAndStop(_ sender: Any) {
        // 再生ボタンを押した時の動作
        if timer == nil {
            // タイマーをセット
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            // ボタン表示を「停止」に変更
            startOrStop.setTitle("停止", for: .normal)
            
            // 「進む」ボタンと「戻る」ボタンをタップ無効にする
            forwardButton.isEnabled = false
            backwardButton.isEnabled = false
            
            // 「進む」ボタンと「戻る」ボタンの色をグレーアウト
            forwardButton.setTitleColor(.gray, for: .normal)
            backwardButton.setTitleColor(.gray, for: .normal)
        }
        // 停止ボタンを押したときの動作
        else {
            // タイマーを破棄して、nilにする
            timer.invalidate()
            timer = nil
            
            // ボタン表示を「再生」に変更
            startOrStop.setTitle("再生", for: .normal)
            
            // 「進む」ボタンと「戻る」ボタンをタップ有効にする
            forwardButton.isEnabled = true
            backwardButton.isEnabled = true
            
            // 「進む」ボタンと「戻る」ボタンの色をデフォルトに戻す
            forwardButton.setTitleColor(nil, for: .normal)
            backwardButton.setTitleColor(nil, for: .normal)
        }
        
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}
