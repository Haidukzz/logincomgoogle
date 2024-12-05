# loginn3

Este é um projeto Flutter desenvolvido como parte de uma atividade acadêmica para implementar autenticação de login com o Google.

## Integrantes do Grupo

- **Bredley Bauer**
- **Gabriel Coelho**
- **Gustavo Haiduk Pereira**

---

## Funcionalidades por Tela

### Tela de Login
- Autenticação com o Google.
- Exibição de erros em caso de falha na autenticação.

### Tela Inicial (Home)
- Exibição do nome, e-mail e foto do usuário autenticado.
- Mensagem personalizada de boas festas.
- Opção de logout, redirecionando o usuário para a tela de login.

---

## Tipos de Erros do Provedor Escolhido (Google Sign-In)

1. **Erro de Autenticação**
   - `PlatformException`: Ocorre caso o usuário cancele o login ou se as credenciais forem inválidas.

2. **Erro de Configuração**
   - `ClientException`: Aparece quando as APIs necessárias não estão configuradas corretamente no Google Cloud Console.

3. **Erro de Permissão**
   - `[cloud_firestore/permission-denied]`: Erro ao salvar dados no Firestore devido à falta de permissões.

---

## Dependências Utilizadas

- **firebase_auth**: ^5.3.3
- **google_sign_in**: ^6.2.0
- **cloud_firestore**: ^5.5.0
- **flutter**: Framework usado para desenvolvimento do app.

---

## Instruções de Configuração e Importação

### Pré-requisitos

1. **Flutter SDK**: Versão mínima recomendada: `3.10.5`.
2. **Dart SDK**: Versão mínima recomendada: `3.0.5`.

### Configuração do Projeto

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/Haidukzz/logincomgoogle.git
   cd logincomgoogle
