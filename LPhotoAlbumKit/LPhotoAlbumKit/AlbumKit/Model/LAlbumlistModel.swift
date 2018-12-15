//
//  LAlbumlistModel.swift
//  LPhotoAlbumKit
//
//  Created by linuse on 2018/12/15.
//  Copyright © 2018年 Linuse. All rights reserved.
//

import UIKit
import Photos

class LAlbumlistModel: NSObject {
    
    /**相册名称*/
    public var albumName = String()
    /**相册下图片资源集合*/
    public var assetArray = NSMutableArray()
    /**封面图片*/
    public var lastAsset = PHAsset()
    /**照片数量*/
    public var albumCount = NSInteger()
    
}

class LPhotoDetailModel: NSObject {
    
    /**相册名称*/
    public var fileName = String()
    /**当前图片资源*/
    public var asset = PHAsset()
    /**照片数量*/
    public var albumCount = NSInteger()
    /**是否选中 默认false*/
    public var selectFlg = Bool()
    /**类型*/
    public var mediaType = PHAssetMediaSubtype()

}

