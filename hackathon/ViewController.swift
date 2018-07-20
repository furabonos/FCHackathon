//
//  ViewController.swift
//  hackathon
//
//  Created by 엄태형 on 2018. 7. 20..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

import FlexibleImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func cameraClick(_ sender: Any) {
    }
    
    @IBAction func filter1Click(_ sender: Any) {
    }
    
    @IBAction func filter2Click(_ sender: Any) {
    }
    
    @IBAction func filter3Click(_ sender: Any) {
    }
    
    @IBAction func filter4Click(_ sender: Any) {
    }
    
    @IBAction func saveClick(_ sender: Any) {
        guard let image = imageView.image else { return }
        //        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        //사진 저장 한후
        if let error = error {
            // we got back an error!
        } else {
            let alertmsg = UIAlertController(title: "", message: "저장되었습니다.", preferredStyle: UIAlertControllerStyle.alert)
            let alertaction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alertmsg.addAction(alertaction)
            self.present(alertmsg, animated: true)
        }
    }
    
}

