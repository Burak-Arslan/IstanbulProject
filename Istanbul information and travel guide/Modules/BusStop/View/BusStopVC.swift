//
//  BusStopVC.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 13.04.2021.
//

import UIKit

class BusStopVC: BaseVC<BusStopVM> {

    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.viewModel?.getBusStop()
    
    }
}
