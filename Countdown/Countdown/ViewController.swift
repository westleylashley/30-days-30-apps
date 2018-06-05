//
//  ViewController.swift
//  Countdown
//
//  Created by Westley Lashley on 6/5/18.
//  Copyright © 2018 Westley Lashley. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var seconds = 30
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        label.text = String(seconds) + " seconds"
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    
    
    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
    }
    
    @objc func counter() {
        seconds -= 1
        label.text = String(seconds) + " seconds"
        
        if (seconds == 0) {
            timer.invalidate()
            audioPlayer.play()
        }
        
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    
    @IBAction func stop(_ sender: UIButton) {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        label.text = "30" + " seconds"
        
        audioPlayer.stop()
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let audioPath = Bundle.main.path(forResource: "alarm", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
            //ERROR
        }
        
    }
}

