//
//  TrafficLightView.swift
//  Traffic Lights
//
//  Created by Dmitrii Zverev on 3/2/17.
//
//

import UIKit

class TrafficLightView: UIView {

    
    @IBOutlet weak var red: UIView!
    @IBOutlet weak var yellow: UIView!
    @IBOutlet weak var green: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.red.setCorner(radius: 11)
        self.yellow.setCorner(radius: 11)
        self.green.setCorner(radius: 11)
        self.setCorner()
        switchTo(.outOfOrder)
    }
    
    func switchTo(_ typeOfColor: Constants.TypesOfColor)  {
        self.red.backgroundColor = typeOfColor == .red ? .red : .white
        self.yellow.backgroundColor = typeOfColor == .yellow ? .yellow : .white
        self.green.backgroundColor = typeOfColor == .green ? .green : .white
    }

}
