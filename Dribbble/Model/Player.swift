//
//  Player.swift
//  Dribbble
//
//  Created by Guilherme Miranda on 3/21/15.
//  Copyright (c) 2015 Guilherme Miranda. All rights reserved.
//

import Foundation

class Player: NSObject {
    var id: Int
    var name: String
    var avatarUrl: String
    
    init(id: Int, name: String, avatarUrl: String) {
        self.id = id
        self.name = name
        self.avatarUrl = avatarUrl
    }
}
