//
//  Model.swift
//  SistemaEscola
//
//  Created by Marilise Morona on 24/04/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

import Foundation


enum Cargo {
    case monitor, professor, coordenador, diretor, assistente
    
    func nomeFormal() -> String {
        switch self {
        case .assistente:
            return "Assistente"
        case .coordenador:
            return "Coordenador"
        case .diretor:
            return "Diretor"
        case .monitor:
            return "Monitor"
        case .professor:
            return "Professor"
        }
    }
}
    struct Colaborador{
        let nome: String
        let matricula: Int
        let salario: Double
        let cargo: Cargo
        
        func seApresentar()-> String{
            let apresentacao = "Meu nome é \(nome), sou \(cargo) e minha matrícula é \(matricula)"
            return apresentacao
        }
    }
