//
//  uiStuff.swift
//  concentration
//
//  Created by Mohammed Drame on 12/8/19.
//  Copyright © 2019 Mo Drame. All rights reserved.
//

import Foundation
import UIKit



struct OutletsLayer {
    
    
    //button layerStuff
    func buttonsOutletLayer(view: [UIButton]) {
        for buttons in view {
            
            buttons.layer.cornerRadius = 15
            // SHADOW STUFF
            buttons.layer.shadowColor = #colorLiteral(red: 0.1318426728, green: 0.1439217925, blue: 0.158605963, alpha: 1)
            buttons.layer.shadowOpacity = 0.8;
            buttons.layer.shadowRadius = 5;
            buttons.layer.shadowOffset = CGSize(width: 1, height: 3)
       
            
    }
    }
    
    
    
    
    
    
}
