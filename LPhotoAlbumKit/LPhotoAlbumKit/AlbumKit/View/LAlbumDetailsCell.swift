//
//  LAlbumDetailsCell.swift
//  LPhotoAlbumKit
//
//  Created by linuse on 2018/12/15.
//  Copyright © 2018年 Linuse. All rights reserved.
//

import UIKit

class LAlbumDetailsCell: UICollectionViewCell {
    public var photoImageView :UIImageView? // 大图
    public var giflogImageView :UIImageView? // gif标识
    public var timeLabel :UILabel? // 视频时间
    override init(frame: CGRect) {
         super.init(frame: frame)
        self .setUIConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.photoImageView?.frame = self.bounds
        self.giflogImageView?.frame = CGRect.init(x: self.width - 20, y: self.height - 20, width: 20, height: 20)
        self.timeLabel?.frame = CGRect.init(x: 15, y: self.height - 20, width: 60, height: 20)
    }
    
    public func setPhotoModel(photoModel:LPhotoDetailModel){
        LAlbumPhotoManager.sharedManager().getAssetThumbnail(asset: photoModel.asset, size: self.bounds.size) { (image, info) in
            self.photoImageView?.image = image
        }
    }
    
    
}
extension LAlbumDetailsCell{
    func setUIConfiguration() {
        self.photoImageView = UIImageView.init()
        self.photoImageView?.contentMode = UIViewContentMode.scaleAspectFill
        self.photoImageView?.clipsToBounds = true
        let num =  arc4random()%2+1
        self.photoImageView?.image = UIImage.init(named: String.init(format: "%d.jpeg", num))
        self.addSubview(self.photoImageView!)
        self.giflogImageView = UIImageView.init()
        self.addSubview(self.giflogImageView!)
        self.timeLabel = UILabel.init()
        self.timeLabel?.text = "1:00"
        self.timeLabel?.textColor = UIColor.black
        self.timeLabel?.font = UIFont.systemFont(ofSize: 10);
        self.addSubview(self.timeLabel!)
    }
}
extension UIView {
    // .x
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    // .y
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    // .maxX
    public var maxX: CGFloat {
        get {
            return self.frame.maxX
        }
    }
    
    // .maxY
    public var maxY: CGFloat {
        get {
            return self.frame.maxY
        }
    }
    
    // .centerX
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    // .centerY
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    // .width
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    // .height
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
}

