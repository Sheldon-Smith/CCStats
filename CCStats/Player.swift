//
//  Player.swift
//  CCStats
//
//  Created by Graham Schilling on 12/27/15.
//  Copyright (c) 2015 Graham Schilling. All rights reserved.
//

import Foundation


class Player {
    let name:String?
    var topMakes:NSInteger
    var bottomMakes:NSInteger
    var topGays:NSInteger
    var bottomGays:NSInteger
    var misses:NSInteger
    
    init(name:String){
        self.name = name
        self.topMakes = 0
        self.bottomMakes = 0
        self.topGays = 0
        self.bottomGays = 0
        self.misses = 0
    }
    
    func shotsMade() -> Int{
        return self.topMakes + self.bottomMakes + self.topGays + self.bottomGays
    }
    
    
}