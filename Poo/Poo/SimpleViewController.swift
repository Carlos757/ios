//
//  SimpleViewController.swift
//  Poo
//
//  Created by Carlos Rios on 31/03/22.
//

import UIKit

class SimpleViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var buttonVerDetalles: UIButton!
    @IBOutlet weak var buttonApagar: UIButton!
    @IBOutlet weak var buttonEncender: UIButton!
    @IBOutlet weak var buttonAcelerar: UIButton!
    
    @IBOutlet weak var labelInformacion: UILabel!
    
    var auto:Automovil?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelInformacion.backgroundColor = .gray
        labelInformacion.numberOfLines = 5
        
        labelInformacion.text =
        "Modelo: \(auto?.modelo ?? "") \n- Color: \(auto?.color ?? "") \n- No. Llantas: \(auto?.numeroLlantas ?? 4) \n- Precio: \(auto?.precio ?? 0)"
        
    }
    
    @IBAction func buttonVerDetallesAction(_ sender: Any) {
        
    }
    @IBAction func buttonEncenderAction(_ sender: Any) {
        
    }
    @IBAction func buttonApagarAction(_ sender: Any) {
        
    }
    @IBAction func buttonAcelerar(_ sender: Any) {
        
    }
    
}
