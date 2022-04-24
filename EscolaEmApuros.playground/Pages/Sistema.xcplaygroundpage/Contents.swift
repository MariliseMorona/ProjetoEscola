/*:
 ## Sistema.
 
 Agora que você passou por todas as etapas do treinamento, é hora de juntar todas as peças do quebra-cabeça! 🧩
 
 Você já sabe sobre:
 
 - Array (Vetores)
 - Enum
 - Switch
 - Struct/Class
 
 Com esses conhecimentos, você tem o suficiente para montar um sistema para uma escola.
 
 Antes de começarmos, é importante você saber algumas exigências das escolas.
 
 Elas devem ser capazes de:
 
 1. Cadastrar novos colaboradores.
 2. Remover colabores através de sua matrícula.
 -
 3. Listar gastos mensais com todos os colaboradores.
 4. Listar gastos mensais por cargo (quanto é gasto com monitor, quanto é gasto com professor, etc.)
 5. Listar quantas pessoas existem por cargo (quantos monitores, quantos professores, etc.)
 6. Listar os nomes de todos os colaboradores em ordem alfabética.
 
 **[DESAFIO]** Como você faria esse sistema?
 
 Abaixo, segue um exemplo de como seria um sistema similar ao do colégio 🐶.
 */

enum Raca {
    case poodle
    case husky
    case golden
    case labrador
    case caramelo
    
    // Sim! Em Swift, Enum pode conter funções! ❤️
    func nomeFormal() -> String {
        switch self {
        case .poodle:
            return "Poodle"
        case .husky:
            return "Husky Siberiano"
        case .golden:
            return "Golden Retriever"
        case .labrador:
            return "Labrador"
        case .caramelo:
            return "Caramelo"
        }
    }
    
    func possuiMuitoPelo() -> Bool {
        switch self {
        case .poodle, .husky, .golden:
            return true
        case .labrador, .caramelo:
            return false
        }
    }
}

struct Cachorro {
    let identificador: Int
    let nome: String
    let raca: Raca
    let gastoMensal: Double
    
    func descricao() -> String {
        return "Identificador: \(identificador): \(nome) é um cachorro da raça \(raca.nomeFormal()) que possui um gasto mensal de R$\(gastoMensal)."
    }
}

// A class Abrigo é o nosso sistema!
class Abrigo {
    var cachorros: [Cachorro]
    
    init(cachorros: [Cachorro]) {
        self.cachorros = cachorros
    }
    
    // Funcionalidade 1 do sistema da escola
    // Cadastrar novos colaboradores
    func adicionaCachorro(_ cachorro: Cachorro) {
        cachorros.append(cachorro)
    }
    
