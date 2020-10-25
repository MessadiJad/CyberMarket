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
    
    static func urlType(_ type: APIRouter) -> URL? {
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
        
        if let url = URL(string: baseURL) {
            if let relativePath = relativePath {
                return url.appendingPathComponent(relativePath)
            }
        }
        return nil
    }
    
}


