//
//  ViewController.swift
//  TableView
//
//  Created by Carlos Rios on 28/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    private let myCountries = ["Mexico","Estados Unidos","Australia","España","Japon"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        //Hace que no se muestren las lineas de las celdas del footer
        //myTableView.tableFooterView = UIView()
        
        myTableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != 0 {
            return "Celdas custom"
        }
        return "Celdas simples"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section != 0 {
            return "Paises en forma de detalle"
        }
        return "Paises simples"
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 25
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section != 0 {
            return UITableView.automaticDimension
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
                cell?.backgroundColor = .gray
                cell?.textLabel?.font = .systemFont(ofSize: 24)
                //Icono al final de la celda
                cell?.accessoryType = .disclosureIndicator
            }
            cell!.textLabel?.text = myCountries[indexPath.row]
            
            return cell!
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell
        
        cell?.myFirstLabel.text = String(indexPath.row + 1)
        cell?.mySecondLabel.text = myCountries[indexPath.row]
        
        if indexPath.row == 2 {
            cell?.mySecondLabel.text = "asdasdasdasdddddsadasdasdas dasdcascdas a acdas asas cas as asdasdc ad asdcasd asda sa scas"
        }
        cell?.accessoryType = .disclosureIndicator
        
        
        return cell!
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myCountries[indexPath.row])
    }
}

