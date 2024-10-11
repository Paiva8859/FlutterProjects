# Tutorial de instalação e preparação do ambiente de desenvolvimento Flutter
## Flutter X Android SDK X BlueStacks
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
## A instalação será feita utilizando o SDK Manager da Android.
- Instale o SDK Manager a partir do site oficial da Android ``` https://developer.android.com/studio ```, na sessão "Command line tools only".