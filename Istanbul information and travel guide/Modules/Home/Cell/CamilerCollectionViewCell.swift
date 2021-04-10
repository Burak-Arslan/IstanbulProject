//
//  CamilerCollectionViewCell.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 10.04.2021.
//

import UIKit

class CamilerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgCamiler: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    var model: Camiler! {
        didSet {
            self.configure()
        }
    }
}

extension CamilerCollectionViewCell {
func configure() {
    self.layer.masksToBounds = true
    self.layer.cornerRadius = 8
    self.layer.borderWidth = 1
    self.imgCamiler.layer.cornerRadius = 8
    self.layer.borderColor =  UIColor.blackTwo.cgColor
    self.lblTitle.text = self.model.title
    self.imgCamiler.load(url: URL(string: (self.model.photo)!)!)
    }
}


