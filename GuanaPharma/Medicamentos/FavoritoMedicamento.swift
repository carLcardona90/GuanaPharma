import SwiftUI

struct FavoritoMedicamento: View {
    @ObservedObject var medicamentosViewModel: MedicamentosViewModel
    
    var body: some View {
        VStack {
            if medicamentosViewModel.medicamentos.filter({ $0.Favorito }).isEmpty {
                Text("❤️ Agrega tus medicamentos favoritos")
                    .font(.headline)
            } else {
                List {
                    ForEach(medicamentosViewModel.medicamentos.filter { $0.Favorito }) { medicamento in
                        VStack(alignment: .leading) {
                            Text(medicamento.Nombre)
                                .bold()
                                .lineLimit(4)
                                .padding(.bottom, 8)
                            Text(medicamento.Forma)
                                .foregroundColor(.gray)
                                .font(.caption)
                            HStack {
                                Spacer()
                                if medicamento.Favorito {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .foregroundColor(.yellow)
                                        .frame(width: 10, height: 10)
                                }
                            }
                        }
                        .swipeActions(edge: .trailing) {
                            Button(action: {
                                medicamentosViewModel.actualizarFavorito(medicamento: medicamento)
                            }, label: {
                                Label("Favorito", systemImage: "star.fill")
                            })
                            .tint(.yellow)
                        }
                    }
                }
            }
        }
        .onAppear {
            medicamentosViewModel.getAllMedicamentos()
        }
    }
}

#Preview {
    FavoritoMedicamento(medicamentosViewModel: MedicamentosViewModel())
}
