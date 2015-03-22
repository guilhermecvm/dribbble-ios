//
//  DribbbleAPI.swift
//  Dribbble
//
//  Created by Guilherme Miranda on 3/21/15.
//  Copyright (c) 2015 Guilherme Miranda. All rights reserved.
//

import Alamofire
import SwiftyJSON

class DribbbleAPI {
    
    class func getPopularShots(page: Int, callback: ((shots: [Shot], error: NSError?) -> Void)) {
        Alamofire.request(DribbbleRestAPI.ListPopularShots(page)).responseSwiftyJSON { (request, response, json, error) -> Void in
            if (error != nil) {
                callback(shots: [], error: error!)
            }
            else {
                var shots = [Shot]()
                
                for (index: String, shotJson:JSON) in json["shots"] {
                    var player = Player(id: shotJson["player"]["id"].intValue, name: shotJson["player"]["name"].stringValue, avatarUrl: shotJson["player"]["avatar_url"].stringValue)
                    var shot = Shot(id: shotJson["id"].intValue, title: shotJson["title"].stringValue, desc: shotJson["description"].stringValue, likesCount: shotJson["likes_count"].intValue, player: player, imageUrl: shotJson["image_url"].stringValue)

                    shots.append(shot)

                    callback(shots: shots, error: nil)
                }
            }
        }
    }
}
