//
//  GreenViewController.swift
//  AppTestLayout
//
//  Created by Carlos Rios on 28/03/22.
//

import UIKit

class GreenViewController: UIViewController {
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.isHidden = true
        
        mySearchBar.delegate = self
    }
}

extension GreenViewController:UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        myLabel.isHidden = false
        mySearchBar.resignFirstResponder()
        
        myLabel.text = "Buscando " + mySearchBar.text!
    }
}
