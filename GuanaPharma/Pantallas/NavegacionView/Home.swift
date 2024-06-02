//
//  Home.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 2/5/24.
//

import SwiftUI

struct Home : View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @StateObject var medicamentosViewModel: MedicamentosViewModel = MedicamentosViewModel()
    let iconosMenu = ["pill.circle", "cross.circle", "star.circle", "person.circle"]
    @State var IndexSeleccionado=0
    var body: some View {
        VStack{
            ZStack{
                switch IndexSeleccionado{
                case 0:
                    NavigationView{
                        VStack{
                            MedicamentosView(medicamentosViewModel: medicamentosViewModel)
                        }.navigationTitle("Medicamentos").toolbar{
                            Button(action: {
                                authenticationViewModel.logout()
                            }, label: {
                                HStack{
                                    Text(" Desconectar").foregroundColor(Color("Rosa")).bold()
                                }
                            })
                        }
                    }
                case 1:
                    NavigationView{
                        VStack{
                            Farmacias()
                        }.navigationTitle("Farmacias").toolbar{
                            Button(action: {
                                authenticationViewModel.logout()
                            }, label: {
                                HStack{
                                    Text(" Desconectar").foregroundColor(Color("Rosa")).bold()
                                }
                            })
                        }
                    }
                case 2:
                    NavigationView{
                        VStack{
                            FavoritoMedicamento(medicamentosViewModel: medicamentosViewModel)
                        }.navigationTitle("Favoritos").toolbar{
                            Button(action: {
                                authenticationViewModel.logout()
                            }, label: {
                                HStack{
                                    Text(" Desconectar").foregroundColor(Color("Rosa")).bold()
                                }
                            })
                        }
                    }
                default:
                    NavigationView{
                        VStack{
                            CuentaUsuario(authenticationViewModel: authenticationViewModel)
                        }.navigationTitle("Perfil de usuario").toolbar{
                            Button(action: {
                                authenticationViewModel.logout()
                            }, label: {
                                HStack{
                                    Text(" Desconectar").foregroundColor(Color("Rosa")).bold()
                                }
                            })
                        }
                    }
                }
            }
            Spacer()
            HStack{
                ForEach(0..<4, id: \.self){ numeros in
                Spacer()
                    Button(action: {
                        self.IndexSeleccionado = numeros
                    }, label: {

                            Image(systemName: iconosMenu[numeros]).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(Color("Verde"))
                        
                    })
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    Home(authenticationViewModel: AuthenticationViewModel())
}
