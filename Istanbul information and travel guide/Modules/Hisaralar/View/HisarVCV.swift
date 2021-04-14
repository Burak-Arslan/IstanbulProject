//
//  HisarVCV.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 9.04.2021.
//

import UIKit
import MapKit
import CoreLocation

class HisarVCV: BaseVC<HisarVM> {
    @IBOutlet weak var map: MKMapView!
    
    var hisarlar : Camiler?
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HisarVCV: CLLocationManagerDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            manager.stopUpdatingLocation()
            render(location)
        }
    }
    
    func render(_ location: CLLocation){
        let enlem = Double((hisarlar?.enlem)!)
        let boylam = Double((hisarlar?.boylam)!)

        let coordinate = CLLocationCoordinate2D(latitude:enlem!,longitude:boylam!)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center:coordinate,span: span)
        
        map.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        map.addAnnotation(pin)
    }
}
