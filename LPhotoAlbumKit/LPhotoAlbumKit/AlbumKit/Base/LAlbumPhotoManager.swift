//
//  LAlbumPhotoManager.swift
//  LPhotoAlbumKit
//
//  Created by linuse on 2018/12/15.
//  Copyright © 2018年 Linuse. All rights reserved.
//

import UIKit
import Photos

class LAlbumPhotoManager: NSObject {
    /**所有相册集合*/
    public var allAlbumArray = NSMutableArray()
    /**相册下图片资源集合*/
    public var assetArray = NSMutableArray()
    
    static let instance: LAlbumPhotoManager = LAlbumPhotoManager()
    class func sharedManager() -> LAlbumPhotoManager {
        return instance
    }
    /**获取系统下所有相册资源*/
    public func fetchSystemAlbumAsset() {
        self.allAlbumArray.removeAllObjects()
        let options = PHFetchOptions()
//        options.sortDescriptors = [NSSortDescriptor.init(key: "creationDate", ascending: true)]
        /**获取所有智能相册*/
        let smartAlbums = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.smartAlbum, subtype: PHAssetCollectionSubtype.albumRegular, options: options)
        for index in 0..<smartAlbums.count {
            let collection = smartAlbums[index]
            if collection.isKind(of: PHAssetCollection.classForCoder()){
                let assestCollection = collection
                let assestsFetchResults:PHFetchResult = PHAsset.fetchAssets(in: assestCollection, options: options)
                let albumModel = LAlbumlistModel()
                albumModel.albumName = assestCollection.localizedTitle!
                albumModel.albumCount = assestsFetchResults.count
                assestsFetchResults.enumerateObjects { (asset, i, nil) in
                    let photoModel = LPhotoDetailModel.init()
                    photoModel.asset = asset
                    photoModel.fileName = asset.value(forKey: "filename") as! String
                    photoModel.mediaType = asset.mediaSubtypes
                    albumModel.lastAsset = assestsFetchResults.lastObject!
                    albumModel.assetArray.add(photoModel)
                }
                self.allAlbumArray.add(albumModel)
            }
        }
    }
    public func getAssetThumbnail(asset:PHAsset,size:CGSize ,comletion: @escaping (_ image: UIImage,_ info:NSDictionary) -> ()) -> Void {
        //获取缩略图
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions() //可以设置图像的质量、版本、也会有参数控制图像的裁剪
        option.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat
        //返回一个单一结果，返回前会堵塞线程，默认是false
        option.isSynchronous = true
        option.resizeMode = PHImageRequestOptionsResizeMode.fast
        manager.requestImage(for: asset, targetSize: size, contentMode: PHImageContentMode.default, options: option) { (image, info) in
            comletion(image!,info! as NSDictionary)
        }
    }
}
