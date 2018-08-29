//
//  MapView.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/27/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit
import PureLayout
import MapKit

//class MapView: UIView {
//
//    private var mapView: MKMapView?
//    private var buttonView: UIView?
//    var task:Task? {
//        didSet {
//            if let taskAddress = self.task?.taskAddress {
//                let initialLocation = CLLocation(latitude: taskAddress.lat, longitude: taskAddress.lng)
//                centerMapOnLocation(location: initialLocation)
//                let artwork = Artwork(title: taskAddress.address,
//                                      locationName: taskAddress.address,
//                                      coordinate: CLLocationCoordinate2D(latitude: taskAddress.lat, longitude: taskAddress.lng))
//                self.mapView?.addAnnotation(artwork)
//            } else {
//                let initialLocation = CLLocation(latitude: 0.0, longitude: 0.0)
//                centerMapOnLocation(location: initialLocation)
//            }
//        }
//    }
//    private var isOpen: Bool = false
//    var actionShowMap: ((_ status: Bool) -> Void)?
//    private let regionRadius: CLLocationDistance = 400
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        showMapView()
//        showViewMapButton()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        showMapView()
//        showViewMapButton()
//    }
//
//    private func centerMapOnLocation(location: CLLocation) {
//
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
//                                                                  regionRadius, regionRadius)
//        self.mapView?.setRegion(coordinateRegion, animated: true)
//    }
//
//    private func showMapView() {
//        let mapV = MKMapView()
//        let initialLocation = CLLocation(latitude: 0.0, longitude: 0.0)
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate,
//                                                                  regionRadius, regionRadius)
//        mapV.setRegion(coordinateRegion, animated: true)
//        self.addSubview(mapV)
//        mapV.translatesAutoresizingMaskIntoConstraints = false
//        mapV.autoPinEdgesToSuperviewEdges()
//        mapV.isHidden = true
//        self.mapView = mapV
//    }
//
//    private func showViewMapButton() {
//        let buttonV = UIView()
//        buttonV.backgroundColor = .white
//        self.addSubview(buttonV)
//        buttonV.translatesAutoresizingMaskIntoConstraints = false
//        buttonV.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(0, 0, 0, 0), excludingEdge: .bottom)
//        buttonV.autoSetDimension(.height, toSize: 42)
//        self.buttonView = buttonV
//        let button = UIButton()
//        button.addTarget(self, action: #selector(actionShowMap(_:)), for: .touchUpInside)
//        self.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.autoPinEdge(toSuperviewEdge: .trailing)
//        button.autoPinEdge(toSuperviewEdge: .top)
//        button.autoMatch(.width, to: .height, of: buttonV)
//        button.autoMatch(.height, to: .height, of: buttonV)
//        button.setImage(#imageLiteral(resourceName: "ic_map"), for: .normal)
//
//    }
//
//    @objc func actionShowMap(_ sender: Any) {
//        isOpen = !isOpen
//        actionShowMap?(isOpen)
//        if isOpen {
//            self.mapView?.isHidden = false
//            self.buttonView?.alpha = 0.6
//        } else {
//            self.mapView?.isHidden = true
//            self.buttonView?.alpha = 1
//        }
//    }
//
//}
//
//class Artwork: NSObject, MKAnnotation {
//    var title: String? = ""
//    var locationName: String?
//    var coordinate: CLLocationCoordinate2D
//    
//    init(title: String?, locationName: String?,  coordinate: CLLocationCoordinate2D) {
//        self.title = title
//        self.locationName = locationName
//        self.coordinate = coordinate
//    }
//
//}

