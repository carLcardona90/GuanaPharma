//
//  CrearCuenta.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 9/5/24.
//

import SwiftUI

struct CrearCuenta: View {
    @State var email=""
    @State var password=""
    @State private var NavegacionHome = false
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    var body: some View {
        VStack{
            ScrollView(.init(), showsIndicators: false){
                
                ZStack{
                    
                    VStack{
                        //Marca
                        HStack(alignment: .top, spacing: 0){
                            Image("guanaPharmaN").resizable().scaledToFit().frame(width: 250)
                        }
                        

                        
                        //Cuadro de datos
                        VStack(alignment: .leading){
                            
                            //Ingrese correo
                            Text("Correo electronico").fontWeight(.bold).padding(.top, 10).foregroundColor(Color.black)
                            VStack{
                                TextField("", text: self.$email)
                                Rectangle().fill(self.email == "" ? Color.black.opacity(0.08): Color("Azul")).frame(height: 3)
                            }
                            
                            //Ingrese contrasenia
                            Text("Contraseña").fontWeight(.bold).padding(.top, 10).foregroundColor(Color.black)
                            VStack{
                                SecureField("", text: self.$password)
                                Rectangle().fill(self.password == "" ? Color.black.opacity(0.08): Color("Azul")).frame(height: 3)
                            }
                            
                            //Iniciar sesion
                            HStack{
                                Spacer()
                                Button(action: {
                                    authenticationViewModel.crearNuevoUsuario( email: email, password: password)
                                }){
                                    Text("Crear cuenta").frame(width:100).fontWeight(.bold).foregroundColor(.white).padding(.vertical).padding(.horizontal, 35).background(Color("Verde")).cornerRadius(5).font(.system(size: 15))
                                }
                                if let messageError = authenticationViewModel.mensajeError {
                                    Text(messageError).bold().font(.body).foregroundColor(.red).padding(.top, 20)
                                }
                                Spacer()
                            }.padding(.top)
                            
                        }.padding().background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black.opacity(0.08), lineWidth: 1).shadow(radius: 4)).clipShape(RoundedRectangle(cornerRadius: 25))).padding(.horizontal)
                        
                        Spacer()
                        
                        Text("Copyright © 2024 GuanaPharma").foregroundColor(Color.black.opacity(0.7)).fontWeight(.bold)
                        
                    }
                }.padding(.top)
                    .padding(.bottom)
                
            }
        }
    }
}

#Preview {
    CrearCuenta(authenticationViewModel: AuthenticationViewModel())
}
