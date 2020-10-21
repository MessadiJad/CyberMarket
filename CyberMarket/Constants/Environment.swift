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

class Environment {
    
    static let server:Server = .developement
        
    class func APIBasePath() -> String {
        switch self.server {
        case .developement:
            return "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"
        }
    }
    
}


