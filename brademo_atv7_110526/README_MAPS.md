# Brademo ATv7 - Google Maps com Geolocalização

Este projeto Flutter demonstra o uso da biblioteca `google_maps_flutter` integrada com `geolocator` para exibir um mapa com a geolocalização atual do dispositivo.

## 📋 Pré-requisitos

- Flutter 3.11+ instalado
- Android SDK configurado
- Dispositivo/Emulador Android com Google Play Services
- Conta Google e chave de API do Google Maps

## 🔑 Configuração da Chave de API

### Passo 1: Obter a Chave de API

1. Acesse [Google Cloud Console](https://console.cloud.google.com/)
2. Crie um novo projeto ou selecione um existente
3. Habilite a API "Maps SDK for Android"
4. Vá para "Credenciais" e crie uma chave de API do tipo "Chave de Android"
5. Copie a chave de API gerada

### Passo 2: Configurar o `.env`

1. Copie `.env.example` para `.env`:
   ```bash
   cp .env.example .env
   ```

2. Abra o arquivo `.env` e substitua `YOUR_GOOGLE_MAPS_API_KEY_HERE` pela sua chave:
   ```
   GOOGLE_MAPS_API_KEY=sua_chave_aqui
   ```

> ⚠️ **Importante**: O arquivo `.env` está no `.gitignore` e não será versionado. Nunca commit sua chave de API!

## 🚀 Como Executar

1. Instale as dependências:
   ```bash
   flutter pub get
   ```

2. Conecte um dispositivo/emulador Android e execute:
   ```bash
   flutter run
   ```

## 📍 Funcionalidades

- ✅ Solicita permissão de localização ao usuário
- ✅ Obtém a geolocalização atual do dispositivo
- ✅ Exibe um mapa do Google com a posição atual
- ✅ Marca a localização com um marcador
- ✅ Botão flutuante para centralizar no mapa

## 📦 Dependências Principais

- `google_maps_flutter`: ^2.2.0 - Integração do Google Maps
- `geolocator`: ^9.0.2 - Acesso à localização do dispositivo
- `flutter_dotenv`: ^5.1.0 - Gerenciamento de variáveis de ambiente

## 🔐 Segurança

- A chave de API é carregada a partir do arquivo `.env` que não é versionado
- As permissões de localização são solicitadas dinamicamente em runtime
- O Android solicita consentimento do usuário antes de acessar a localização

## 🛠️ Estrutura do Projeto

```
lib/
├── main.dart          # Ponto de entrada, carrega .env
├── map_page.dart      # Tela principal com o mapa
└── config/
    └── api_config.dart # Gerenciamento da chave de API
```

## 📝 Notas

- Certifique-se de que o faturamento está habilitado no Google Cloud para uso da API
- O emulador Android padrão pode não ter Google Play Services, considere usar um emulador com imagem do Google Play
- Em dispositivos reais, garanta que os serviços de localização estão habilitados

---

**Desenvolvido com ❤️ em Flutter**
