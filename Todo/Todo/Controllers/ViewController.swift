//
//  ViewController.swift
//  Todo
//
//  Created by Mohammed Drame on 1/23/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit




class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    // Global
    
    
    
    
    // UIKite functions
    
    func tableViewViewCalls() {
        // DELEGATE AND DATA-SOURCE
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        
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
    
    @IBOutlet weak var mainTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // this function calls the collectionview methods inorder to menimum global variables.
        tableViewViewCalls()
        
        // this method set's all navigation UI component on view
        navigationUISet()
        
        
    }
    
    
    
    
    // Action
    
    
    
    
    
    // DataSource and Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return db.data().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomeTableViewCell
        // UI is set in the custome cell class
        cell.setUI(db: db.data()[indexPath.row])
        return cell
    }
    
    
    
    
    
    
}

