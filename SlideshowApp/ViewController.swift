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
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 最初の画像をセット
        image.image = image1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 進むボタンの動作
    @IBAction func forwardButton(_ sender: Any) {
        
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

    // 戻るボタンの動作
    @IBAction func returnButton(_ sender: Any) {
        
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
    
    
}
