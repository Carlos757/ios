//
//  ViewController.swift
//  AppIOS
//
//  Created by Carlos Rios on 07/02/22.
//

import UIKit

class ViewController: UIViewController {

//    Outlets
    @IBOutlet weak var myBoton: UIButton!
    @IBOutlet weak var myCombo: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var myStepperLabel: UILabel!
    @IBOutlet weak var mySwitchLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    let data = ["Gris","Rosa","Amarillo","Rojo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Botones
        myBoton.setTitle("Mi Botón", for: .normal)
        myBoton.setTitle("Desactivado", for: .disabled)
        myBoton.backgroundColor = .blue
        myBoton.setTitleColor(.white, for: .normal)
        
        //Combos o Pickers
        myCombo.dataSource = self
        myCombo.delegate = self
        
        //Page Control o paginador
        myPageControl.numberOfPages = data.count
        myPageControl.currentPageIndicatorTintColor = .blue
        
        //Segmented Controls
        mySegmentedControl.removeAllSegments()
        for(index, value) in data.enumerated(){
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        mySegmentedControl.selectedSegmentIndex = 0
        
        //Slider
        mySlider.value = 0
        mySlider.minimumValue = 0
        mySlider.maximumValue = Float(data.count)
        mySlider.tintColor = .brown
        
        //Stepper
        myStepper.maximumValue = Double(data.count-1)
        myStepper.minimumValue = 0
        myStepper.value = 0
        
        // Switch
        mySwitch.onTintColor = .blue
//        mySwitch.setOn(false, animated: true)
        mySwitch.isOn = true
        
        // ProgressView
        myProgressView.progress = 0
        
        // ActivityIndicator
        myActivityIndicator.hidesWhenStopped = true
        
        //Labels
        myStepperLabel.font = UIFont.boldSystemFont(ofSize: 24)
        myStepperLabel.text = "1"
        
        mySwitchLabel.font = UIFont.boldSystemFont(ofSize: 18)
        mySwitchLabel.text = "Encendido"
        
        //TextField
        myTextField.placeholder = "Escribe Algo...."
        myTextField.delegate = self
        myTextField.clearButtonMode = .always
        
        //TextView
        myTextView.isEditable = true
        myTextView.delegate = self
        
        
    }
    // Actions
    @IBAction func myBotonAction(_ sender: Any) {
        if myBoton.backgroundColor == .blue {
            myBoton.backgroundColor = .green
            myBoton.setTitle("Correcto", for: .normal)
        }else if myBoton.backgroundColor == .green{
            myBoton.backgroundColor = .blue
            myBoton.setTitle("Mi Botón", for: .normal)
        }
        myTextView.resignFirstResponder()
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        let paginaSeleccionada:Int = myPageControl.currentPage
        myCombo.selectRow(paginaSeleccionada, inComponent: 0, animated: true)
        myBoton.setTitle(data[paginaSeleccionada], for: .normal)
        cambiaColor(pagina:paginaSeleccionada)
        mySegmentedControl.selectedSegmentIndex = paginaSeleccionada
        mySlider.value = Float(paginaSeleccionada)
        myStepper.value = Double(paginaSeleccionada)
    }
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        let opcionSeleccionada:Int = mySegmentedControl.selectedSegmentIndex
        myCombo.selectRow(opcionSeleccionada, inComponent: 0, animated: true)
        myPageControl.currentPage = opcionSeleccionada
        myBoton.setTitle(data[opcionSeleccionada], for: .normal)
        cambiaColor(pagina:opcionSeleccionada)
        mySlider.value = Float(opcionSeleccionada)
        myStepper.value = Double(opcionSeleccionada)
    }
    
