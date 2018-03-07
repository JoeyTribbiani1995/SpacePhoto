//
//  PhotoViewController.swift
//  SpacePhoto
//
//  Created by Dũng Võ on 3/6/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var decriptionTextView: UITextView!
    
    var photoInfo : PhotoInfo?
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        photoInfoController.fetchPhotoInfo{ (photoInfo) in
            self.updateView(with: photoInfo)
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func updateView(with photoInfo : PhotoInfo){
        guard let url = photoInfo.url.withHTTPS() else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data , let image = UIImage(data: data){
                DispatchQueue.main.sync {
                    self.navigationItem.title = photoInfo.title
                    self.photoImageView.image = image
                    self.decriptionTextView.text = "Description : \(photoInfo.explanation)"
                    
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = "©Copy Right \(copyright)"
                    }else{
                        self.copyrightLabel.isHidden = true
                    }
                }
            }
        }
        
        task.resume()
    }
    
    
    

}
