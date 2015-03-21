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
    var viewsCount: Int
    var player: Player
    var imageUrl: String
   
    init(id: Int, title: String, viewsCount: Int, player: Player, imageUrl: String) {
        self.id = id
        self.title = title
        self.viewsCount = viewsCount
        self.player = player
        self.imageUrl = imageUrl
    }
}