//
//  SaraylarCollectionViewCell.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 10.04.2021.
//

import UIKit

class SaraylarCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgSaray: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    var model: Camiler! {
        didSet {
            self.configure()
        }
    }
}

extension SaraylarCollectionViewCell {
func configure() {
    self.layer.masksToBounds = true
    self.layer.cornerRadius = 8
    self.layer.borderWidth = 1
    self.imgSaray.layer.cornerRadius = 8
    self.layer.borderColor =  UIColor.blackTwo.cgColor
    self.lblTitle.text = self.model.title
    self.imgSaray.load(url: URL(string: (self.model.photo)!)!)
    }
}
