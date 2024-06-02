//
//  AuthenticationViewModel.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 17/5/24.
//

import Foundation

final class AuthenticationViewModel: ObservableObject{
    @Published var user: User?
    @Published var mensajeError: String?
    private let authenticationRepository: AuthentucationRepository
    
    init(authenticationRepository: AuthentucationRepository = AuthentucationRepository()) {
        self.authenticationRepository = authenticationRepository
        getCurrentUser()
    }
    
    func getCurrentUser() {
        self.user = authenticationRepository.getCurrentUser()
    }
    
    func crearNuevoUsuario(email: String, password: String){
        authenticationRepository.crearNuevoUsuario(email: email, password: password){
            [weak self] result in
            switch result{
            case .success(let user):
                self?.user=user
            case .failure(let error):
                self?.mensajeError=error.localizedDescription
            }
        }
        getCurrentUser()
    }
    
    func login(email: String, password: String){
        authenticationRepository.login(email: email, password: password){
            [weak self] result in
            switch result{
            case .success(let user):
                self?.user=user
            case .failure(let error):
                self?.mensajeError=error.localizedDescription
            }
        }
    }
    
    func logout() {
        do {
            try authenticationRepository.logout()
            self.user = nil
        } catch {
            print("Error logout")
        }
    }
}
