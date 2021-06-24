//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Andrii Nepodymka on 6/23/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var categoriesArray = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoriesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let item1 = categoriesArray[indexPath.row]
        
        cell1.textLabel?.text = item1.name
        
        
        return cell1
    }
    
    
    
    
    //MARK: - Data Manipulation Methods
    
    
    
    
    
    
    
    //MARK: - Add New Categories
    
    
    
    
    
    
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (acttion) in
            //waht will happen once user clicks the Add Item button on a uialert
            
            
            
            let newItem = Category(context: self.context)
            newItem.name = textField.text!
            self.categoriesArray.append(newItem)
            
            self.saveCategories()
            
            
            
            
        }
        alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            
            
            
            
        }
        
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    func saveCategories() {
        
        
        do{
            
            
            try context.save()
        } catch {
            print(error)
        }
        self.tableView.reloadData()
    }
    
    
    func loadCategories() {
        
       let request: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categoriesArray =  try context.fetch(request)
        } catch {
            print(error)
        }
        tableView.reloadData()
    }
    
    //MARK: - TableView Delegate Methods
    

    
    
}
