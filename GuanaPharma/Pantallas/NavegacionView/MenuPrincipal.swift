//
//  MenuPrincipal.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 3/5/24.
//

import SwiftUI

struct MenuPrincipal: View {
    var body: some View{
        VStack{
            Text("Puedes acceder a")
            HStack{
                VStack{
                    Image("ListadoMenu").resizable().scaledToFit().frame(height: 100).padding(.all)
                    Text("Medicamentos").padding(.vertical)
                }.padding().background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black.opacity(0.08), lineWidth: 1).shadow(radius: 4)).clipShape(RoundedRectangle(cornerRadius: 25)))
                
                VStack{
                    Image("UbicacionMenu").resizable().scaledToFit().frame(height: 100).padding(.all)
                    Text("Farmacias").padding(.vertical)
                }.padding().background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black.opacity(0.08), lineWidth: 1).shadow(radius: 4)).clipShape(RoundedRectangle(cornerRadius: 25)))
            }
            
            HStack{
                VStack{
                    Image("FavoritosMenu").resizable().scaledToFit().frame(height: 100).padding(.all)
                    Text("Favoritos").padding(.vertical)
                }.padding().background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black.opacity(0.08), lineWidth: 1).shadow(radius: 4)).clipShape(RoundedRectangle(cornerRadius: 25)))
                
                VStack{
                    Image("UsuarioMenu").resizable().scaledToFit().frame(height: 100).padding(.all)
                    Text("Usuario").padding(.vertical)
                }.padding().background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black.opacity(0.08), lineWidth: 1).shadow(radius: 4)).clipShape(RoundedRectangle(cornerRadius: 25)))
            }
        }.padding(.bottom)
    }
}

#Preview {
    MenuPrincipal()
}
