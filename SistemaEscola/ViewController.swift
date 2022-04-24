//
//  ViewController.swift
//  SistemaEscola
//
//  Created by Renan Trévia on 2/11/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

import UIKit

// Sugiro que utilizem esse Enum pois eu já deixei preparado para os botões, mas sintam-se à vontade para alterar para uma estrutura melhor caso sintam essa necessidade.
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

class ViewController: UIViewController {
    
    var colaboradores: [Colaborador] = []
    var nomeColaborador: String = ""
    var matriculaColaborador : Int = 0
    var salarioColaborador: Double = 0.0
    var cargoSelecionado: Cargo = .monitor
    
//    init(colaboradores: [Colaborador]) {
//        self.colaboradores = colaboradores
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    @IBOutlet weak var outputMessage: UILabel!
    
    @IBOutlet weak var matriculaTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var salarioTextField: UITextField!
    
    @IBOutlet weak var monitorButton: UIButton!
    @IBOutlet weak var professorButton: UIButton!
    @IBOutlet weak var coordenadorButton: UIButton!
    @IBOutlet weak var diretorButton: UIButton!
    @IBOutlet weak var assistenteButton: UIButton!
    
    @IBOutlet weak var removeMatriculaTextField: UITextField!
    
    @IBAction func selecionaMonitor(_ sender: UIButton) {
        cargoSelecionado = .monitor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaProfessor(_ sender: UIButton) {
        cargoSelecionado = .professor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaCoordenador(_ sender: UIButton) {
        cargoSelecionado = .coordenador
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaDiretor(_ sender: UIButton) {
        cargoSelecionado = .diretor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaAssistente(_ sender: UIButton) {
        cargoSelecionado = .assistente
        selecionaBotao(botao: sender)
    }
    
    @IBAction func cadastrarColaborador(_ sender: UIButton){
        // TODO: Inserir Feature 1 Aqui!
        
        nomeColaborador = nomeTextField.text ?? ""
        
        let numeroMatricula = matriculaTextField.text ?? ""
        matriculaColaborador = (numeroMatricula as NSString).integerValue

        let numeroSalario = salarioTextField.text ?? ""
        salarioColaborador = Double(numeroSalario) ?? 0
        
        let novoColaborador = Colaborador(nome: nomeColaborador, matricula: matriculaColaborador, salario: salarioColaborador, cargo: cargoSelecionado)
        
        adicionaColaborador(novoColaborador)
        resetaCadastraColaborador()
    }
    
    @IBAction func removerColaborador(_ sender: UIButton) {
        // TODO: Inserir Feature 2 Aqui!
        func removeColaborador(comMatricula matricula: Int) {
            colaboradores.removeAll{ $0.matricula == matricula }
        }
        // Coloque uma lista ordenada de colaboradores (apenas com os nomes) na propriedade 'outputMessage'! (Assim, a gente consegue ver que de fato o colaborador foi removido)
        // Basta fazer:
        // outputMessage.text = "A sua mensagem aqui"
        
        // Importante deixar essa função como última porque ela reseta o sistema por estado inicial.
        resetaRemoveColaborador()
    }
    
    @IBAction func listarGastosMensaisComTodosColaboradores(_ sender: UIButton) {
        // TODO: Inserir Feature 3 Aqui!
        func listaGastoMensais() -> Double {
            var gastoTotal: Double = 0
            for colaborador in colaboradores {
                gastoTotal += colaborador.salario
            }
            return gastoTotal
            
        }
        // Coloque a mensagem na propriedade 'outputMessage'!
        // Basta fazer:
        // outputMessage.text = "A sua mensagem aqui"
    }
    
    @IBAction func listarGastosMensaisPorCargo(_ sender: UIButton) {
        // TODO: Inserir Feature 4 Aqui!
        
        func listaGasto(daCargo cargo: Cargo) -> String {
            var gastoTotal: Double = 0
            gastoTotal = colaboradores.map{ $0.salario }.reduce(0, +)
            return "Os gastos com o cargo \(cargo.nomeFormal()) são de R$\(gastoTotal)."
        }
        // Você pode utilizar a propriedade 'cargoSelecionado' para escolher listar um cargo só.
        // Coloque a mensagem na propriedade 'outputMessage'!
        // Basta fazer:
        // outputMessage.text = "A sua mensagem aqui"
        
        // Você pode também listar todos os cargos (ao invés de somente um), se assim preferir.
        // Basta fazer:
        // let gastoCargoMonitor = <sua função que calcula esse gasto>
        // let gastoCargoProfessor = <sua função que calcula esse gasto>
        // let gastoCargoCoordenador = <sua função que calcula esse gasto>
        // let todosOsGastos = "Monitor: \(gastoCargoMonitor) \nProfessor: \(gastoCargoProfessor)\n Coordenador: \(gastoCargoCoordenador)".
        // \n = Quebra de linha
        // Não precisa seguir exatamente esse modelo. Foi só um exemplo.
    }
    
    @IBAction func listarQuantasPessoasExistemPorCargo(_ sender: UIButton) {
        // TODO: Inserir Feature 5 Aqui!
        func listaQuantidadeDeColaboradores(doCargo cargo: Cargo) -> String {
            var quantidadeDeColaboradores = 0
            quantidadeDeColaboradores = colaboradores.filter{ $0.cargo == cargo }.count
        
            return "Existe(m) \(quantidadeDeColaboradores) colaborador(s) do cargo \(cargo.nomeFormal())."
        }
        // Você pode utilizar a propriedade 'cargoSelecionado' para escolher listar a quantidade de pessoas em um cargo só.
        // Coloque a mensagem na propriedade 'outputMessage'!
        // Basta fazer:
        // outputMessage.text = "A sua mensagem aqui"
        
        // Você pode também listar a quantidade de pessoas nos cargos (ao invés de somente um), se assim preferir.
        // Basta fazer:
        // let pessoasCargoMonitor = <sua função que conta quantas pessoas nesse cargo>
        // let pessoasCargoProfessor = <sua função que conta quantas pessoas nesse cargo>
        // let pessoasCargoCoordenador = <sua função que conta quantas pessoas nesse cargo>
        // let todosAsPessoas = "Monitor: \(gastoCargoMonitor) \nProfessor: \(gastoCargoProfessor)\n Coordenador: \(gastoCargoCoordenador)".
        // \n = Quebra de linha
        // Não precisa seguir exatamente esse modelo. Foi só um exemplo.
    }
    
    @IBAction func listarNomesColaboradoresOrdemAlfabetica(_ sender: UIButton) {
        // TODO: Inserir Feature 6 Aqui!
        func listaColaboradoresEmOrdemAlfabetica() -> [String] {
            var nomes: [String] = []
            nomes = colaboradores.map{ $0.nome }.sorted()
            return nomes
        }
    }
        // Coloque a mensagem na propriedade 'outputMessage'!
        // Basta fazer:
        // outputMessage.text = "A sua mensagem aqui"
        
        // No exemplo do .playgrounds, a gente tem uma função que retorna um Array de String ([String]).
        // Basta fazer como no exemplo abaixo:
        // let nomes = <sua função que retorna todos os nomes ordenados em um Array de [String]>
        // let nomesJuntos = nomes.joined(separator: ", ")
        // outputMessage.text = newSentence
        // Dei colherinha de chá aqui hein 🥄☕️.
    func adicionaColaborador(_ colaborador: Colaborador){
        
        colaboradores.append(colaborador)
        
        outputMessage.text = colaborador.seApresentar()
        
    }
    
}

