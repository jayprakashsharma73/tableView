//
//  ViewController.swift
//  TableView
//
//  Created by Jay Prakash Sharma on 03/06/22.
//

import UIKit
class ViewController: UIViewController{
    
    // Variable
    var name:Animal = Animal(name: [])
    
    // Outlets
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addData: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    // Data loaded when app launch
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "animalCell")
        tableView.delegate = self
        tableView.dataSource = self
        dataTextField.delegate = self
        dataTextField.becomeFirstResponder()
    }
    
    // Add Data
    @IBAction func addData(_ sender: UIButton) {
        if sender.tag == 1 && dataTextField.text != ""{
            name.animalName.append(dataTextField.text!)
            dataTextField.text = ""
            dataTextField.becomeFirstResponder()
            let alert = UIAlertController(title: "Message", message: "Data Added Successfully", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.tableView.reloadData()
        }else{
            let alert = UIAlertController(title: "Message", message: "Please enter animal name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // Delete Data
    @IBAction func deleteData(_ sender: UIButton) {
        if name.animalName.count != 0 && sender.tag == 2{
            name.animalName.removeLast()
            let alert = UIAlertController(title: "Message", message: "Data Deleted Successfully", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.tableView.reloadData()
        }else{
            let alert = UIAlertController(title: "Message", message: "No Data Found", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// View Data in tableViewDelegate, tableViewDataSource and UITextFieldDelegate
extension ViewController:UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.name.animalName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = self.name.animalName[indexPath.row]
        return cell
    }
    
    // Return Key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if dataTextField.text != "" {
            name.animalName.append(dataTextField.text!)
            dataTextField.text = ""
            dataTextField.becomeFirstResponder()
            let alert = UIAlertController(title: "Message", message: "Data Added Successfully", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.tableView.reloadData()
            print(name.animalName)
        }else{
            let alert = UIAlertController(title: "Message", message: "Please enter animal name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.tableView.reloadData()
        }
        return true
    }
}
