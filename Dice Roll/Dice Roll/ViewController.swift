//
//  ViewController.swift
//  Dice Roll
//
//  Created by Westley Lashley on 5/24/18.
//  Copyright © 2018 Westley Lashley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let numberOne = arc4random_uniform(6) + 1
        
        let numberTwo = arc4random_uniform(6) + 1
        
        label.text = "The sum is: \(numberOne + numberTwo)"
        
        leftImageView.image = UIImage(named: "Dice\(numberOne)")
        
        rightImageView.image = UIImage(named: "Dice\(numberTwo)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

