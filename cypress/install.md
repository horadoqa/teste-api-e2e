Aqui vai um guia direto e completo para instalar o **Cypress** 👇

---

# 🚀 1. Pré-requisitos

Antes de tudo, você precisa ter instalado:

* **Node.js** (recomendado: versão 16+)
* npm (já vem com Node)

Verifique:

```bash
node -v
npm -v
```

---

# 📦 2. Criar o projeto (se ainda não tiver)

```bash
npm init -y
```

---

# 📥 3. Instalar o Cypress

```bash
npm install cypress --save-dev
```

---

# ▶️ 4. Abrir o Cypress pela primeira vez

```bash
npx cypress open
```

👉 Isso vai:

* Criar a estrutura do projeto automaticamente
* Gerar exemplos de testes

---

# 📁 Estrutura criada

```bash
cypress/
 ├── e2e/
 ├── fixtures/
 ├── support/
 └── cypress.config.js
```

---

# 🧪 5. Rodar testes

### Modo interface (GUI)

```bash
npx cypress open
```

### Modo headless (terminal)

```bash
npx cypress run
```

---

# ✨ 6. Criar seu primeiro teste

Exemplo:

```javascript
describe('Meu primeiro teste', () => {
  it('Visita um site', () => {
    cy.visit('https://example.com');
    cy.contains('Example').should('be.visible');
  });
});
```

---

# 💡 Dicas importantes

### ✔ Abrir direto um arquivo

```bash
npx cypress run --spec cypress/e2e/seu_teste.cy.js
```

---

### ✔ Definir baseUrl (boa prática)

No `cypress.config.js`:

```javascript
module.exports = {
  e2e: {
    baseUrl: 'https://front.serverest.dev'
  }
}
```

---

# ⚠️ Problemas comuns

### ❌ Cypress não abre

```bash
npx cypress install
```

---

### ❌ Permissão (Linux/Mac)

```bash
sudo chown -R $(whoami) ~/.cache/Cypress
```

---

# 🧠 Próximo nível

Depois da instalação, vale evoluir para:

* Custom commands (`commands.js`)
* Page Object Model
* Testes de API com `cy.request`
* Integração com CI/CD

---

