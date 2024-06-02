//
//  CuentaUsuario.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 25/5/24.
//

import SwiftUI
import Firebase

struct CuentaUsuario: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    var body: some View {
        VStack{
            Image("Usuario").resizable().frame(width: 50, height: 50)
            Text("Correo electronico:").padding(.vertical)
            if let user = authenticationViewModel.user{
                Text("\(user.email)")
            } else {
                Text("Incognito")
            }
            Spacer()
            Button("Cerrar sesion"){
                authenticationViewModel.logout()
            }
            Spacer()

        }.padding().frame(width:380, height: 200).background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black.opacity(0.08), lineWidth: 1).shadow(radius: 4)).clipShape(RoundedRectangle(cornerRadius: 25)))
    }
}

#Preview {
    CuentaUsuario(authenticationViewModel: AuthenticationViewModel())
}
