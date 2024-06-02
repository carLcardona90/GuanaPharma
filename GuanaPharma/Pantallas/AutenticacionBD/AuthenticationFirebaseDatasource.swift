//
//  AuthenticationFirebaseDatasource.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 17/5/24.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
}

final class AuthenticationFirebaseDatasource {
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return .init(email: email)
    }
    
    func crearNuevoUsuario(email: String, password: String, completionBlock: @escaping(Result<User, Error>) -> Void){
        Auth.auth().createUser(withEmail: email, password: password){
            authDataResult, error in
            if let error = error {
                print("Error creando nuevo usuario \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "No email"
            print("Nuevo usuario creado con \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func login(email: String, password: String, completionBlock: @escaping(Result<User, Error>) -> Void){
        Auth.auth().signIn(withEmail: email, password: password){
            authDataResult, error in
            if let error = error {
                print("Error loggeando usuario \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "No email"
            print("Usuario logueado con \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
}
