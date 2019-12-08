//
//  ViewController.swift
//  concentration
//
//  Created by Mohammed Drame on 12/8/19.
//  Copyright © 2019 Mo Drame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Instances
    var uiLayer = OutletsLayer()
    
    
    
    // Outlets
    @IBOutlet var buttonOutlet: [UIButton]!
    @IBOutlet weak var result: UIView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // buttons layout set
        uiLayer.buttonsOutletLayer(view: buttonOutlet )
        
        // result radius
        result.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    

}

