//
//  FarmaciasUbicaciones.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 30/5/24.
//

import Foundation
import MapKit

struct Ubicaciones: Identifiable {
    let id = UUID().uuidString
    
    let nombre: String
    let coordenadas: CLLocationCoordinate2D
    let direccion: String
    let imagenFarmacia: String
}

class FarmaciasUbicaciones: ObservableObject{
    static let ubicaciones: [Ubicaciones] = [
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.700755, longitude: -89.191391), direccion: "Esquina De La 3A. Calle Oriente Y La Avenida España", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.684538, longitude: -89.215809), direccion: "Pjs Sevilla #447 Col. Monserrat", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.713009, longitude: -89.179242), direccion: "29 Cl. Ote. Y Cl. Cipatly Comerciantes Del Isss Atlacatl", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.677659, longitude: -89.186199), direccion: "En Urbanización Las Conchas Pasaje 5 Frente A La Casa 36E", imagenFarmacia: "Uno"),
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.692187, longitude: -89.17353), direccion: "Pjs 4 Block F Casa #120 Punto De Referencia Iglesia Evengelica", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.718719, longitude: -89.181424), direccion: "Cl. Central Colonia Panamá", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.714395, longitude: -89.206685), direccion: "Pje. 17 De Mayo, Calle San Antonio Abad", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.725978, longitude: -89.236435), direccion: "Final Pasaje La Botija, Calle La Botija", imagenFarmacia: "Uno"),
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.716066, longitude: -89.197259), direccion: "Cl. San Carlos Col. San Carlos", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.682189, longitude: -89.209576), direccion: "Avenida Los Helechos, Colonia Vista Hermosa, San Salvador", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.682013, longitude: -89.224416), direccion: "Reparto Los Heroes,Calle Gabriel Rosales Casa#128", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.725826, longitude: -89.228684), direccion: "Final 75 Avenida Norte Colonia Miralvalle Casa # 8", imagenFarmacia: "Uno"),
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.719981, longitude: -89.221819), direccion: "Col. Bernal, Pje Reyes, Frente A Casa #613", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.726448, longitude: -89.228511), direccion: "Residencial El Manzano 3, Senda 1, Calle Motocross, Casa No. 5, San Salvador", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.705843, longitude: -89.182628), direccion: "16 Av. Nte. Sector Del Río", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.67718, longitude: -89.226078), direccion: "Calle Huizucar ,Por La Texaco De Loma Linda", imagenFarmacia: "Uno"),
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.67786, longitude: -89.204995), direccion: "Calle Las Brisas #213, Por Fabrica Capri", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.688124, longitude: -89.244616), direccion: "Avenida Las Acacias Torre San Benito # 21 Colonia San Benito", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.701256, longitude: -89.19122), direccion: "Av. España Centro Histórico", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.659717, longitude: -89.217148), direccion: "Cima 3, Pasaje 28, Casa 75-D, San Salvador", imagenFarmacia: "Uno"),
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.704444, longitude: -89.199516), direccion: "17 Av. Nte. Y 9A Cl. Ote.", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.708187, longitude: -89.185994), direccion: "10A Av. Nte. Y 19 Cl. Ote. Col. Mugdan", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.713283, longitude: -89.246083), direccion: "Comunidad Lajas Oriente", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.708049, longitude: -89.182713), direccion: "Colonia Guatemala, Avenida Cuascatancingo, San Salvador.", imagenFarmacia: "Uno"),
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.724077, longitude: -89.229674), direccion: "Reparto Santa Leonor, Pasaje Italia, Frente A Casas #36 Y #37, Miralvalle.", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.717239, longitude: -89.199688), direccion: "Colonia San Carlos Edificio C #31 Y #32", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.706331, longitude: -89.185676), direccion: "Av. Cuscatancingo Local Recicladora De La Col. El Bosque", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.686259, longitude: -89.182578), direccion: "Calle Benjamín Orozco, Barrio San Jacinto,  Residencial San Jacinto, Calle Principal Hacia La Comunidad El Campito, San Salvador.", imagenFarmacia: "Uno"),
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.688402, longitude: -89.231025), direccion: "Colonia Las Mercedes,Calle Las Mercedes ,Casa#7", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.697096, longitude: -89.234402), direccion: "Calle Nueva # 2 Y Calle La Mascota Colonia Escalón", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.674702, longitude: -89.227809), direccion: "Calle Antigua A Huizucar #15, San Salvador", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.721274, longitude: -89.22524), direccion: "Pasaje Ginebra, #16, Residencial Jardines De Miralvalle", imagenFarmacia: "Uno"),
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.689322, longitude: -89.221128), direccion: "Colonia San Mateo Calle Bogota Casa#3B", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.687659, longitude: -89.197464), direccion: "Calle 15 De Septiembre", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.708192, longitude: -89.2601), direccion: "Final Calle Arturo Ambrogi Residencial La Montaña", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.721597, longitude: -89.19918), direccion: "Cl. Circunvalación Com. Nuevo Renacer", imagenFarmacia: "Uno"),
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.695144, longitude: -89.209358), direccion: "Calle Y Urbanización Gerardo Barrios", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.711853, longitude: -89.184221), direccion: "27 Cl. Ote. Casa #608 Col. Magaña", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.718418, longitude: -89.200006), direccion: "Cl. Circunvalación Sector Cancha De Fútbol", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.716049, longitude: -89.208902), direccion: "Calle No.4, Casa #127, Colonia El Roble", imagenFarmacia: "Uno"),
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.683601, longitude: -89.209725), direccion: "Av. Los Cafetos #234", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.691818, longitude: -89.227115), direccion: "Calle Antigua A Santa Tecla Colonia Nueva Israel Sector Molino Nuevo Casa#301", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.669195, longitude: -89.210039), direccion: "Comunidad Lajas Oriente,Pasaje Romero", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.718068, longitude: -89.191245), direccion: "39 Cl. Pte. Pje. 2 Col. Vairo", imagenFarmacia: "Uno"),
        Ubicaciones(nombre: "Farmacia San Nicolas", coordenadas: CLLocationCoordinate2D(latitude: 13.700347, longitude: -89.176456), direccion: "Ex-Terminal De Oriente", imagenFarmacia: "SanNicolas"),
        Ubicaciones(nombre: "Farmacias Economicas", coordenadas: CLLocationCoordinate2D(latitude: 13.704278, longitude: -89.241184), direccion: "87 Avenida Norte Y Senda B Casa # 7 Colonia Escalón", imagenFarmacia: "Economicas"),
        Ubicaciones(nombre: "FarmaValue", coordenadas: CLLocationCoordinate2D(latitude: 13.717895, longitude: -89.209046), direccion: "37 Avenida, Calle Las Orquideas #25", imagenFarmacia: "FarmaValue"),
        Ubicaciones(nombre: "Farmacia UNO", coordenadas: CLLocationCoordinate2D(latitude: 13.687837, longitude: -89.226741), direccion: "Avenida Las Dalias De La Colonia San Francisco", imagenFarmacia: "Uno")
    ]
}

class LocationsViewModel: ObservableObject {
    @Published var ubicaciones: [Ubicaciones]
    init(){
        let ubicacion = FarmaciasUbicaciones.ubicaciones
        self.ubicaciones = ubicacion
    }
}
