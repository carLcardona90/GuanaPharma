//
//  UbicacionViewModel.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 30/5/24.
//

import Foundation
import CoreLocation
import MapKit

final class UbicacionViewModel: NSObject, ObservableObject {
    private struct UbicacionPorDefecto {
        static let latitude = 13.701440052959436
        static let longitude = -89.22444402883579
    }
    
    private struct Span {
        static let delta = 0.1
    }
    
    @Published var usuarioAutorizoUbicacion: Bool = false
    
    @Published var ubicacionUsuario: MKCoordinateRegion = .init()
    private let ubicacionManager: CLLocationManager = .init()
    
    override init() {
        super.init()
        ubicacionManager.desiredAccuracy = kCLLocationAccuracyBest
        ubicacionManager.requestWhenInUseAuthorization()
        ubicacionManager.startUpdatingLocation()
        ubicacionManager.delegate = self
        ubicacionUsuario = .init(center: .init(latitude: UbicacionPorDefecto.latitude, longitude: UbicacionPorDefecto.longitude), span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
    }
    
    func validarAutorizacionUsuario() {
        let status = ubicacionManager.authorizationStatus
        switch status {
        case .notDetermined, .restricted, .denied:
            usuarioAutorizoUbicacion = false
        case .authorizedAlways, .authorizedWhenInUse:
            usuarioAutorizoUbicacion = true
        @unknown default :
            print("")
        }
    }
    
}

extension UbicacionViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let ubicacion = locations.last else {
            return
        }
        print("Ubicacion \(ubicacion)")
        ubicacionUsuario = .init(center: ubicacion.coordinate, span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        validarAutorizacionUsuario()
    }
    
}
