//
//  ViewModel.swift
//  SistemaEscola
//
//  Created by Marilise Morona on 24/04/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

import UIKit

class ViewModel{

    weak var viewModelProtocol: ViewModelProtocol?
    var colaboradores: [Colaborador] = []
    var nomeColaborador: String = ""
    var matriculaColaborador : Int = 0
    var salarioColaborador: Double = 0.0
    var cargoSelecionado: Cargo = .monitor
    var quantidadeDeColaboradores : Int = 0
    
    init(viewModelProtocol: ViewModelProtocol){
        self.viewModelProtocol = viewModelProtocol
    }
    
    func adicionaColaborador(_ colaborador: Colaborador){
        colaboradores.append(colaborador)
        viewModelProtocol?.changeOutputMessage(message: colaborador.seApresentar())
        
    }
    
    func listaGastoMensais() -> Double {
        var gastoTotal: Double = 0
        for colaborador in colaboradores {
            gastoTotal += colaborador.salario
        }
        return gastoTotal
        
    }
    
    func listaGasto(doCargo cargo: Cargo) -> String {
        var gastoTotal: Double = 0
        
        for colaborador in colaboradores where colaborador.cargo == cargo {
             gastoTotal += colaborador.salario
        }
        let messageGastosTotaisPorCargo = "Os gastos com o cargo \(cargo.nomeFormal()) são de R$\(gastoTotal)."
        return messageGastosTotaisPorCargo
    }
    
    func listaColaboradoresPorCargo(doCargo cargo: Cargo) -> String {
        
        quantidadeDeColaboradores = colaboradores.filter{ $0.cargo == cargo }.count
    
        return "Existe(m) \(quantidadeDeColaboradores) colaborador(s) do cargo \(cargo.nomeFormal())."
    }
    
    func listaColaboradoresEmOrdemAlfabetica() -> String {
        var nomes: [String] = []
        nomes = colaboradores.map{ $0.nome }.sorted()
        
        let arrayNomes = nomes.sorted(by: { $0.lowercased() < $1.lowercased() })
        let stringArray = arrayNomes
        let string = stringArray.joined(separator: ", ")
        
        return string
    }
    
    func removeColaborador(comMatricula matricula: Int) {
        colaboradores.removeAll{ $0.matricula == matricula }
    }
    
    func listaQuantidadeDeColaboradores(doCargo cargo: Cargo) -> Int {
        
        quantidadeDeColaboradores = colaboradores.filter{ $0.cargo == cargo }.count
    
        return quantidadeDeColaboradores
    }
    
    func condicaoContratacao(_ colaborador: Colaborador){
        let numeroCoordenadores = listaQuantidadeDeColaboradores(doCargo: .coordenador)
        let numeroProfessores = listaQuantidadeDeColaboradores(doCargo: .professor)
        let numeroDiretores = listaQuantidadeDeColaboradores(doCargo: .diretor)
        let maximoDiretores = 1
                 
        if colaborador.cargo == .coordenador, numeroCoordenadores >= numeroProfessores{
            viewModelProtocol?.changeOutputMessage(message: "Você não pode mais contratar coordenadores.")
        } else if colaborador.cargo == .diretor, numeroDiretores >= maximoDiretores {
            viewModelProtocol?.changeOutputMessage(message: "Você não pode mais contratar diretores.")
        } else {
            adicionaColaborador(colaborador)
        }
    }
    
}
