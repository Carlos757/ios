//
//  AutosTableViewController.swift
//  Poo
//
//  Created by Carlos Rios on 29/03/22.
//

import UIKit

class AutosTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var modeloTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var precioTextField: UITextField!
    
    var vc = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        vc = ViewController()
        print(vc.autos)
    }
}

extension AutosTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        
        cell.backgroundColor = .lightGray
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
}

extension AutosTableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vc.autos.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
