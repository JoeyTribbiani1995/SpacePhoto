//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by Dũng Võ on 3/6/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import Foundation

struct PhotoInfoController  {
    func fetchPhotoInfo(Completion : @escaping (PhotoInfo) -> Void) {
        let urlBase = URL(string : "https://api.nasa.gov/planetary/apod?")!
        
        let query : [String:String] = [
            "api_key":"DEMO_KEY",
            
        ]
        
        let url = urlBase.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsDecoder = JSONDecoder()
            
            if let data = data , let photoInfo = try? jsDecoder.decode(PhotoInfo.self, from: data){
                Completion(photoInfo)
            }else {
                print("error nil data ---------------------")
                return
            }
        }
        
        task.resume()
        
    }
}

    

    

