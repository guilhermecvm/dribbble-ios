//
//  Shot.swift
//  Dribbble
//
//  Created by Guilherme Miranda on 3/21/15.
//  Copyright (c) 2015 Guilherme Miranda. All rights reserved.
//

import Foundation

class Shot: NSObject {
    var id: Int
    var title: String
    var desc: String
    var likesCount: Int
    var player: Player
    var imageUrl: String
   
    init(id: Int, title: String, desc: String, likesCount: Int, player: Player, imageUrl: String) {
        self.id = id
        self.title = title
        self.likesCount = likesCount
        self.player = player
        self.imageUrl = imageUrl
        self.desc = desc
    }
}
