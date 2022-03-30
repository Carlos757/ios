//
//  MyCustomTableViewCell.swift
//  TableView
//
//  Created by Carlos Rios on 28/03/22.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var myFirstLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myFirstLabel.font = .systemFont(ofSize: 20)
        myFirstLabel.textColor = .blue
        
        //inifinitas lineas
        mySecondLabel.numberOfLines = 0
        
        
        backgroundColor = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        //print(myFirstLabel.text ?? "Vacio")
    }
    
}
