# Fundamentos básicos:
## Considere o seguinte código como exemplo:
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
            
## Executar o código:
1. Copie o código para um arquivo dart (Como ```Main.dart```).
2. Execute o comando ```dart run Main.dart```. (Substitua ```Main.dart``` pelo nome do arquivo, se necessário)

## Explicações detalhadas sobre cada conceito utilizado:
`main()`
> **Descrição**: Função principal que inicia a aplicação Dart.
>
> **Responsabilidade**: Chama a função `main()`, onde todas as operações e lógicas do programa são executadas.

`String nome`
> **Descrição**: Variável que armazena o nome da pessoa.
>
> **Responsabilidade**: Armazena um valor do tipo String que pode ser exibido no console.
>
> **Tipo de dado**: `String` representa uma sequência de caracteres, como texto, e é utilizado para armazenar palavras ou frases.

`int idade`
> **Descrição**: Variável que armazena a idade da pessoa.
>
> **Responsabilidade**: Armazena um valor do tipo inteiro que representa a idade.
>
> **Tipo de dado**: `int` representa números inteiros, que não possuem parte decimal.

`double altura`
> **Descrição**: Variável que armazena a altura da pessoa.
>
> **Responsabilidade**: Armazena um valor do tipo double que representa a altura em metros.
>
> **Tipo de dado**: `double` representa números com ponto flutuante (decimais), sendo útil para valores que requerem precisão, como medidas.

`bool estudante`
> **Descrição**: Variável que indica se a pessoa é estudante.
>
> **Responsabilidade**: Armazena um valor booleano (`true` ou `false`) que representa o status de estudante.
>
> **Tipo de dado**: `bool` é um tipo de dado que pode ter apenas dois valores: `true` (verdadeiro) ou `false` (falso), usado para controle lógico.

`print()`
> **Descrição**: Função utilizada para exibir informações no console.
>
> **Responsabilidade**: Exibe o valor das variáveis e outros textos no console.

`if-else`
> **Descrição**: Estrutura de controle que executa um bloco de código com base em uma condição.
>
> **Responsabilidade**: Verifica se a variável `estudante` é verdadeira ou falsa e imprime a mensagem correspondente.

`for loop`
> **Descrição**: Estrutura de repetição que executa um bloco de código um número específico de vezes.
>
> **Responsabilidade**: Itera de 1 a 5 e imprime a contagem no console.

`while loop`
> **Descrição**: Estrutura de repetição que executa um bloco de código enquanto a condição for verdadeira.
>
> **Responsabilidade**: Incrementa o contador e imprime seu valor até que ele alcance 5.

`somar(int a, int b)`
> **Descrição**: Função que recebe dois números inteiros e retorna a soma deles.
>
> **Responsabilidade**: Realiza a operação de adição e retorna o resultado.

`resultado`
> **Descrição**: Variável que armazena o resultado da soma.
>
> **Responsabilidade**: Guarda o valor retornado pela função `somar()`.

`Pessoa`
> **Descrição**: Classe que representa uma pessoa com nome e idade.
>
> **Responsabilidade**: Define propriedades e métodos para instâncias de pessoas, como o método `apresentar()`.

`apresentar()`
> **Descrição**: Método da classe `Pessoa` que retorna uma string com a apresentação da pessoa.
>
> **Responsabilidade**: Utiliza as propriedades `nome` e `idade` para criar uma mensagem que é retornada quando chamada.
