//
//  KiliselerCollectionViewCell.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 10.04.2021.
//

import UIKit

class KiliselerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgKilise: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    var model: Camiler! {
        didSet {
            self.configure()
        }
    }
}

extension KiliselerCollectionViewCell {
func configure() {
    self.layer.masksToBounds = true
    self.layer.cornerRadius = 8
    self.layer.borderWidth = 1
    self.imgKilise.layer.cornerRadius = 8
    self.layer.borderColor =  UIColor.blackTwo.cgColor
    self.lblTitle.text = self.model.title
    self.imgKilise.load(url: URL(string: (self.model.photo)!)!)
    }
}
