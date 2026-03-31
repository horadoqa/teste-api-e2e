# Teste de API e E2E

Este projeto realiza **testes de API e E2E** utilizando **Playwright**, **Cypress** e **Robot Framework**.

O fluxo é:

> Testar a API e caso esteja respondendo, testar E2E no front-end (via Playwright, Cypress e Robot Framework)

---

### 💻 Pré-requisitos

* LINUX (WSL)

Neste projeto estou utilizando o Ubuntu no Windows com WSL.

Versão do Linux:

```bash
cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.5 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.5 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
```

* [Node.js](https://nodejs.org/) (para Cypress e Playwright)

Versão do Node:

```bash
node --version
v20.20.2
```

Versão do NPM:

```bash
npm --version
10.8.2
```

* Python 3.10+ (para Robot Framework)

Versão do Python:

```bash
python3 --version
Python 3.10.12
```

* Chrome ou outro navegador compatível (para testes E2E)

Versão do chromedriver:

```bash
chromedriver --version
ChromeDriver 146.0.7680.80 (f08938029c887ea624da7a1717059788ed95034d-refs/branch-heads/7680_65@{#34})
```

Versão do google-chrome:

```bash
google-chrome --version
Google Chrome 146.0.7680.80 
```

> OBS.: o `chromedriver` e `google-chrome` precisam ter a mesma versão. Caso contrário não vai funcionar.

* `pip` atualizado

Versão do PIP:

```bash
pip --version
pip 26.0.1 from /home/rfahham/.local/lib/python3.10/site-packages/pip (python 3.10)
```

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
8 - Limpar usuários 'Hora do QA'
0 - Sair
```

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
```

---

### 🧪 Executando testes individualmente

* **Cypress**: `make run-cypress` ou via menu
* **Playwright**: `make run-playwright` ou via menu
* **Robot Framework**: `make run-robot` ou via menu

Para rodar **todos os testes juntos**: `make run-all` ou escolha a opção `7` no menu.

Para **limpar usuários 'Hora do QA'** da API: `make clear` ou escolha a opção `8` no menu.

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