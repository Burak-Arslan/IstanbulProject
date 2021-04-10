//
//  HisarCollectionViewCell.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 8.04.2021.
//

import UIKit

class HisarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgHisar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    var model: Camiler! {
        didSet {
            self.configure()
        }
    }
}


extension HisarCollectionViewCell {
    func configure() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.imgHisar.layer.cornerRadius = 8
        self.layer.borderColor =  UIColor.blackTwo.cgColor
        self.lblName.text = self.model.title
        self.imgHisar.load(url: URL(string: (self.model.photo)!)!)
    }
}

