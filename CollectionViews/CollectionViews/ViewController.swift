//
//  ViewController.swift
//  CollectionViews
//
//  Created by Carlos Rios on 29/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    private let paises = ["Mexico","Estados Unidos", "Australia", "Japon","China","Rusia","Korea"]
    
    private let myCellWidth = UIScreen.main.bounds.width / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        myCollectionView.register(UINib(nibName: "MyCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate{
    
    //Al dar click en row
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(paises[indexPath.row])
    }
    
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource{
    //Numero de elementos en seccion
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paises.count
    }
    //Numero de secciones
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //Informacion mostrada en el item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? MyCustomCollectionViewCell
        
        if indexPath.section == 0 {
            cell?.myLabel.text = paises[indexPath.row]
            cell?.backgroundColor = .gray
            
            return cell!
        }
        
        cell?.myLabel.text = "\(indexPath.row+1) - \(paises[indexPath.row])"
        cell?.backgroundColor = .gray
        return cell!
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: myCellWidth, height: myCellWidth)
        }
        return CGSize(width: myCellWidth*2, height: myCellWidth*2)
    }
}

