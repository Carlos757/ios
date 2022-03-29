//
//  PasarViewController.swift
//  AppTestLayout
//
//  Created by Carlos Rios on 28/03/22.
//

import UIKit

class PasarViewController: UIViewController {
    
    var color:String?
    var titulo:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titulo
        
        switch self.color {
            case "Rojo": self.view.backgroundColor = .red; print(color!)
            case "Blanco": self.view.backgroundColor = .white; print(color!)
            case "Gris": self.view.backgroundColor = .gray; print(color!)
            default: self.view.backgroundColor = .black; print(color ?? "Nada")
        }
        
    }
    

}
