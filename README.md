# Teste de API e E2E

Este projeto realiza **testes de API e E2E** utilizando **Playwright**, **Cypress** e **Robot Framework**.

O fluxo é:

1. Teste de API (via Robot Framework / RequestsLibrary)
2. Teste E2E no front-end (via Playwright, Cypress e Robot Framework SeleniumLibrary)

---

## 🚀 Como usar

O projeto possui um **menu interativo** via `Makefile` para facilitar a execução dos testes.

### Executando o menu

No terminal, execute:

```bash
make loop
```

Você verá:

```
=====================================
   🚀 MENU DE EXECUÇÃO DE TESTES
=====================================
1 - Instalar Cypress
2 - Instalar Playwright
3 - Instalar Robot Framework
4 - Rodar testes Cypress
5 - Rodar testes Playwright
6 - Rodar testes Robot
7 - Rodar TODOS os testes
0 - Sair
```

Basta escolher a opção desejada e seguir as instruções.

---

### 💻 Pré-requisitos

* [Node.js](https://nodejs.org/) (para Cypress e Playwright)
* Python 3.10+ (para Robot Framework)
* Chrome ou outro navegador compatível (para testes E2E)
* `pip` atualizado

---

### 📦 Instalando dependências

#### Cypress

```bash
make install-cypress
# ou manual: cd cypress && npm install
```

#### Playwright

```bash
make install-playwright
# ou manual: cd playwright && npm install && npx playwright install
```

#### Robot Framework

```bash
make install-robot
# ou manual: pip install -r robot/requirements.txt
```

> Obs: `requirements.txt` deve conter:
>
> ```
> robotframework
> robotframework-seleniumlibrary
> robotframework-requests
> robotframework-jsonlibrary
> selenium
> ```

---

### 🧪 Executando testes individualmente

* **Cypress**: `make run-cypress` ou via menu
* **Playwright**: `make run-playwright` ou via menu
* **Robot Framework**: `make run-robot` ou via menu

Para rodar **todos os testes juntos**: `make run-all` ou escolha a opção `7` no menu.

---

### 📂 Estrutura do projeto

```
.
├── cypress
├── playwright
├── robot
├── images
├── README.md
└── credentials.json
```

* `cypress/` → testes e2e com Cypress
* `playwright/` → testes e2e com Playwright
* `robot/` → testes API e E2E com Robot Framework
* `credentials.json` → credenciais para testes

---

### 🤝 Contribuindo

1. Faça um fork deste repositório
2. Crie uma branch para sua feature/fix:

```bash
git checkout -b minha-feature
```

3. Faça as alterações e commits descritivos
4. Envie para seu fork e abra um Pull Request

---

### 📝 Créditos

Criado por: **Ricardo Fahham**

---