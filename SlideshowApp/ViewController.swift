//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Fumitaka Hijino on 2018/01/27.
//  Copyright © 2018年 Fumitaka Hijino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 各画像を定義
    var image1 = #imageLiteral(resourceName: "smallDog1.jpg")
    var image2 = #imageLiteral(resourceName: "smallDog2.jpg")
    var image3 = #imageLiteral(resourceName: "smallDog3.jpg")
    
    // timerを定義
    var timer: Timer!
    
    // 画像を次に進める
    func forwardImage() {
        //1枚目の時
        if image.image == image1 {
            image.image = image2
        }
            //2枚目の時
        else if image.image == image2 {
            image.image = image3
        }
            
            //3枚目の時
        else if image.image == image3 {
            image.image = image1
        }
    }
    
    // 画像を前に戻す
    func backwardImage() {
        //1枚目の時
        if image.image == image1 {
            image.image = image3
        }
            //2枚目の時
        else if image.image == image2 {
            image.image = image1
        }
            
            //3枚目の時
        else if image.image == image3 {
            image.image = image2
        }
    }
    
    
    @IBOutlet weak var startOrStop: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var backwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 最初の画像をセット
        image.image = image1
        
        // 再生ボタンをセット
        startOrStop.setTitle("再生", for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 進むボタンの動作
    @IBAction func forwardButton(_ sender: Any) {
        if startOrStop.currentTitle == "再生" {
        forwardImage()
        }
    }

    // 戻るボタンの動作
    @IBAction func returnButton(_ sender: Any) {
        if startOrStop.currentTitle == "再生" {
        backwardImage()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のImageViewControllerを取得する
        let imageViewController:ImageViewController = segue.destination as! ImageViewController
                // 遷移先の画像に現在の画像を渡す
                imageViewController.selectedImage = image.image!
        
    }
    
    // タイマーの処理内容（ターゲット）
    @objc func updateTimer(timer: Timer) {
        forwardImage()
    }
    
    // 再生/停止ボタンを押した時の動作
    @IBAction func startAndStop(_ sender: Any) {
        // 再生ボタンを押した時の動作
        if startOrStop.currentTitle == "再生" {
            // タイマーをセット
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            // ボタン表示を「停止」に変更
            startOrStop.setTitle("停止", for: .normal)
            
            // 「進む」ボタンと「戻る」ボタンの色をグレーアウト
            forwardButton.setTitleColor(.gray, for: .normal)
            backwardButton.setTitleColor(.gray, for: .normal)
        }
        // 停止ボタンを押したときの動作
        else {
            // タイマーを破棄
            timer.invalidate()
            
            
            // ボタン表示を「再生」に変更
            startOrStop.setTitle("再生", for: .normal)
            
            // 「進む」ボタンと「戻る」ボタンの色をデフォルトに戻す
            forwardButton.setTitleColor(nil, for: .normal)
            backwardButton.setTitleColor(nil, for: .normal)
        }
        
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}
