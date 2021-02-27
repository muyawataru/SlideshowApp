//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 撫養航 on 2021/02/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var img_slide: UIImageView!
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_slide: UIButton!
    @IBOutlet weak var btn_next: UIButton!
    
    var imageNum: Int = 0 //画像名配列の要素数
    let imageNamesArray: [String] = ["img0", "img1", "img2", "img3", "img4", "img5"]
    var imageNamesCount: Int!
    var timer: Timer! //タイマー用
    
    //##### プロシージャ ##### //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageNamesCount = imageNamesArray.count
    }
    // 値渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if timer != nil { //再生ボタン押下時
            // スライド停止
            slideStop()
        }
        let imageViewController = segue.destination as! ImageViewController
        imageViewController.imageDetail = img_slide.image
    }
    
    // この画面に戻ってきた時
    @IBAction func back(_ segue: UIStoryboardSegue) {
    }
 
    // 戻るボタン押下時
    @IBAction func backImage(_ sender: Any) {
        imageNum -= 1
        updateImage()
    }
    
    // 再生/一時停止 ボタン押下時
    @IBAction func slideImage(_ sender: Any) {
        // タイマー止まっている時
        if timer != nil { //再生ボタン押下時
            // スライド停止
            slideStop()
        }else{ //一時停止ボタン押下時
            // スライド開始
            slideStart()
        }
    }
    
    // 進むボタン押下時
    @IBAction func nextImage(_ sender: Any) {
        imageNum += 1
        updateImage()
    }
    
    //##### 汎用ファンクション ##### //
    
    // 1回スライド
    @objc func slideTimer(_ timer:Timer) {
        imageNum += 1
        updateImage()
    }
    
    // スライド開始
    func slideStart() {
        btn_back.isEnabled = false
        btn_next.isEnabled = false
        // 2秒毎にスライド
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideTimer(_:)), userInfo: nil, repeats: true)
        btn_slide.setTitle("一時停止", for: .normal)
    }
    
    //スライド停止
    func slideStop() {
        btn_back.isEnabled = true
        btn_next.isEnabled = true
        timer.invalidate()
        timer = nil
        btn_slide.setTitle("再生", for: .normal)
    }
    
    // 画像情報更新
    func updateImage() {
        
        if imageNum  == -1 {
            imageNum = imageNamesCount - 1
        }else if imageNum == imageNamesCount {
            imageNum = 0
        }
        img_slide.image = UIImage(named: imageNamesArray[imageNum] + ".jpg")
        
    }
    
}

