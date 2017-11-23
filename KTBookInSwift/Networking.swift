//
//  Networking.swift
//  KTBookInSwift
//
//  Created by suger on 2017/11/22.
//  Copyright © 2017年 diaoshihao. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkFailure: Int {
    case noData = 202
    case noLogin = 401
    case failedRequest = 400
}

class Networking {
    
    static let shared = Networking()
    
    private init() {
        
    }
}

extension Networking {
    func postRequest(url: String, parameters: Parameters, success: @escaping(_ respone: [String:String])->(), failed: @escaping(_ failure: NetworkFailure)->()) {
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON { (respone) in
            
            respone.result.ifSuccess {
                success(respone.result.value as! [String : String])
            }
            
            respone.result.ifFailure {
                failed(.failedRequest)
            }
            
        }
    
    }
    
    
}
