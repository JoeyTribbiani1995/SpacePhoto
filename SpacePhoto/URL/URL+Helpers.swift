//
//  URL+Helpers.swift
//  SpacePhoto
//
//  Created by Dũng Võ on 3/6/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import Foundation

extension URL{
    func withQueries(_ queries : [String : String]) ->URL? {
        var components = URLComponents.init(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap{URLQueryItem(name: $0.0 , value : $0.1)}
        return components?.url
    }
}
extension URL {
    func withHTTPS() -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.scheme = "https"
        return components?.url
    }
}

