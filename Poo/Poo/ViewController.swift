//
//  ViewController.swift
//  Poo
//
//  Created by Carlos Rios on 29/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    public var autos = [Automovil]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let auto1 = Automovil(modelo:"Toyota" ,color: "Verde", precio: 150000)
        
        print(auto1)
    }
}

