//
//  MyCustomCollectionViewCell.swift
//  CollectionViews
//
//  Created by Carlos Rios on 29/03/22.
//

import UIKit

class MyCustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .lightGray
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myLabel.textColor = .blue
    }

}
