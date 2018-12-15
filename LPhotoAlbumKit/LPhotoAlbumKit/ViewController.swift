//
//  ViewController.swift
//  LPhotoAlbumKit
//
//  Created by linuse on 2018/12/15.
//  Copyright © 2018年 Linuse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setRootController()  {
        let rootController = LPhotoAlbumlistController.init()
        let imagePickerVC = LImagePickerViewController.init(rootViewController: rootController)
        let detailVC = LPhotoAlbumDetailsController()
        imagePickerVC.pushViewController(detailVC, animated: false)
        self.present(imagePickerVC, animated: true, completion: nil)
     
    }
    @IBAction func pushAction(_ sender: Any) {
        self.setRootController()
        LAlbumPhotoManager.sharedManager().fetchSystemAlbumAsset();
    }
    
}

