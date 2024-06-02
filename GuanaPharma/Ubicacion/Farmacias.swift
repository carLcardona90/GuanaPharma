//
//  Farmacias.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 3/5/24.
//

import SwiftUI
import MapKit

struct Farmacias : View {
    
    @StateObject var ubicacionViewModel = UbicacionViewModel()
    @StateObject var locationViewModel = LocationsViewModel()
    
    var body: some View {
    VStack(alignment: .leading){
        Text("Farmacias autorizadas por la DNM:")

        VStack{
            Map(coordinateRegion: $ubicacionViewModel.ubicacionUsuario,
                showsUserLocation: true,
                annotationItems: locationViewModel.ubicaciones,
                annotationContent: { location in
                MapAnnotation(coordinate: location.coordenadas){
                    Image("\(location.imagenFarmacia)").resizable().frame(width: 15, height: 15)
                }
            }).cornerRadius(25)
            
            
            if ubicacionViewModel.usuarioAutorizoUbicacion {
                Text ("Ubicacion aceptada").bold().padding(.top, 12)
                Link("Pulsa para cambiar la autorizacion", destination: URL(string: UIApplication.openSettingsURLString)!).padding(32)
            } else {
                Text ("Ubicacion no aceptada").bold().padding(.top, 12)
                Link("Pulsa para aceptar la autorizacion", destination: URL(string: UIApplication.openSettingsURLString)!).padding(32)
            }
        }
        
    }.padding().background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black.opacity(0.08), lineWidth: 1).shadow(radius: 4)).clipShape(RoundedRectangle(cornerRadius: 25))).padding(.horizontal)
}
}

#Preview {
    Farmacias()
}