    @IBAction func mySliderAction(_ sender: Any) {
        let valorSlider = mySlider.value
        switch valorSlider{
        case 0..<1:
            mySegmentedControl.selectedSegmentIndex = 0
            myCombo.selectRow(0, inComponent: 0, animated: true)
            myPageControl.currentPage = 0
            myBoton.setTitle(data[0], for: .normal)
            cambiaColor(pagina:0)
            myStepper.value = 0
            myProgressView.progress = 0
        case 1..<2:
            mySegmentedControl.selectedSegmentIndex = 1
            myCombo.selectRow(1, inComponent: 0, animated: true)
            myPageControl.currentPage = 1
            myBoton.setTitle(data[1], for: .normal)
            cambiaColor(pagina:1)
            myStepper.value = 1
            myProgressView.progress = 0.35
        case 2..<3:
            mySegmentedControl.selectedSegmentIndex = 2
            myCombo.selectRow(2, inComponent: 0, animated: true)
            myPageControl.currentPage = 2
            myBoton.setTitle(data[2], for: .normal)
            cambiaColor(pagina:2)
            myStepper.value = 2
            myProgressView.progress = 0.70
        default:
            mySegmentedControl.selectedSegmentIndex = 3
            myCombo.selectRow(3, inComponent: 0, animated: true)
            myPageControl.currentPage = 3
            myBoton.setTitle(data[3], for: .normal)
            cambiaColor(pagina:3)
            myStepper.value = 3
            myProgressView.progress = 1
            
        }
    }
    @IBAction func myStepperAction(_ sender: Any) {
        let valor = myStepper.value
        mySegmentedControl.selectedSegmentIndex = Int(valor)
        myCombo.selectRow(Int(valor), inComponent: 0, animated: true)
        myPageControl.currentPage = Int(valor)
        myBoton.setTitle(data[Int(valor)], for: .normal)
        cambiaColor(pagina:Int(valor))
        mySlider.value = Float(valor)
        
        myStepperLabel.text = "\(Int(valor+1))"
    }
    @IBAction func mySwitchAction(_ sender: Any) {
        if mySwitch.isOn {
            myActivityIndicator.stopAnimating()
            myBoton.setTitle("Activado", for: .normal)
            myCombo.isHidden = false
            myStepper.isEnabled = true
            myPageControl.isEnabled = true
            myBoton.isEnabled = true
            mySlider.isEnabled = true
            mySegmentedControl.isEnabled = true
            
            mySwitchLabel.text = "Encendido"
        }else{
            myActivityIndicator.startAnimating()
            myActivityIndicator.style = .large
            myBoton.setTitle("Desactivado", for: .normal)
            myStepper.isEnabled = false
            myPageControl.isEnabled = false
            myCombo.isHidden = true
            myBoton.isEnabled = false
            mySlider.isEnabled = false
            mySegmentedControl.isEnabled = false
            
            mySwitchLabel.text = "Apagado"
            
        }
    }
    
    
    //Funciones adicionales
    func cambiaColor(pagina:Int){
        switch data[pagina]{
        case("Gris"): myBoton.backgroundColor = .gray
            myPageControl.currentPageIndicatorTintColor = .gray
            mySlider.tintColor = .gray
        case("Rosa"): myBoton.backgroundColor = .systemPink
            myPageControl.currentPageIndicatorTintColor = .systemPink
            mySlider.tintColor = .systemPink
        case("Amarillo"): myBoton.backgroundColor = .yellow
            myPageControl.currentPageIndicatorTintColor = .yellow
            mySlider.tintColor = .yellow
        case("Rojo"): myBoton.backgroundColor = .red
            myPageControl.currentPageIndicatorTintColor = .red
            mySlider.tintColor = .red
        default:
            myBoton.backgroundColor = .blue
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myBoton.setTitle(data[row], for: .normal)
        cambiaColor(pagina:row)
        myPageControl.currentPage = row
        mySegmentedControl.selectedSegmentIndex = row
        mySlider.value = Float(row)
        myStepper.value = Double(row)
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        myBoton.setTitle(myTextField.text, for: .normal)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        myTextField.isHidden = true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        myTextField.isHidden = false
    }
}

