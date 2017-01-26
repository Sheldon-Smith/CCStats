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
    var lastTen:Array<Bool>
    
    init(name:String){
        self.name = name
        self.topMakes = 0
        self.bottomMakes = 0
        self.topGays = 0
        self.bottomGays = 0
        self.misses = 0
        self.lastTen = []
    }
    
    func shotsMade() -> Int{
        return self.topMakes + self.bottomMakes + self.topGays + self.bottomGays
    }
    
    func lastTenSummary() -> String{
        var countMakes = 0
        var countMisses = 0
        if self.lastTen.count == 5{
            for value in lastTen{
                if value{
                    countMakes += 1
                }else{
                    countMisses += 1
                }
            }
            return "\(countMisses) Misses, \(countMakes) Makes in last 5"
        }else{
            return "Available after 5 shots"
        }
    }
    
    
}