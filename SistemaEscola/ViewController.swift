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
}

class ViewController: UIViewController {
    
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
    
    var cargoSelecionado: Cargo = .monitor
    
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
    
    @IBAction func cadastrarColaborador(_ sender: UIButton) {
        // TODO: Inserir Feature 1 Aqui!
        // Coloque uma lista ordenada de colaboradores (apenas com os nomes) na propriedade 'outputMessage'! (Assim, a gente consegue ver que de fato o colaborador foi cadastrado)
        // Basta fazer:
        // outputMessage.text = "A sua mensagem aqui"
        
        // Importante deixar essa função como última porque ela reseta o sistema por estado inicial.
        resetaCadastraColaborador()
    }
    
    @IBAction func removerColaborador(_ sender: UIButton) {
        // TODO: Inserir Feature 2 Aqui!
        // Coloque uma lista ordenada de colaboradores (apenas com os nomes) na propriedade 'outputMessage'! (Assim, a gente consegue ver que de fato o colaborador foi removido)
        // Basta fazer:
        // outputMessage.text = "A sua mensagem aqui"
        
        // Importante deixar essa função como última porque ela reseta o sistema por estado inicial.
        resetaRemoveColaborador()
    }
    
    @IBAction func listarGastosMensaisComTodosColaboradores(_ sender: UIButton) {
        // TODO: Inserir Feature 3 Aqui!
        // Coloque a mensagem na propriedade 'outputMessage'!
        // Basta fazer:
        // outputMessage.text = "A sua mensagem aqui"
    }
    
    @IBAction func listarGastosMensaisPorCargo(_ sender: UIButton) {
        // TODO: Inserir Feature 4 Aqui!
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
        // Coloque a mensagem na propriedade 'outputMessage'!
        // Basta fazer:
        // outputMessage.text = "A sua mensagem aqui"
        
        // No exemplo do .playgrounds, a gente tem uma função que retorna um Array de String ([String]).
        // Basta fazer como no exemplo abaixo:
        // let nomes = <sua função que retorna todos os nomes ordenados em um Array de [String]>
        // let nomesJuntos = nomes.joined(separator: ", ")
        // outputMessage.text = newSentence
        // Dei colherinha de chá aqui hein 🥄☕️.
    }
    
}

