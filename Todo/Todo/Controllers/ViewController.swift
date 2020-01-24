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
    
//    // dummy data-base
//
//    let db = ["Work-Out", "Cooking", "Cleaning", "Fucking", "Sleeping", "Eating"]
    
    
    
    func collectionViewCalls() {
        // DELEGATE AND DATA-SOURCE
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        
    }
    
    
    
    
    // Instances
    
    
    
    
    // Outlet
    
    @IBOutlet var mainCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // this function calls the collectionview methods inorder to menimum global variables.
        collectionViewCalls()
        
        
    }

    
    
    
    // Action
    
    
    
    
    
    // DataSource and Delegate

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // dummy database count
        db.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "contentViewCell", for: indexPath) as? CustomeCollectionViewCell
    }

    
}

