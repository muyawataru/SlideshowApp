//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by 撫養航 on 2021/02/20.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var img_detail: UIImageView!
    
    var imageDetail: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img_detail.image = imageDetail
    }

}
