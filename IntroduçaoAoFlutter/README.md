# Tutorial de instalação e preparação do ambiente de desenvolvimento Flutter
## Flutter X Android SDK X BlueStacks 5
### Pré-requisitos:
> Git instalado e configurado
>
> VSCode
>
> JDK 17
---
# Instalando e configurando o Flutter SDK
## Instalação:
1. Acesse a página oficial do flutter ``` https://docs.flutter.dev/get-started/install/windows/mobile ``` ou o link direto de download ``` https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.3-stable.zip ```
2. Após o download, navegue até a pasta ``` C:\ ``` de seu computador, onde criaremos um novo repositório ``` src ``` para a instalação do SDK FLutter. O caminho deve ficar como ``` C:\src ```.
3. Localize onde o download do flutter foi feito e extraia a pasta compactada ``` flutter ``` para nossa pasta src. O caminho deve ficar como ``` C:\src\flutter ```.
## Configuração:
- Precisamos configurar as variáveis de ambiente para o Flutter. para isso, adicione uma nova variável de ambiente com o caminho da pasta ```bin ```, dentro da pasta flutter. O caminho deve ficar como ```C:\src\flutter\bin  ```.
## Teste:
- Para saber se o flutter está instalado e configurado completamente, inicie um novo prompt de comando e execute o comando ``` flutter --version ```. O resultado deve ser algo como o seguinte:

            Flutter 3.24.3 • channel stable • https://github.com/flutter/flutter.git
            Framework • revision 2663184aa7 (4 weeks ago) • 2024-09-11 16:27:48 -0500
            Engine • revision 36335019a8
            Tools • Dart 3.5.3 • DevTools 2.37.3

---

# Instalando e configurando o Android SDK
## Instalando o SDK Manager da Android.
- Instale o SDK Manager a partir do site oficial da Android ``` https://developer.android.com/studio ```, na sessão "Command line tools only".
- Na nossa pasta ``` C:\src ``` crie uma nova pasta chamada ``` Android ``` e dentro dela outra pasta chamada ``` sdk ```. O caminho deve ficar como ``` C:\src\Android\sdk ```
- Extraia a pasta cmdline-tools para a pasta ```sdk```. O caminho deve ficar como ``` C:\src\Android\sdk\cmdline-tools ```.
- Dentro da pasta cmdline-tools, crie uma nova pasta chamada latest e mova tudo o que há dentro da pasta cmdline-tools para lá. Essa pasta serve para controlar o versionamento do SDK Manager
## Configurando o SDK Manager
- Adicione a pasta bin das cmdline-tools às variáveis de ambiente. O caminho deve ficar como ``` C:\src\Android\sdk\cmdline-tools\latest\bin ```.
## Instalando o Android SDK
- Com o SDK Manager instalado, inicie um terminal no cmd e execute o seguinte código: ``` sdkmanager "platform-tools" "platforms;android-30" "emulator"```. Este código instalará o necesssário para utilizar a versão 30 do Android SDK.
- Aceite todos os termos para que a instalação seja realizada. Caso aconteça algum erro que te impeça de aceitar os termos ou você tenha recusado acidentalmente algum deles, execute o comando ```sdkmanager --licenses ``` para aceitá-los.
# Configurando o Android SDK
- Adicione o caminho para as pastas platform-tools e emulator às variáveis de ambiente. Os caminhos devem ficar como ``` C:\src\Android\sdk\platform-tools ``` e ``` C:\src\Android\sdk\emulator ```
# Testando o Android SDK
- Abra um novo terminal e execute o comando ``` adb version ``` para saber se o Android Debugger Bridge (Parte do Android SDK) foi instalado com sucesso.

# BlueStacks 5
## Instalando o BlueStacks 5

## Configurando o BlueStacks 5
- Nas configurações do BlueStacks 5, faça as seguintes alterações.
1. Desempenho (Recomendado): Como utilizaremos o BlueStacks 5 apenas para emular as aplicações flutter, é recomendado modificar as configurações de desempenho da seguinte forma (Após salvar as mudanças, você precisará reiniciar o aplicativo):
> Alocação de memória: 2-1GB
>
> Modo de desempenho: Equilibrado
>
> Taxa de quadros: 15
>
> Telefone: Altere o perfil do dispositivo como desejado, esse será o dispositivo emulado e que será exibido no VSCode
2. Preferências (Recomendado): Desativar todas as opções de "Plataforma"
3. Avançado (Obrigatório): Ativar a opção Android Debug Bridge (ADB), já que é essa opção que nos permite emular nossas aplicações Flutter com o BlueStacks 5.

# Iniciando uma aplicação Flutter
1. No VSCode, será necessário instalar a extensão "Flutter". Observa-se que ao instalar essa extensão, a extensão "Dart" (Linguagem utilizada pelo Flutter) também será instalada.
2. Criar um projeto Flutter: 
> Com o comando CTRL + SHIFT + P selecione criar um novo projeto Flutter (Flutter: New Project);
> 
> Selecione a opção "Application" (Cria uma aplicação com a estrutura básica de comentários e testes);
>
> Selecionea o diretório onde a aplicação será criada;
>
> Insira um nome para a aplicação;
>
> Aguarde até que sua aplicação seja criada.
3. No projeto criado você pode encontrar a pasta ``` lib ```, na qual existe uma ``` main.dart ```, que é a classe principal da sua aplicação, que por parão já contém uma aplicação de teste. Ao executar esta aplicação, um novo dispositivo estará na lista para executar. Selecione-o, este é o dispositivo emulado pelo BlueStacks 5. Na primeira execução levará mais tempo, mas sua aplicação será executada no BlueStacks.