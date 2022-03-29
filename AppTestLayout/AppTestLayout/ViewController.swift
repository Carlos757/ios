//
//  ViewController.swift
//  AppTestLayout
//
//  Created by Carlos Rios on 17/03/22.
//

import UIKit
import WebKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myView1: UIView!
    @IBOutlet weak var myButtonView1: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myButtonMostrar: UIButton!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myNavigationBar: UINavigationItem!
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myNavigationBar.title = "Hola"
        
        myButtonMostrar.isHidden = true
        
        myWebView.load(URLRequest(url: URL(string:"https://www.google.com")!))
    
        myMap.setCenter(.init(latitude: 24.8042, longitude: -107.431), animated: true)
        
    }
    @IBAction func myButtonView1Action(_ sender: Any) {
        myView1.isHidden = true
        myButtonMostrar.isHidden = false
    }
    @IBAction func myButtonMostrar(_ sender: Any) {
        myButtonMostrar.isHidden = true
        myView1.isHidden = false
    }
    

}

