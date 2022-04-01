//
//  NuevoAutoViewController.swift
//  Poo
//
//  Created by Carlos Rios on 29/03/22.
//

import UIKit

class NuevoAutoViewController: UIViewController {
    @IBOutlet weak var modeloTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var llantasTextField: UITextField!
    @IBOutlet weak var precioTextField: PastelessTextField!
    
    @IBOutlet weak var buttonCrear: UIButton!
    
    var delegate: NuevoAutoViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modeloTextField.placeholder = "Modelo del auto"
        colorTextField.placeholder = "Color del auto"
        precioTextField.placeholder = "Precio del auto"
        
        modeloTextField.delegate = self
        colorTextField.delegate = self
        precioTextField.delegate = self
        
        precioTextField.keyboardType = .decimalPad
        
        precioTextField.addDoneButtonToKeyboard(myAction:  #selector(self.precioTextField.resignFirstResponder))

    }
    @IBAction func buttonCrearAction(_ sender: Any) {
        if camposLlenados() {
            let auto = Automovil(modelo: modeloTextField.text!, color: colorTextField.text!, precio: Double(precioTextField.text!)!)
            
            
            self.delegate?.nuevoAuto(auto: auto)
    //        dismiss(animated: true, completion: nil)
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    func camposLlenados() -> Bool {
        if (modeloTextField.text != "" && colorTextField.text != "" && precioTextField.text != ""){
            return true
        }
        return false
    }
}

extension NuevoAutoViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

//Extension para agregar boton listo arriba del pop up del teclado
extension UITextField{

 func addDoneButtonToKeyboard(myAction:Selector?){
    let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    doneToolbar.barStyle = UIBarStyle.default

     let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
     let done: UIBarButtonItem = UIBarButtonItem(title: "Listo", style: UIBarButtonItem.Style.done, target: self, action: myAction)

    var items = [UIBarButtonItem]()
    items.append(flexSpace)
    items.append(done)

    doneToolbar.items = items
    doneToolbar.sizeToFit()
     

    self.inputAccessoryView = doneToolbar
 }
}

class PastelessTextField: UITextField {
  override func canPerformAction(
      _ action: Selector, withSender sender: Any?) -> Bool {
        return super.canPerformAction(action, withSender: sender)
        && (action == #selector(UIResponderStandardEditActions.cut)
        || action == #selector(UIResponderStandardEditActions.copy))
    }
}

protocol NuevoAutoViewControllerDelegate {
  func nuevoAuto(auto: Automovil)
}
