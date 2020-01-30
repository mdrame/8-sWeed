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
    // Array of type Model of data that reloads the table view using property observer
    var db = [CategoryTemplateModel](){
        didSet{
            mainTableView.reloadData()
        }
    }
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
            //            self.mainTableView.reloadData()
            
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
        
        // perfome segeu to sup category veew controller
        
        // Testing Update :
        
       
        
        
    }
    
    
    // enable side editing to edit category
    // if user side to edite
    // re-run uialert controller code
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        // CHECK EDITING STYLE :
        
        switch editingStyle {
        case .insert: // editing I suppose
            // do this
            // 1. Update both array and context
            
            // 1. Create a alert controller.
            print("Editing Cell")
            
            break
        case .delete:
            // delete cell
            
            // 1. Delete index from both array and context
            context.delete(db[indexPath.row])
            db.remove(at: indexPath.row)
            
            
            // save change
            saveData()
            
            
            
        case .none:
            print("Not Editing !!!")
        @unknown default:
            print("Nothing is Happenning")
        }
        
        
        
    }
    
    
    
    
} // MARK: -> View Controller End




extension ViewController {
    
    //  MARK: CRUD -> Core Data
    
    // C -> Create
    func saveData() {
        do {
            try context.save()
        } catch {
            print("Error Occured while trying to save data: \(error.localizedDescription)")
        }
    }
    
    
    // R -> Read
    func fetchdDATA() {
        
        let data: NSFetchRequest<CategoryTemplateModel> = CategoryTemplateModel.fetchRequest()
        
        do {
            db =  try context.fetch(data)
        } catch {
            print("Error Occured while fatching data: \(error.localizedDescription)")
        }
        
    }


}
    
    // U -> Update
//    func updateData(indexPath row: Int, _ name: String) {
//
//
//        let data: NSFetchRequest<CategoryTemplateModel> = CategoryTemplateModel.fetchRequest()
//
//        do {
//            db = try context.fetch(data)
//
//            // 1. create an object of type CategoryTemplateModel
//
//            // setting category object to be added to ui
//            let updatedName = db[row].categoryName = name
//            print(name)
//            print("Updated Category Name: \(updatedName)")
//
//            saveData()
//            print("Specific Index: \(row)")
//            print("Index db: \(name)")
////            print("Index Date: \(date)")
//
////            print("Data: \(data)")
//
//
//
////
////                        for index in db {
////
////                            // properties in a class
////                            print("All Index: ")
////                            print("Index Name: \(index.categoryName!)")
////                            print("Index Date: \(index.categoryDate!)")
////
////                        }
////
//
//
//
//            //            mainTableView.reloadData()
//        } catch {
//            print("Error Occured while fatching data: \(error.localizedDescription)")
//        }
//
//    }
//
//
//
//
//}



// D -> Deleate
//
//    func deleteData() {
//
//
//
//    }








// MARK: -> Alert Controller for UPDATE


//
// let alert = UIAlertController(title: "Add Category", message: "🖊", preferredStyle: UIAlertController.Style.alert )
//
//
//        var noteTextField = UITextField()
//
//
//        //       Textfield in alertcontroller
//        alert.addTextField { (textField) in
//            textField.placeholder = "Home-Work"
//            textField.textColor = .black
//            textField.textAlignment = .center
//            noteTextField = textField
//
//        }
//
//
//
//
//
//        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
//            // test
//            print("Category: \(noteTextField.text!)")
//
//
//            // 2. Assign the alert controller textField property to a new model instance like we did previously.
//            let updatedModel = CategoryTemplateModel(context: self.context)
//
//
//
//            updatedModel.categoryName = noteTextField.text
//            updatedModel.categoryDate = "Jan 20, 2020"
//
//            // 3. Upate our specific array index using indexpath.row by assigning it to our newly data model instance.
//
//            // 4. Save conttext
//
//
//            self.updateData(indexPath: indexPath.row, noteTextField.text!)
//
////            self.db[indexPath.row] = updatedModel
//
//
//
//
//
//
//        }
//
//
//        //Step : 4
//        alert.addAction(save)
//        //Cancel action
//        let cancel = UIAlertAction(title: "Cancel", style: .default) { (alertAction) in
//
//            print("Cancel Pressed")
//        }
//
//
//        alert.addAction(cancel)
//        //OR single line action
//        //alert.addAction(UIAlertAction(title: "Cancel", style: .default) { (alertAction) in })
//
////        self.present(alert, animated:true, completion: nil)
//
//
//
//
//
//
