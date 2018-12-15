//
//  LPhotoAlbumlistController.swift
//  LPhotoAlbumKit
//
//  Created by linuse on 2018/12/15.
//  Copyright © 2018年 Linuse. All rights reserved.
//
import UIKit
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class LPhotoAlbumlistController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUIConfiguration()
        self.navigationItem.title = "相册"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "取消", style: UIBarButtonItemStyle.done, target: self, action:  #selector(cancleAction))
        self.view.addSubview(self.tableView)
    }
    func setUIConfiguration(){
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight), style: UITableViewStyle.plain)
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func cancleAction() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

}
extension LPhotoAlbumlistController{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "Cell"
        let cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellIndentifier)
        let albumModel = LAlbumPhotoManager.sharedManager().allAlbumArray[indexPath.row] as! LAlbumlistModel
        cell.textLabel?.text = albumModel.albumName
        cell.detailTextLabel?.text = String.init(format: "%d", albumModel.albumCount)
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LAlbumPhotoManager.sharedManager().allAlbumArray.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let albumModel = LAlbumPhotoManager.sharedManager().allAlbumArray[indexPath.row] as! LAlbumlistModel
        let detailVC = LPhotoAlbumDetailsController()
        detailVC.navigationItem.title = albumModel.albumName
        detailVC.photolist = albumModel.assetArray
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
