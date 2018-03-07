//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Dũng Võ on 3/6/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import Foundation

struct PhotoInfo : Codable {
    var title : String
    var explanation : String
    var url : URL
    var copyright : String?
    
    enum keys : String , CodingKey{
        case title
        case explanation
        case url
        case copyright
    }
    
    init(from decoder : Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: keys.self)
        
        self.title = try valueContainer.decode(String.self, forKey: keys.title)
        self.explanation =  try valueContainer.decode(String.self, forKey: keys.explanation)
        self.url = try valueContainer.decode(URL.self, forKey: keys.url)
        self.copyright = try valueContainer.decode(String.self, forKey: keys.copyright)
        
    }
    
    
}
