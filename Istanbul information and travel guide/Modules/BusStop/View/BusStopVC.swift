//
//  BusStopVC.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 13.04.2021.
//

import UIKit
import MapKit
import CoreLocation


class BusStopVC: BaseVC<BusStopVM> {

    @IBOutlet weak var map: MKMapView!
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.viewModel?.getBusStop()
        
        viewModel?.busStopInfo.subscribe(onNext : { [self](data) in
            for i in 0..<data.features!.count {
                render(data.features![i])
                if(i>500){
                    break
                }
            }
        }).disposed(by: loadingDisposeBag)
    }
}

extension BusStopVC: CLLocationManagerDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func render(_ location: Feature){
        let enlem = Double((location.geometry?.coordinates![1])!)
        let boylam = Double((location.geometry?.coordinates![0])!)

        let coordinate = CLLocationCoordinate2D(latitude:enlem,longitude:boylam)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center:coordinate,span: span)
        
        map.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        pin.subtitle = location.properties?.sdurakadi
        pin.title = location.properties?.ilceadi?.rawValue
        pin.coordinate = coordinate
        map.addAnnotation(pin)
    }
}

