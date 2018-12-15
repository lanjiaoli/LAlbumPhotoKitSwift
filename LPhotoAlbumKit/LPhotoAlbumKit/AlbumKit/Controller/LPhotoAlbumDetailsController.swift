//
//  LPhotoAlbumDetailsController.swift
//  LPhotoAlbumKit
//
//  Created by linuse on 2018/12/15.
//  Copyright © 2018年 Linuse. All rights reserved.
//

import UIKit

class LPhotoAlbumDetailsController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    var collectionView:UICollectionView?
    var flowLayout:UICollectionViewFlowLayout?
    public var photolist = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "相册胶卷"
        let itemWidth = (screenWidth - 10)/4.0
        let minSpacing = CGFloat(2.0)
        self.flowLayout = UICollectionViewFlowLayout.init()
        self.flowLayout?.itemSize = CGSize.init(width: itemWidth, height: itemWidth)
        self.flowLayout?.minimumLineSpacing = minSpacing
        self.flowLayout?.minimumInteritemSpacing = minSpacing
        self.collectionView = UICollectionView.init(frame: CGRect.init(x: 2, y: 2, width: screenWidth - 4, height: screenHeight-2), collectionViewLayout: (self.flowLayout!))
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.view.addSubview(self.collectionView!)
        self.collectionView? .register(LAlbumDetailsCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView?.backgroundColor = UIColor.groupTableViewBackground
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension LPhotoAlbumDetailsController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photolist.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!LAlbumDetailsCell
        cell.backgroundColor = UIColor.green
        cell.setPhotoModel(photoModel: self.photolist[indexPath.row] as! LPhotoDetailModel)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
}
