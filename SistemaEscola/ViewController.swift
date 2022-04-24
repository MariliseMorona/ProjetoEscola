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
        removeColaborador(comMatricula: matriculaColaborador)
       resetaRemoveColaborador()
    }
    
    @IBAction func listarGastosMensaisComTodosColaboradores(_ sender: UIButton) {
        let messageGastosTotais = String(listaGastoMensais())
        outputMessage.text = messageGastosTotais
    }
    
    @IBAction func listarGastosMensaisPorCargo(_ sender: UIButton) {
        outputMessage.text = listaGasto(doCargo: cargoSelecionado)
      
    }
    
    @IBAction func listarQuantasPessoasExistemPorCargo(_ sender: UIButton) {
        // TODO: Inserir Feature 5 Aqui!
        outputMessage.text = listaQuantidadeDeColaboradores(doCargo: cargoSelecionado)
        
    }
    
    @IBAction func listarNomesColaboradoresOrdemAlfabetica(_ sender: UIButton) {
        outputMessage.text = listaColaboradoresEmOrdemAlfabetica()
        
    }
    
    func adicionaColaborador(_ colaborador: Colaborador){
        colaboradores.append(colaborador)
        outputMessage.text = colaborador.seApresentar()
        
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
    
    func listaQuantidadeDeColaboradores(doCargo cargo: Cargo) -> String {
        var quantidadeDeColaboradores = 0
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
}

