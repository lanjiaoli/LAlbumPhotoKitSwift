//
//  LImagePickerViewController.swift
//  LPhotoAlbumKit
//
//  Created by linuse on 2018/12/15.
//  Copyright © 2018年 Linuse. All rights reserved.
//

import UIKit

class LImagePickerViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor.brown
        self.navigationBar.titleTextAttributes = [kCTForegroundColorAttributeName:UIColor.white] as [NSAttributedStringKey : Any] ;
        self.navigationBar.tintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    

}
