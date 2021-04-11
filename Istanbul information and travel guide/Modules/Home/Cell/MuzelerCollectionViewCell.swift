//
//  MuzelerCollectionViewCell.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 11.04.2021.
//

import UIKit

class MuzelerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgMuze: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    var model: Camiler! {
        didSet {
            self.configure()
        }
    }
}

extension MuzelerCollectionViewCell {
func configure() {
    self.layer.masksToBounds = true
    self.layer.cornerRadius = 8
    self.layer.borderWidth = 1
    self.imgMuze.layer.cornerRadius = 8
    self.layer.borderColor =  UIColor.blackTwo.cgColor
    self.lblTitle.text = self.model.title
    self.imgMuze.load(url: URL(string: (self.model.photo)!)!)
    }
}
