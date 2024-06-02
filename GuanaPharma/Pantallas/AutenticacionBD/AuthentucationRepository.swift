//
//  AuthentucationRepository.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 17/5/24.
//

import Foundation

final class AuthentucationRepository{
    private let auntenticationFirebaseDatasource: AuthenticationFirebaseDatasource
    
    init(autenticationFirebaseDatasource: AuthenticationFirebaseDatasource = AuthenticationFirebaseDatasource()) {
        self.auntenticationFirebaseDatasource = autenticationFirebaseDatasource
    }
    
    func getCurrentUser() -> User? {
        auntenticationFirebaseDatasource.getCurrentUser()
    }
    
    func crearNuevoUsuario(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void){
        auntenticationFirebaseDatasource.crearNuevoUsuario(email: email, password: password, completionBlock: completionBlock)
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void){
        auntenticationFirebaseDatasource.login(email: email, password: password, completionBlock: completionBlock)
    }
    
    func logout() throws {
        try auntenticationFirebaseDatasource.logout()
    }
}
