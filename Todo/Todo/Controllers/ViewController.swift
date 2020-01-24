//
//  ViewController.swift
//  Todo
//
//  Created by Mohammed Drame on 1/23/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit




class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    // Global
    
    func collectionViewCalls() {
        // DELEGATE AND DATA-SOURCE
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        
    }
    
    func navigationUISet() {
        
        // Left programmatic bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "➕", style: .plain, target: self, action: #selector(barButtonHandler))
        

        
    }
    
    
    // barbutton handler
    @objc func barButtonHandler() {
               // add Alert with textfield and colors so user can pick category along with their color
        
            
               
           }
           
   
    
    
    
    
    // Instances
    
    let db = SetData()
    
    
    
    
    // Outlet
    
    @IBOutlet var mainCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // this function calls the collectionview methods inorder to menimum global variables.
        collectionViewCalls()
        
        // this method set\'s all navigation us component on view
        navigationUISet()
        
        
    }

    
    
    
    // Action
    
    
    
    
    
    // DataSource and Delegate

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // dummy database count
        db.data().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "contentViewCell", for: indexPath) as? CustomeCollectionViewCell
        // UI is set in the custome cell class
        cell!.setUI(db: db.data()[indexPath.row])
        
        return cell!
    }

    
}

