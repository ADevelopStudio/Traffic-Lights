//
//  ViewController.swift
//  Traffic Lights
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var trafficLightsNS: [TrafficLightView]!
    @IBOutlet var trafficLightsEW: [TrafficLightView]!
    
    @IBOutlet weak var startStopBtn: UIButton!
    var switchTimer: Timer?
    var timeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startStopBtn.setCorner(radius: 10, color: .clear)
        startStopPressed("")
    }
    
    
    @IBAction func startStopPressed(_ sender: Any) {
        if switchTimer != nil && switchTimer!.isValid {
            switchTimer?.invalidate()
        } else {
            switchTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.checkTimer), userInfo: nil, repeats: true)
        }
        
        startStopBtn.setTitle(switchTimer != nil && switchTimer!.isValid ? "Stop" : "Start", for: .normal)
        startStopBtn.backgroundColor = switchTimer != nil && switchTimer!.isValid ? .red : .green
    }
    
    
    func checkTimer(){
        switch timeInterval {
        case 0:
            trafficLightsNS.forEach({
                $0.switchTo(.green)
            })
            trafficLightsEW.forEach({
                $0.switchTo(.red)
            })
            break
        case 25:
            trafficLightsNS.forEach({
                $0.switchTo(.yellow)
            })
            break
        case 30:
            trafficLightsNS.forEach({
                $0.switchTo(.red)
            })
            trafficLightsEW.forEach({
                $0.switchTo(.green)
            })
            break
        case 55:
            trafficLightsEW.forEach({
                $0.switchTo(.yellow)
            })
            break
        default:
            break
        }
        timeInterval += 1
        if timeInterval >= 60 {timeInterval = 0 }
    }

}

