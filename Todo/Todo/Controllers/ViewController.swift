//
//  ViewController.swift
//  Todo
//
//  Created by Mohammed Drame on 1/23/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    
    // Global
    // Array of type Model of data
    var db = [CategoryTemplateModel]()
    // accessing the compted property from app delegate
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    

    
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
            // add object to array
            
           
            
            let newModel = CategoryTemplateModel(context: self.context)
            newModel.categoryName = noteTextField.text
            newModel.categoryDate = "Jan 20, 2020"
            self.db.append(newModel)
            
            self.saveData()
            
            
        
            // refresh table to show newly added object
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
        
        // load database on load
        fetchdDATA()
        
        
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



extension ViewController {
    
    //  MARK: CRUD -> Core Data
    
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("Error Occured while trying to save data: \(error.localizedDescription)")
        }
        
        mainTableView.reloadData()
    }
    
    
    
    func fetchdDATA() {
        
        let data: NSFetchRequest<CategoryTemplateModel> = CategoryTemplateModel.fetchRequest()
        
        do {
           db =  try context.fetch(data)
        } catch {
            print("Error Occured while fatching data: \(error.localizedDescription)")
        }
        
    }
    
    
    
    
}

