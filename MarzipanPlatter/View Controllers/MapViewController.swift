//
//  MapViewController.swift
//  MarzipanPlatter
//
//  Created by Michael Thomas on 6/7/18.
//  Copyright © 2018 Biscuit Labs. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.mapType = .hybrid
        mapView.isRotateEnabled = true
        mapView.isZoomEnabled = true
        mapView.showsScale = true
        mapView.showsBuildings = true
        
        self.view.addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Animate to our region of interest (Charlottesville, VA)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.0293, longitude: -78.4767), span: MKCoordinateSpan(latitudeDelta: CLLocationDegrees(0.05), longitudeDelta: CLLocationDegrees(0.05)))
        mapView.setRegion(region, animated: true)
    }
}
