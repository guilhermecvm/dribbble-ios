//
//  DribbbleRestAPI.swift
//  Dribbble
//
//  Created by Guilherme Miranda on 3/21/15.
//  Copyright (c) 2015 Guilherme Miranda. All rights reserved.
//

import Alamofire

enum DribbbleRestAPI: URLRequestConvertible {
    static var baseURLString: String = ""
    
    case ListPopularShots(Int)
    
    var method: Alamofire.Method {
        switch self {
        case .ListPopularShots:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .ListPopularShots(let page):
            return "/shots/popular?page=\(page)"
        }
    }
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSURLRequest {
        let urlString = "\(DribbbleRestAPI.baseURLString)\(path)"
        
        let URL = NSURL(string: urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)!
        
        let mutableURLRequest = NSMutableURLRequest(URL: URL)
        mutableURLRequest.HTTPMethod = method.rawValue
        
        return mutableURLRequest
    }
}
