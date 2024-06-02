//
//  InicioSesion.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 29/4/24.
//

import SwiftUI

struct InicioSesion : View {
    @State var email=""
    @State var password=""
    @State private var NavegacionHome = false
    @State private var NavegacionCrearCuenta = false
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    var body: some View{
        ScrollView(.init(), showsIndicators: false){
            
            ZStack{
                
                VStack{
                    //Marca
                    HStack(alignment: .top, spacing: 0){
                        Image("guanaPharmaN").resizable().scaledToFit().frame(width: 250)
                    }
                    
                    Spacer()
                    
                    //Cuadro de datos
                    VStack(alignment: .leading){
                        
                        //Ingrese correo
                        Text("Correo electronico").fontWeight(.bold).padding(.top, 10)
                        VStack{
                            TextField("", text: self.$email)
                            Rectangle().fill(self.email == "" ? Color.black.opacity(0.08): Color("Azul")).frame(height: 3)
                        }
                        
                        //Ingrese contrasenia
                        Text("Contraseña").fontWeight(.bold).padding(.top, 10)
                        VStack{
                            SecureField("", text: self.$password)
                            Rectangle().fill(self.password == "" ? Color.black.opacity(0.08): Color("Azul")).frame(height: 3)
                        }
                        
                        //Olvido contrasenia
                        HStack{
                            Spacer()
                            Button(action: {}){
                                Text("Olvidaste la contraseña?").fontWeight(.bold).foregroundColor(Color("Rosa")).font(.system(size: 13))
                            }
                        }.padding(.top)
                        
                        //Iniciar sesion
                        HStack{
                            Spacer()
                            Button(action: {
                            authenticationViewModel.login(email: email, password: password)
                        }){
                            Text("Iniciar").frame(width:100).fontWeight(.bold).foregroundColor(.white).padding(.vertical).padding(.horizontal, 35).background(Color("Verde")).cornerRadius(5).font(.system(size: 18))
                        }

                            Spacer()
                        }.padding(.top)
                        if let messageError = authenticationViewModel.mensajeError{
                            Text(messageError).bold().font(.body).foregroundColor(.red).padding(.top, 20)
                        }
                        
                    }.padding().background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black.opacity(0.08), lineWidth: 1).shadow(radius: 4)).clipShape(RoundedRectangle(cornerRadius: 25))).padding(.horizontal)
                    
                    //Crear usuario nuevo
                    HStack{
                        Text("Si eres nuevo crea tu cuenta").foregroundStyle(.black.opacity(0.7))
                        
                        Button(action: {
                            self.NavegacionCrearCuenta.toggle()
                        }){
                            Text("aqui").fontWeight(.bold).foregroundColor(Color("Rosa")).sheet(isPresented: $NavegacionCrearCuenta) {
                                CrearCuenta(authenticationViewModel: AuthenticationViewModel())
                            }
                        }
                        
                    }.padding(.top)
                    
                    //Logeo con cuentas de redes sociales
                    HStack{
                        Rectangle().fill(Color.black.opacity(0.05)).frame(width: 100, height: 5)
                        
                        Text("Incognito").foregroundColor(Color.black.opacity(0.7)).fontWeight(.bold)
                        
                        Rectangle().fill(Color.black.opacity(0.05)).frame(width: 100, height: 5)
                    }.padding(.top,30)
                    
                    HStack{
                        
                        /*Button(action: {}){
                            Image("AppleIcon").resizable().foregroundColor(.white).frame(width: 42, height: 42).padding(8).clipShape(Circle())}
                        
                        Button(action: {}){
                            Image("Facebook").resizable().foregroundColor(.white).frame(width: 42, height: 42).padding(8).clipShape(Circle()).offset(y:3)}*/
                        
                        VStack{
                            Button(action: {
                                self.NavegacionHome.toggle()
                            }){
                                Image("IncognitoIcon").resizable().foregroundColor(.white).frame(width: 42, height: 42).padding(8).clipShape(Circle()).offset(y:3)}.sheet(isPresented: $NavegacionHome) {
                                    Home(authenticationViewModel: AuthenticationViewModel())
                                }
                        }
                    }
                      
                    
                    Spacer()
                    
                    Text("Copyright © 2024 GuanaPharma").foregroundColor(Color.black.opacity(0.7)).fontWeight(.bold)
                    
                    Spacer()
                    
                }
            }.padding(.top)
                .padding(.bottom)
            
        }
    }
}

#Preview {
    InicioSesion(authenticationViewModel: AuthenticationViewModel())
}
