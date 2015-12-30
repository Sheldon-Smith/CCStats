//
//  PlayerDetailViewController.swift
//  CCStats
//
//  Created by Graham Schilling on 12/30/15.
//  Copyright (c) 2015 Graham Schilling. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UIViewController {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var trm: UILabel!
    @IBOutlet weak var brm: UILabel!
    @IBOutlet weak var trg: UILabel!
    @IBOutlet weak var brg: UILabel!
    @IBOutlet weak var tst: UILabel!
    @IBOutlet weak var sp: UILabel!
    @IBOutlet weak var isr: UILabel!
    
    var game: Game!
    var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let totalMakes = player.topMakes + player.bottomMakes + player.topGays + player.bottomGays
        let totalShots = Double(totalMakes + player.misses)
        playerName.text = player.name
        trm.text = String(player.topMakes)
        brm.text = String(player.bottomMakes)
        trg.text = String(player.topGays)
        brg.text = String(player.bottomGays)
        tst.text = String(stringInterpolationSegment: totalShots)
        let percent = String(stringInterpolationSegment: round(Double(totalMakes)/totalShots * 100))
        sp.text = "\(totalMakes)/\(totalShots) = \(percent)%"
        isr.text = calculateISR(totalMakes)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateISR(totalMakes:Int) -> String{
        let makePoints = Float(totalMakes * 3)
        let adjustedPointsForGays = makePoints-(Float(player.topGays) * 1.0)-(Float(player.bottomGays) * 0.75)
        let pointsAfterBottomBonus = adjustedPointsForGays + Float(player.bottomMakes + player.bottomGays - player.topGays - player.topMakes)
        return String(stringInterpolationSegment: pointsAfterBottomBonus)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
