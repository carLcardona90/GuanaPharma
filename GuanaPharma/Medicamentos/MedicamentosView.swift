//
//  MedicamentosView.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 28/5/24.
//

import SwiftUI

struct MedicamentosView: View {
    @State private var buscarTexto: String = ""
    @ObservedObject var medicamentosViewModel: MedicamentosViewModel
    
    var body: some View {
        NavigationView{
            List {
                ForEach(self.medicamentosViewModel.medicamentos.filter{(
                    self.buscarTexto.isEmpty ? true : $0.Nombre.localizedCaseInsensitiveContains(self.buscarTexto))}, id: \.id) { medicamento in
                        VStack(alignment: .leading){
                            Text(medicamento.Nombre).bold().lineLimit(4).padding(.bottom,8)
                            Text(medicamento.Forma).foregroundColor(.gray).font(.caption)
                            HStack{
                                Spacer()
                                if medicamento.Favorito {
                                    Image(systemName: "star.fill").resizable().foregroundColor(.yellow).frame(width: 10,height: 10)
                                }
                            }
                        }.swipeActions(edge: .trailing){
                            Button(action: {
                                medicamentosViewModel.actualizarFavorito(medicamento: medicamento)
                            }, label: {
                                Label("Favorito", systemImage: "star.fill")
                            }).tint(.yellow)
                        }
                    }
            }.task{
                medicamentosViewModel.getAllMedicamentos()
            }.searchable(text: $buscarTexto, placement: .navigationBarDrawer(displayMode: .always), prompt: "Buscar medicamento")
        }
    }
}

#Preview {
    MedicamentosView(medicamentosViewModel: MedicamentosViewModel())
}
