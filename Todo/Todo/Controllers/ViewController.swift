//
//  ViewController.swift
//  Todo
//
//  Created by Mohammed Drame on 1/23/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    
    // Global
    // Array of type Model of data
    var db = [CategoryTemplateModel]()
    
    
    

    
    // UIKite functions
    
    func tableViewViewCalls() {
        // DELEGATE AND DATA-SOURCE
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        
    }
    
    
    
    func navigationUISet() {
        
        // Left programmatic bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "➕", style: .plain, target: self, action: #selector(barButtonHandler))
        
        // navigation title enlargment
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
    }
    
    
    // barbutton handler
    @objc func barButtonHandler() {
        // add Alert with textfield and colors so user can pick category along with their color
        //Step : 1
        let alert = UIAlertController(title: "Add Category", message: "🖊", preferredStyle: UIAlertController.Style.alert )
        
        
        var noteTextField = UITextField()
        
        //Step : 3
//       Textfield in alertcontroller
        alert.addTextField { (textField) in
            textField.placeholder = "Home-Work"
            textField.textColor = .black
            textField.textAlignment = .center
            noteTextField = textField
//            noteTextField.delegate = self
        }
        
        
        //Step : 2
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            // test
            print("Category: \(noteTextField.text!)")
            self.db.append(CategoryTemplateModel(categoryName: "\(noteTextField.text!)", categoryDate: "Jan 26., 2020"))
            self.mainTableView.reloadData()
        
        }
        
        
        
        
        //Step : 4
        alert.addAction(save)
        //Cancel action
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (alertAction) in
            
            print("Cancel Pressed")
        }
        
        
        alert.addAction(cancel)
        //OR single line action
        //alert.addAction(UIAlertAction(title: "Cancel", style: .default) { (alertAction) in })
        
        self.present(alert, animated:true, completion: nil)
        
    }
    
    
    
    
    // Instances
    
//        let db = SetData()
        
    
    
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
        return db.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomeTableViewCell
        // UI is set in the custome cell class
        cell.setUI(db: db[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // perform segue and send the class to the next vc
        
    }
    
    
    
    
    
    
    
    
    
}

