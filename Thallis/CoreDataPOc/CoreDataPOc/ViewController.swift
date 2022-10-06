//
//  ViewController.swift
//  CoreDataPOc
//
//  Created by Thallis Sousa on 03/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // O contexto é o local onde iremos para "performar" os objetos dentro do nosso CoreData
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    private var models = [ToDoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CoreData To-do List"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter new item", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            self?.createItem(name: text)
        }))
        
        present(alert, animated: true)
    }
    
    
    // MARK: - Delegate da TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        
        return cell
    }
    
    
    
// MARK: - CoreData
    func getAllItems() {
        do {
            /// Pega a função de "fetchRequest" já existente na nossa DataProperties
            models = try context.fetch(ToDoListItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            // error
        }
    }
    
    func createItem(name: String) {
        /// Um novo item será criado a partir do nosso TodoListItem com o contexto que foi passado
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        
        do {
            getAllItems()
            try context.save()
        } catch {
            // error
        }
    }
    
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            try context.save()
        }
        catch {
            
        }
    }
    
    func updateItem(item: ToDoListItem, newName: String) {
        item.name = newName
        
        do {
            try context.save()
        }
        catch {
            
        }
        
    }
    
    
    
}

