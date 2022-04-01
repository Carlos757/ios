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
    
    var autos = [Automovil]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modeloTextField.isEnabled = false
        colorTextField.isEnabled = false
        precioTextField.isEnabled = false

        tableView.dataSource = self
        tableView.delegate = self
        
        print(autos)
    }
}

extension AutosTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        modeloTextField.text = autos[indexPath.row].modelo
        colorTextField.text = autos[indexPath.row].color
        precioTextField.text = String(autos[indexPath.row].precio)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
            cell?.backgroundColor = .gray
            cell?.textLabel?.font = .systemFont(ofSize: 16)
            //Icono al final de la celda
            cell?.accessoryType = .disclosureIndicator
        }
        cell!.textLabel?.text = "\(autos[indexPath.row].modelo) \t\t\(autos[indexPath.row].color)\t\t\(autos[indexPath.row].numeroLlantas)\t\t\(autos[indexPath.row].precio)"
        
        return cell!
    }
    
    
}

extension AutosTableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Modelo\t\tColor\t\tLlantas\t\tPrecio"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autos.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
