//
//  CarsilarCollectionViewCell.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 10.04.2021.
//

import UIKit

class CarsilarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgCarsilar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    var model: Camiler! {
        didSet {
            self.configure()
        }
    }
}

extension CarsilarCollectionViewCell {
func configure() {
    self.layer.masksToBounds = true
    self.layer.cornerRadius = 8
    self.layer.borderWidth = 1
    self.imgCarsilar.layer.cornerRadius = 8
    self.layer.borderColor =  UIColor.blackTwo.cgColor
    self.lblTitle.text = self.model.title
    self.imgCarsilar.load(url: URL(string: (self.model.photo)!)!)
    }
}
