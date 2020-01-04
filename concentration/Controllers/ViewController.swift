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
   

    
    // Outlets
    @IBOutlet weak var tempretureOutlet: UILabel!
    @IBOutlet weak var cityTextFieldOutlet: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlString = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=8b8286cb872c5238a1941724160e04b9&q=London") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlString) { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    return // meaning get out this entire function
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString)
                }
                
                
            }
            task.resume()
            
            
            
        }
     
        
      
      
     
        
        // result radius
//        result.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    

    

    

}



extension UIButton {
    
 
    
    
}

