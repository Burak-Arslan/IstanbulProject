//
//  HomeVC.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 8.04.2021.
//

import UIKit

class HomeVC: BaseVC<HomeVM>{

    override func viewDidLoad() {
        super.viewDidLoad()
        let data = self.viewModel!.getIstanbulInfo()
        var test = ""
    }
}