    // Funcionalidade 2 do sistema da escola
    // Remover colabores através de sua matrícula
    func removeCachorro(comIdentificador identificador: Int) {
        // Solução 1
        // Dificuldade: 🔥
        // Podemos melhorar essa solução...
        for indice in 0..<cachorros.count {
            let cachorro = cachorros[indice]
            if cachorro.identificador == identificador {
                cachorros.remove(at: indice)
            }
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // Já está bom o suficiente
        for (indice, cachorro) in cachorros.enumerated() {
            if cachorro.identificador == identificador {
                cachorros.remove(at: indice)
            }
        }
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥
        // Solução um pouco mais "avançada"
        cachorros.removeAll { (cachorro) -> Bool in
            cachorro.identificador == identificador
        }
        
        // Solução 4
        // Dificuldade: 🔥🔥🔥🔥
        // Agora você decolou!!! 🚀
        cachorros.removeAll{ $0.identificador == identificador }
    }
    
    // Funcionalidade 3 do sistema da escola
    // Listar gastos mensais com todos os colaboradores
    func listaGastoMensais() -> Double {
        var gastoTotal: Double = 0
        
        for cachorro in cachorros {
            // Solução 1
            // Dificuldade: 🔥
            let gastoMensal = cachorro.gastoMensal
            gastoTotal = gastoTotal + gastoMensal
            
            // Solução 2
            // Dificuldade: 🔥🔥
            // let gastoMensal = cachorro.gastoMensal
            // gastoTotal += gastoMensal
            
            // Solução 3
            // Dificuldade: 🔥🔥🔥
            // gastoTotal += cachorro.gastoMensal
        }
        
        return gastoTotal
    }
    
    // Funcionalidade 4 do sistema da escola
    // Listar gastos mensais por cargo
    func listaGasto(daRaca raca: Raca) -> String {
        var gastoTotal: Double = 0
        
        // Solução 1
        // Dificuldade: 🔥
        for cachorro in cachorros {
            if cachorro.raca == raca {
                gastoTotal += cachorro.gastoMensal
            }
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // for cachorro in cachorros where cachorro.raca == raca {
        //     gastoTotal += cachorro.gastoMensal
        // }
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥🔥🔥🔥🔥🔥🔥
        // gastoTotal = cachorros.map{ $0.gastoMensal }.reduce(0, +)
        
        return "Os gastos com a raça \(raca.nomeFormal()) são de R$\(gastoTotal)."
    }
    
    // Funcionalidade 5 do sistema da escola
    // Listar quantas pessoas existem por cargo
    func listaQuantidadeDeCachorro(daRaca raca: Raca) -> String {
        var quantidadeDeCachorro = 0
        
        // Solução 1
        // Dificuldade: 🔥
        for cachorro in cachorros {
            if cachorro.raca == raca {
                quantidadeDeCachorro += 1
            }
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // for cachorro in cachorros where cachorro.raca == raca {
        //     quantidadeDeCachorro += 1
        // }
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥🔥🔥🔥
        // quantidadeDeCachorro = cachorros.filter{ $0.raca == raca }.count
        
        return "Existe(m) \(quantidadeDeCachorro) cachorro(s) da raça \(raca.nomeFormal())."
    }
    
    // Funcionalidade 6 do sistema da escola
    // Listar os nomes de todos os colaboradores em ordem alfabética
    func listaCachorrosEmOrdemAlfabetica() -> [String] {
        // Primeiro, precisamos pegar todos os nomes de todos os cachorros
        var nomes: [String] = []
        
        // Solução 1
        // Dificuldade: 🔥
        for cachorro in cachorros {
            let cachorroNome = cachorro.nome
            nomes.append(cachorroNome)
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // nomes = cachorros.map{ $0.nome }
        
        // Agora é só ordenar a nossa lista de nomes!
        // Obrigado Swift por já ter uma função para isso 🙏
        nomes.sort()
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥
        // Essa solução já faz tudo
        // .map -> cria um Array de String
        // .sorted() -> ordena o Array
        // nomes = cachorros.map{ $0.nome }.sorted()
        
        return nomes
    }
}

let muitosCachorros: [Cachorro] =
    [
        Cachorro(identificador: 0, nome: "Rex", raca: .caramelo, gastoMensal: 100),
        Cachorro(identificador: 1, nome: "Bob", raca: .labrador, gastoMensal: 50),
        Cachorro(identificador: 2, nome: "Fred", raca: .golden, gastoMensal: 200),
        Cachorro(identificador: 3, nome: "Zeus", raca: .caramelo, gastoMensal: 500),
        Cachorro(identificador: 4, nome: "Babi", raca: .poodle, gastoMensal: 3000),
        Cachorro(identificador: 5, nome: "Xerox", raca: .labrador, gastoMensal: 1500),
        Cachorro(identificador: 6, nome: "Slinky", raca: .poodle, gastoMensal: 2500),
        Cachorro(identificador: 7, nome: "Fancy", raca: .labrador, gastoMensal: 1000),
        Cachorro(identificador: 8, nome: "Britney", raca: .caramelo, gastoMensal: 30),
        Cachorro(identificador: 9, nome: "Panqueca", raca: .golden, gastoMensal: 450),
        Cachorro(identificador: 10, nome: "Tiziu", raca: .golden, gastoMensal: 900),
        Cachorro(identificador: 11, nome: "Simba", raca: .husky, gastoMensal: 700),
        Cachorro(identificador: 12, nome: "Thor", raca: .labrador, gastoMensal: 1300),
        Cachorro(identificador: 13, nome: "Kawaii", raca: .caramelo, gastoMensal: 1200)
    ]

let abrigo = Abrigo(cachorros: muitosCachorros)

// Funcionalidade 1
print(abrigo.listaCachorrosEmOrdemAlfabetica())

let avin = Cachorro(identificador: 14, nome: "Avin", raca: .caramelo, gastoMensal: 300)
abrigo.adicionaCachorro(avin)

print(abrigo.listaCachorrosEmOrdemAlfabetica())
// Você consegue ver que "Avin" agora aparece dentro do print?
// Isso acontece pois o cachorro foi adicionado com sucesso ao abrigo!

// Funcionalidade 2

print(abrigo.listaCachorrosEmOrdemAlfabetica())

abrigo.removeCachorro(comIdentificador: 14)

print(abrigo.listaCachorrosEmOrdemAlfabetica())
// Você consegue ver que "Avin" não aparece mais no print?
// Isso acontece pois o cachorro Rex de identificador 0 foi removido com sucesso do abrigo!

// Funcionalidade 3
print(abrigo.listaGastoMensais())

// Funcionalidade 4
print(abrigo.listaGasto(daRaca: .caramelo))
print(abrigo.listaGasto(daRaca: .poodle))
print(abrigo.listaGasto(daRaca: .husky))
print(abrigo.listaGasto(daRaca: .labrador))
print(abrigo.listaGasto(daRaca: .golden))

// Funcionalidade 5
print(abrigo.listaQuantidadeDeCachorro(daRaca: .caramelo))
print(abrigo.listaQuantidadeDeCachorro(daRaca: .poodle))
print(abrigo.listaQuantidadeDeCachorro(daRaca: .husky))
print(abrigo.listaQuantidadeDeCachorro(daRaca: .labrador))
print(abrigo.listaQuantidadeDeCachorro(daRaca: .golden))

// Funcionalidade 6
print(abrigo.listaCachorrosEmOrdemAlfabetica())

// Seu sistema aqui!
// *********************************** SISTEMA ESCOLA *************************************************

enum Cargo{
    case monitor
    case professor
    case coordenador
    case diretor
    case assistente
    
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
    
    
    func abreviacaoCargo(doCargo cargo: Cargo) -> String{
        switch cargo {
        case .assistente:
            return "Asst."
        case .coordenador:
            return "Coord."
        case .diretor:
            return "Dir."
        case .monitor:
            return "Mntr."
        case .professor:
            
            return "Prof."
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
    
    let funcionario01 = Colaborador(nome: "Carlos", matricula: 24365766543, salario: 3000.00, cargo: .diretor)
    funcionario01.seApresentar()

class Escola {
    var colaboradores: [Colaborador]
    
    init(colaboradores: [Colaborador]) {
        self.colaboradores = colaboradores
    }
    
    // Funcionalidade 1 do sistema da escola
    // Cadastrar novos colaboradores
    
    
    
    
    
    
    func adicionaColaborador(_ colaborador: Colaborador) {
               colaboradores.append(colaborador)
        
    }
    
    // Funcionalidade 2 do sistema da escola
    // Remover colabores através de sua matrícula
    func removeColaborador(comMatricula matricula: Int) {
        // Solução 1
        /*
        for indice in 0..<colaboradores.count {
            let colaborador = colaboradores[indice]
            if colaborador.matricula == matricula {
                colaboradores.remove(at: indice)
            }
        }
 */
        
        // Solução 2
        /*
        for (indice, colaborador) in colaboradores.enumerated() {
            if colaborador.matricula == matricula {
                colaboradores.remove(at: indice)
            }
        }
 */
        
        // Solução 3
        /*
        colaboradores.removeAll { (colaborador) -> Bool in
                   colaborador.matricula == matricula
               }
*/
        
        // Solução 4
        colaboradores.removeAll{ $0.matricula == matricula }
        }
           
        // Funcionalidade 3 do sistema da escola
        // Listar gastos mensais com todos os colaboradores
        func listaGastoMensais() -> Double {
            var gastoTotal: Double = 0
            
            for colaborador in colaboradores {
                // Solução 1
                /*
                let salario = colaborador.salario
                gastoTotal = gastoTotal + salario
            }
            return gastoTotal
 */
                
                // Solução 2
                /*
                let salario = colaborador.salario
                gastoTotal += salario
            }
            return gastoTotal
 */
                
                // Solução 3
                gastoTotal += colaborador.salario
            }
            return gastoTotal
    }
    
    
    // Funcionalidade 4 do sistema da escola
    // Listar gastos mensais por cargo
    func listaGasto(daCargo cargo: Cargo) -> String {
        var gastoTotal: Double = 0
        
        // Solução 1
        /*
        for colaborador in colaboradores {
            if colaborador.cargo == cargo {
                gastoTotal += colaborador.salario
            }
        }
        return "Os gastos com o cargo \(cargo.nomeFormal()) são de R$\(gastoTotal)."
        */
        
        // Solução 2
        /*
        for colaborador in colaboradores where colaborador.cargo == cargo {
             gastoTotal += colaborador.salario
        }
        return "Os gastos com o cargo \(cargo.nomeFormal()) são de R$\(gastoTotal)."
        */
        
        // Solução 3
        gastoTotal = colaboradores.map{ $0.salario }.reduce(0, +)
        return "Os gastos com o cargo \(cargo.nomeFormal()) são de R$\(gastoTotal)."
    }
    
    // Funcionalidade 5 do sistema da escola
    // Listar quantas pessoas existem por cargo
    func listaQuantidadeDeColaboradores(doCargo cargo: Cargo) -> String {
        var quantidadeDeColaboradores = 0
        
        // Solução 1
        /*
        for colaborador in colaboradores {
            if colaborador.cargo == cargo {
                quantidadeDeColaboradores += 1
            }
        }
        return "Existe(m) \(quantidadeDeColaboradores) colaborador(s) do cargo \(cargo.nomeFormal())."
 */
        
        // Solução 2
   /*
        for colaborador in colaboradores where colaborador.cargo == cargo {
             quantidadeDeColaboradores += 1
         }
        return "Existe(m) \(quantidadeDeColaboradores) colaborador(s) do cargo \(cargo.nomeFormal())."
 */
        
        // Solução 3
        quantidadeDeColaboradores = colaboradores.filter{ $0.cargo == cargo }.count
    
        return "Existe(m) \(quantidadeDeColaboradores) colaborador(s) do cargo \(cargo.nomeFormal())."
    }
    
    // Funcionalidade 6 do sistema da escola
    // Listar os nomes de todos os colaboradores em ordem alfabética
    func listaColaboradoresEmOrdemAlfabetica() -> [String] {
        var nomes: [String] = []
        
        // Solução 1
        /*
        for colaborador in colaboradores {
            let colaboradorNome = colaborador.nome
            nomes.append(colaboradorNome)
        }
          nomes.sort()
        return nomes
*/
        
        // Solução 2
        /*
        nomes = colaboradores.map{ $0.nome }
        nomes.sort()
        return nomes
 */
        
        // Solução 3
        nomes = colaboradores.map{ $0.nome }.sorted()
        return nomes
    }
}

func condicaoContratacao(_ colaborador: Colaborador){
    let escola = Escola(colaboradores: muitosColaboradores)
    let numeroCoordenadores = escola.listaQuantidadeDeColaboradores(doCargo: .coordenador)
    let numeroProfessores = escola.listaQuantidadeDeColaboradores(doCargo: .professor)
    let numeroDiretores = escola.listaQuantidadeDeColaboradores(doCargo: .diretor)
    let maximoDiretores = 1
             
    if colaborador.cargo == .coordenador, numeroCoordenadores >= numeroProfessores{
        print("Você não pode mais contratar coordenadores.")
    } else if colaborador.cargo == .diretor, numeroDiretores >= maximoDiretores {
        print("Você não pode mais contratar coordenadores.")
    } else {
        escola.adicionaColaborador(colaborador)
    }
}

let muitosColaboradores: [Colaborador] =
    [
        Colaborador(nome: "Fernanda", matricula: 3245657, salario: 2000.00, cargo: .assistente),
        Colaborador(nome: "Jose", matricula: 3245658, salario: 2000.00, cargo: .coordenador),
        Colaborador(nome: "Carlos", matricula: 3245659, salario: 2000.00, cargo: .diretor),
        Colaborador(nome: "Julia", matricula: 3245660, salario: 2000.00, cargo: .monitor),
        Colaborador(nome: "Jussara", matricula: 3245661, salario: 2000.00, cargo: .professor),
        Colaborador(nome: "Caio", matricula: 3245662, salario: 2000.00, cargo: .assistente),
        Colaborador(nome: "Luiz", matricula: 3245663, salario: 2000.00, cargo: .assistente),
        Colaborador(nome: "Laura", matricula: 3245664, salario: 2000.00, cargo: .diretor),
        Colaborador(nome: "Ricardo", matricula: 3245665, salario: 2000.00, cargo: .coordenador),
        Colaborador(nome: "Rogerio", matricula: 3245666, salario: 2000.00, cargo: .monitor),
        Colaborador(nome: "Sandro", matricula: 3245667, salario: 2000.00, cargo: .professor),
        Colaborador(nome: "Fabiola", matricula: 3245668, salario: 2000.00, cargo: .professor),
        Colaborador(nome: "Zuleica", matricula: 3245669, salario: 2000.00, cargo: .professor),
        Colaborador(nome: "Camila", matricula: 3245670, salario: 2000.00, cargo: .assistente),
        Colaborador(nome: "Rodrigo", matricula: 3245671, salario: 2000.00, cargo: .assistente),
        Colaborador(nome: "Richard", matricula: 3245672, salario: 2000.00, cargo: .monitor),
        Colaborador(nome: "Roberta", matricula: 3245673, salario: 2000.00, cargo: .coordenador)
        
    ]

let escola = Escola(colaboradores: muitosColaboradores)

// Funcionalidade 1
print(escola.listaColaboradoresEmOrdemAlfabetica())

let funcionario02 = Colaborador(nome: "Alvaro", matricula: 3245674, salario: 2000.00, cargo: .coordenador)
escola.adicionaColaborador(funcionario02)
print(escola.listaColaboradoresEmOrdemAlfabetica())

// Funcionalidade 2
print(escola.listaColaboradoresEmOrdemAlfabetica())
escola.removeColaborador(comMatricula: 3245663)
print(escola.listaColaboradoresEmOrdemAlfabetica())

// Funcionalidade 3
print(escola.listaGastoMensais())

// Funcionalidade 4
print(escola.listaGasto(daCargo: .assistente))
print(escola.listaGasto(daCargo: .coordenador))
print(escola.listaGasto(daCargo: .diretor))
print(escola.listaGasto(daCargo: .monitor))
print(escola.listaGasto(daCargo: .professor))

// Funcionalidade 5
print(escola.listaQuantidadeDeColaboradores(doCargo: .assistente))
print(escola.listaQuantidadeDeColaboradores(doCargo: .coordenador))
print(escola.listaQuantidadeDeColaboradores(doCargo: .diretor))
print(escola.listaQuantidadeDeColaboradores(doCargo: .monitor))
print(escola.listaQuantidadeDeColaboradores(doCargo: .professor))

// Funcionalidade 6
print(escola.listaColaboradoresEmOrdemAlfabetica())
/*:
 [Já acabou, Jéssica?](https://www.otempo.com.br/polopoly_fs/1.1170250.1534206665!httpImage/image.png)
 
Ufa! Esse foi um desafio um tanto quanto longo, mas sobrevivemos.
 
 Porém, o sistema da escola não é tão "simples" assim.
 
 Ele possui algumas regras que precisam ser seguidas.
 
 São elas:
 
 - O SALÁRIO pode conter qualquer valor (crise pra quem?), mas o maior salário deve ser sempre o do DIRETOR.

 - A ESCOLA não pode ter mais do que um DIRETOR.

 - A ESCOLA não pode ter mais COORDENADORES do que PROFESSORES.

**[DESAFIO]** Como você faria acrescentaria essas regras ao seu sistema?
 
 Dessa vez, eu não darei dicas de solução 😉.
 
 *Give your jumps!* (Dá teus pulos)
*/

// Pode incrementar essas regras no seu sistema desenvolvido acima.

/*:
Terminado essa atividade, você está com animação para a próxima etapa?
 
 E vamos de Xcode!

[Anterior: Colaboradores](@previous) | Página 5 de 6  |  [Na sequência: Xcode](@next)
*/
