//
//  UploadViewController.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices

class UploadViewController: UIViewController {
    
    let uploadView = UploadView()
    private let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUploadView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(upload) )
        uploadView.imageAsButton.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
               imagePicker.delegate = self
       
    }
    
    private func setUpUploadView() {
        view.addSubview(uploadView)
        uploadView.snp.makeConstraints { view in
            view.size.equalTo(self.view.safeAreaLayoutGuide.snp.size)
        }
    }
    
    @objc private func upload() {
        print("Uploaded!")
    }
    
    
    
    @objc private func chooseImage() {
        print("Choosing Image")
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
       
    }
}

extension UploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { print("Image is Nil"); return }
        uploadView.uploadImageIV.image = image
        self.dismiss(animated: true, completion: nil)
    }
    

}
