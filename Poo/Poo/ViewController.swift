//
//  ViewController.swift
//  Poo
//
//  Created by Carlos Rios on 29/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonSimple: UIButton!
    @IBOutlet weak var buttonNuevoAuto: UIButton!
    public var autos = [Automovil]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let auto1 = Automovil(modelo:"Toyota" ,color: "Verde", precio: 150000)
        
        autos.append(auto1)
    }
    @IBAction func buttonSimpleAction(_ sender: Any) {
        prepare(for: UIStoryboardSegue(identifier: "segueSimple", source: self, destination: SimpleViewController()), sender: self)
        
        
        performSegue(withIdentifier: "segueSimple", sender: self)
            
    }
    @IBAction func buttonNuevoAutoAction(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSimple"{
            if let simpleVC = segue.destination as? SimpleViewController {
                simpleVC.auto = Automovil(modelo: "Awebo", color: "Awebo", precio: 300)
            }
            
        }
        if segue.identifier == "segueNuevoAuto"{
            if let nuevoAutoVC = segue.destination as? NuevoAutoViewController {
                nuevoAutoVC.delegate = self
            }
        }
        if segue.identifier == "segueAutosTable"{
            if let autosTableVC = segue.destination as? AutosTableViewController {
//                autosTableVC.delegate = self
                autosTableVC.autos = autos
            }
        }
    }
}
extension ViewController: NuevoAutoViewControllerDelegate {

    func nuevoAuto(auto: Automovil) {
        autos.append(auto)
        print("Se recibio un auto de modelo \(auto.modelo)")
    }

}


