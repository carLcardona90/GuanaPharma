//
//  MedicamentosView.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 28/5/24.
//

import Foundation

final class MedicamentosViewModel: ObservableObject {
    @Published var medicamentos: [MedicamentosModel] = []
    @Published var mensajeError: String?
    private let medicamentosRepository: MedicamentosRepository
    
    init(medicamentosRepository: MedicamentosRepository = MedicamentosRepository()) {
        self.medicamentosRepository = medicamentosRepository
    }
    
    func getAllMedicamentos(){
        medicamentosRepository.getAllMedicamentos{ [weak self] result in
            switch result {
            case .success(let medicamentosModels):
                self?.medicamentos = medicamentosModels
            case .failure(let error):
                self?.mensajeError = error.localizedDescription
            }
        }
    }
    
    func actualizarFavorito(medicamento: MedicamentosModel) {
        let actualizarMedicamento = MedicamentosModel(id: medicamento.id, Administracion: medicamento.Administracion, Concentracion: medicamento.Concentracion, DosisMaxima: medicamento.DosisMaxima, Forma: medicamento.Forma, Nombre: medicamento.Nombre, Tipo: medicamento.Tipo, Comentario: medicamento.Comentario, Favorito: medicamento.Favorito ? false : true)
        
        medicamentosRepository.actualizarFavorito(medicamento: actualizarMedicamento)
    }
}
