//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by Fumitaka Hijino on 2018/01/27.
//  Copyright © 2018年 Fumitaka Hijino. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    
    @IBOutlet weak var bigImage: UIImageView!

    var selectedImage = #imageLiteral(resourceName: "smallDog1.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bigImage.image = selectedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
