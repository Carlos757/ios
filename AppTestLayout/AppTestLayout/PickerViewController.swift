//
//  PickerViewController.swift
//  AppTestLayout
//
//  Created by Carlos Rios on 28/03/22.
//

import UIKit

class PickerViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myButtonPasar: UIButton!
    @IBOutlet weak var myButtonNegro: UIButton!
    @IBOutlet weak var myButtonBlanco: UIButton!
    
    let opciones = ["Negro","Blanco","Rojo","Gris"]
    var opcionSeleccionada:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.isHidden = true
            
        myPicker.delegate = self
        myPicker.dataSource = self
        
        opcionSeleccionada = opciones.first!
    }
    @IBAction func myButtonPasarAction(_ sender: Any) {
        performSegue(withIdentifier: "vcPasar", sender: self)
    }
    @IBAction func myButtonNegroAction(_ sender: Any) {
        performSegue(withIdentifier: "vcNegro", sender: self)
        
    }
    @IBAction func myButtonBlancoAction(_ sender: Any) {
        performSegue(withIdentifier: "vcBlanco", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vcPasar"{
            if let destino = segue.destination as? PasarViewController{
                destino.color = opcionSeleccionada
                destino.titulo = "Color Personalizado"
            }
        }
        if segue.identifier == "vcNegro"{
            if let destino = segue.destination as? NegroViewController{
                destino.titulo = "Negro"
            }
        }
        if segue.identifier == "vcBlanco"{
            if let destino = segue.destination as? BlancoViewController{
                destino.titulo = "Blanco"
            }
        }
    }
}
extension PickerViewController:
    //Numero de componentes seleccionables horizontalmente
    UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Numero de opciones seleccionables verticalmente
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return opciones.count
    }
    //Titulos de las opciones seleccionables
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return opciones[row]
    }
    //Acciones que se realizan al seleccionar una opcion
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        opcionSeleccionada = opciones[row]
        myLabel.isHidden = false
        myLabel.text = opciones[row]
    }
    
}
