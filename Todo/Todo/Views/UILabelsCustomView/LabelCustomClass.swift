//
//  LabelCustomClass.swift
//  Todo
//
//  Created by Mohammed Drame on 1/25/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class LabelCustomClass: UILabel {

    required init(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)!
         
        labelUI()
      }

      override init(frame: CGRect) {
          super.init(frame: frame)
          
      }
    
    
    // function only run in this file
    private func labelUI() {
        
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
    
   

}
