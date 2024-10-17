// 1. Variáveis e Tipos de Dados
void main() {
  // Declaração de variáveis
  String nome = 'Maria'; // Tipo String
  int idade = 30; // Tipo Integer
  double altura = 1.75; // Tipo Double
  bool estudante = true; // Tipo Boolean

  // Exibindo as variáveis
  print('=========== Variáveis ===========');
  print('Nome: $nome');
  print('Idade: $idade');
  print('Altura: $altura');
  print('Estudante: $estudante');

  // 2. Controle de Fluxo
  // If-Else
  print('=========== Controle de Fluxo ===========');
  if (estudante) {
    print('$nome é estudante.');
    // ignore: dead_code
  } else {
    print('$nome não é estudante.');
  }

  // Loops
  // Loop For
  print('=========== Loop For ===========');
  for (int i = 1; i <= 5; i++) {
    print('Contagem: $i');
  }

  // Loop While
  print('=========== Loop While ===========');
  int contador = 0;
  while (contador < 5) {
    print('Contador: $contador');
    contador++;
  }

  // 3. Funções e Métodos
  // Função simples
  print('=========== Função de soma ===========');
  int somar(int a, int b) {
    return a + b;
  }

  // Chamando a função
  int resultado = somar(5, 3);
  print('Resultado da soma 5+3: $resultado');

  // 4. Classes e Objetos
  // Método em uma classe (Classe Pessoa definida abaixo)
  print('=========== Utilizando o método "apresentar" da classe Pessoa ===========');
  var pessoa = Pessoa('João', 25);
  print(pessoa.apresentar()); // Chama o método apresentar()
}

// Definindo uma classe
class Pessoa {
  String nome;
  int idade;

  // Construtor
  Pessoa(this.nome, this.idade);

  // Método para apresentar
  String apresentar() {
    return 'Olá, meu nome é $nome e tenho $idade anos.';
  }
}
