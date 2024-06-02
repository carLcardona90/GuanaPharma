//
//  MedicamentosDataSource.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 28/5/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct MedicamentosModel: Decodable, Identifiable, Encodable {
    @DocumentID var id: String?
    let Administracion: String
    let Concentracion: String
    let DosisMaxima: String
    let Forma: String
    let Nombre: String
    let Tipo: String
    let Comentario: String
    let Favorito: Bool
}

final class MedicamentosDataSource {
    private let database = Firestore.firestore()
    private let collection = "medicamentos"
    
    func getAllMedicamentos(completionBlock: @escaping (Result<[MedicamentosModel], Error>) -> Void){
        database.collection(collection).addSnapshotListener{ query, error in
            if let error = error {
                print("Error obteniendo todos los medicamentos \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            guard let documents = query?.documents.compactMap({$0}) else {
                completionBlock(.success([]))
                return
            }
            let medicamentos = documents.map { try? $0.data(as: MedicamentosModel.self) }
                .compactMap{$0}
            completionBlock(.success(medicamentos))
        }
    }
    
    func actualizarFavorito(medicamento: MedicamentosModel) {
        guard let documentId = medicamento.id else {
            return
        }
        do {
            _ = try database.collection(collection).document(documentId)
                .setData(from: medicamento)
        } catch {
            print("Error actualizando")
        }
    }
}
