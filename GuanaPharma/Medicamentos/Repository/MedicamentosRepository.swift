//
//  MedicamentosRepository.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 28/5/24.
//

import Foundation

final class MedicamentosRepository {
    private let medicamentosDataSource: MedicamentosDataSource
    
    init(medicamentosDataSource: MedicamentosDataSource = MedicamentosDataSource()){
        self.medicamentosDataSource = medicamentosDataSource
    }
    
    func getAllMedicamentos(completionBlock: @escaping (Result<[MedicamentosModel], Error>) -> Void){
        medicamentosDataSource.getAllMedicamentos(completionBlock: completionBlock)
    }
    
    func actualizarFavorito(medicamento: MedicamentosModel) {
        medicamentosDataSource.actualizarFavorito(medicamento: medicamento)
    }
}
