//
//  ViewController.swift
//  SistemaEscola
//
//  Created by Renan Trévia on 2/11/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewModelProtocol {
    
    lazy var vm: ViewModel = ViewModel(viewModelProtocol: self)
    
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
        vm.cargoSelecionado = .monitor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaProfessor(_ sender: UIButton) {
        vm.cargoSelecionado = .professor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaCoordenador(_ sender: UIButton) {
        vm.cargoSelecionado = .coordenador
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaDiretor(_ sender: UIButton) {
        vm.cargoSelecionado = .diretor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaAssistente(_ sender: UIButton) {
        vm.cargoSelecionado = .assistente
        selecionaBotao(botao: sender)
    }
    
    @IBAction func cadastrarColaborador(_ sender: UIButton){
        vm.nomeColaborador = nomeTextField.text ?? ""
        
        let numeroMatricula = matriculaTextField.text ?? ""
        vm.matriculaColaborador = (numeroMatricula as NSString).integerValue

        let numeroSalario = salarioTextField.text ?? ""
        vm.salarioColaborador = Double(numeroSalario) ?? 0
        
        let novoColaborador = Colaborador(nome: vm.nomeColaborador, matricula: vm.matriculaColaborador, salario: vm.salarioColaborador, cargo: vm.cargoSelecionado)
        
        vm.condicaoContratacao(novoColaborador)
        resetaCadastraColaborador()
    }
    
    @IBAction func removerColaborador(_ sender: UIButton) {
        vm.removeColaborador(comMatricula: vm.matriculaColaborador)
       resetaRemoveColaborador()
    }
    
    @IBAction func listarGastosMensaisComTodosColaboradores(_ sender: UIButton) {
        let messageGastosTotais = String(vm.listaGastoMensais())
        outputMessage.text = messageGastosTotais
    }
    
    @IBAction func listarGastosMensaisPorCargo(_ sender: UIButton) {
        outputMessage.text = vm.listaGasto(doCargo: vm.cargoSelecionado)
      
    }
    
    @IBAction func listarQuantasPessoasExistemPorCargo(_ sender: UIButton) {
        // TODO: Inserir Feature 5 Aqui!
        outputMessage.text = vm.listaColaboradoresPorCargo(doCargo: vm.cargoSelecionado)
        
    }
    
    @IBAction func listarNomesColaboradoresOrdemAlfabetica(_ sender: UIButton) {
        outputMessage.text = vm.listaColaboradoresEmOrdemAlfabetica()
        
    }
    
    func changeOutputMessage(message: String) -> String{
        let printMessage = message
        outputMessage.text = printMessage
        
        return outputMessage.text ?? ""
    }
}

