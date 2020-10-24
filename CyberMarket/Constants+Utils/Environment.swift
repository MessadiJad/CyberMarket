//
//  Envirenement.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

import Foundation

enum Server {
    case developement
}

enum APIRouter {
    case items
    case category    
}

class Environment {
    
    static let server:Server = .developement
        
    class func APIBasePath() -> String {
        switch self.server {
        case .developement:
            return "https://raw.githubusercontent.com/leboncoin/paperclip/master/"
        }
    }
    
  static func urlType(type: APIRouter) -> URL {
        let baseURL:String = {
            return Environment.APIBasePath()
        }()
    
        let relativePath: String? = {
            switch type {
            case .items:
                return "listing.json"
            case .category:
                return "categories.json"
            }
        }()
        
        var url = URL(string: baseURL)!
        if let relativePath = relativePath {
            url = url.appendingPathComponent(relativePath)
        }
        return url
    }
    
}


