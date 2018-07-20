//
//  ViewController.swift
//  hackathon
//
//  Created by 엄태형 on 2018. 7. 20..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import MobileCoreServices
import UIKit

import FlexibleImage

class ViewController: UIViewController {

    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    let imagePickerController = UIImagePickerController()
    var selectedImage = UIImage()
    var picture = String()
    var images = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"]
    var imageViews = Array<UIButton>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerController.delegate = self
        //
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "handleTapGesture:"))
        for i in 0..<images.count {
            imageViews.append(UIButton(frame: CGRect(x: 0 + (i * 40), y: 0, width: 40, height: 40)))
            imageViews[i].setBackgroundImage(UIImage(named: images[i]), for: .normal)
            imageViews[i].setTitle("\(i+1)", for: .highlighted)
            scrollView.contentSize = CGSize(width: 2000 , height: 45)
            imageViews[i].addTarget(self, action: #selector(emojiClick(_:)), for: .touchUpInside)
            scrollView.addSubview(imageViews[i])
        }
    }
    @IBAction func deleteClick(_ sender: Any) {
        for v in imageView.subviews{
            v.removeFromSuperview()
        }
    }
    
    // Camera iCON Button Setting
    
    @IBAction func cameraClick(_ sender: Any) {
        let choiceOptionAlertController = UIAlertController(
            title: "메뉴를 선택하세요",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        let takePhotoAction = UIAlertAction(title: "사진 촬영", style: .default) { _ in
            print("takePhotoAction")
            
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
            self.imagePickerController.sourceType = .camera
            self.imagePickerController.allowsEditing = false
            
            self.present(self.imagePickerController, animated: true)
        }
        
        let openGalleryAction = UIAlertAction(title: "갤러리에서 가져오기", style: .default) { _ in
            print("openAlbumAction")
            
            let type = UIImagePickerControllerSourceType.photoLibrary
            guard UIImagePickerController.isSourceTypeAvailable(type) else { return }
            
            self.imagePickerController.sourceType = type
            self.present(self.imagePickerController, animated: true)
            
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { _ in
            print("cancelAction")
            
            
        }
        
        choiceOptionAlertController.addAction(takePhotoAction)
        choiceOptionAlertController.addAction(openGalleryAction)
        choiceOptionAlertController.addAction(cancelAction)
        
        present(choiceOptionAlertController, animated: true)
    }
    
    @IBAction func firstCamera(_ sender: Any) {
        let choiceOptionAlertController = UIAlertController(
            title: "메뉴를 선택하세요",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        let takePhotoAction = UIAlertAction(title: "사진 촬영", style: .default) { _ in
            print("takePhotoAction")
            
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
            self.imagePickerController.sourceType = .camera
            self.imagePickerController.allowsEditing = false
            
            self.present(self.imagePickerController, animated: true)
        }
        
        let openGalleryAction = UIAlertAction(title: "갤러리에서 가져오기", style: .default) { _ in
            print("openAlbumAction")
            
            let type = UIImagePickerControllerSourceType.photoLibrary
            guard UIImagePickerController.isSourceTypeAvailable(type) else { return }
            
            self.imagePickerController.sourceType = type
            self.present(self.imagePickerController, animated: true)
            
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { _ in
            print("cancelAction")
            
            
        }
        
        choiceOptionAlertController.addAction(takePhotoAction)
        choiceOptionAlertController.addAction(openGalleryAction)
        choiceOptionAlertController.addAction(cancelAction)
        
        present(choiceOptionAlertController, animated: true)
    }
    
    // First filter Setting
    
    @IBAction func filter1Click(_ sender: Any) {
        print("Click filter1")
        guard imageView.image != nil else { return }
        let warmFilter = selectedImage.adjust()
            .exclusion(color: UIColor(red: 0, green: 0, blue: 0.352941176, alpha: 1.0))
            .image()
        imageView.image = warmFilter
        
    }
    
    // Second filter Setting
    
    @IBAction func filter2Click(_ sender: Any) {
        print("Click filter2")
        guard imageView.image != nil else { return }
        let firstFilter = selectedImage.adjust()
            .exclusion(color: UIColor(red: 0, green: 0, blue: 0.352941176, alpha: 1))
            .linearDodge(color: UIColor(red: 0.125490196, green: 0.058823529, blue: 0.192156863, alpha: 1.0))
            .image()
        imageView.image = firstFilter
    }
    
    // Third filter Setting
    
    @IBAction func filter3Click(_ sender: Any) {
        print("Click filter3")
        guard imageView.image != nil else { return }
        let firstFilter = selectedImage.adjust()
            .exclusion(color: UIColor(red: 0, green: 0, blue: 0.352941176, alpha: 1))
            .linearDodge(color: UIColor(red: 0.125490196, green: 0.058823529, blue: 0.192156863, alpha: 1.0))
            .hardMix(color: UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0))
            .image()
        imageView.image = firstFilter
    }
    
    // Fourth filter Setting
    
    @IBAction func filter4Click(_ sender: Any) {
        print("Click filter4")
        guard imageView.image != nil else { return }
        let vividFilter = selectedImage.adjust()
//            .exclusion(color: UIColor(red: 0, green: 0.152941176, blue: 0, alpha: 1.0))
            .vibrance(1.0)
            .image()
        imageView.image = vividFilter
    }
    
    @IBAction func originalClick(_ sender: Any) {
        guard imageView.image != nil else { return }
        imageView.image = selectedImage
    }
    
    
    @IBAction func saveClick(_ sender: Any) {
        guard let image = imageView.image else { return }
        //        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        let snapshotImage = UIImage.imageWithView(view: imageView)
        UIImageWriteToSavedPhotosAlbum(snapshotImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
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
    
    @IBAction private func handleTapGesture(_ sender: UITapGestureRecognizer) {
        guard let pic = UIImage(named: picture) else { return }
        var whereTap = sender.location(in: sender.view)
        var stickerView  = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        stickerView.center.x = whereTap.x
        stickerView.center.y = whereTap.y
        stickerView.image = pic
        imageView.addSubview(stickerView)
        //        print("\(picture)")
        //        var whereTap = sender.location(in: sender.view)
        //        print("\(whereTap.x), \(whereTap.y)")
    }
    
    @IBAction private func emojiClick(_ button: UIButton) {
        guard let titles = button.titleLabel?.text else { return }
        print("titles = \(titles)")
        picture = titles
        print("picture = \(picture)")
    }
    
}


// MARK: - UIImagePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("\n---------- [ didFinishPickingMediaWithInfo ] ----------\n")
        
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeMovie) {
            let url = info[UIImagePickerControllerMediaURL] as! NSURL
            if let path = url.path {
                UISaveVideoAtPathToSavedPhotosAlbum(path, nil, nil, nil)
            }
        } else {
            let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
            selectedImage = editedImage ?? originalImage!
            imageView.image = selectedImage
            cameraBtn.isHidden = true

        }
        
        picker.dismiss(animated: true)
    }
    
    /***************************************************
     // 앨범에 이미지 저장
     UIImageWriteToSavedPhotosAlbum(<#T##image: UIImage##UIImage#>, <#T##completionTarget: Any?##Any?#>, <#T##completionSelector: Selector?##Selector?#>, <#T##contextInfo: UnsafeMutableRawPointer?##UnsafeMutableRawPointer?#>)
     
     // 앨범에 비디오 저장
     UISaveVideoAtPathToSavedPhotosAlbum(<#T##videoPath: String##String#>, <#T##completionTarget: Any?##Any?#>, <#T##completionSelector: Selector?##Selector?#>, <#T##contextInfo: UnsafeMutableRawPointer?##UnsafeMutableRawPointer?#>)
     ***************************************************/
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("\n---------- [ imagePickerControllerDidCancel ] ----------\n")
        picker.dismiss(animated: true)
    }
}

extension UIImage {
    class func imageWithView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}

