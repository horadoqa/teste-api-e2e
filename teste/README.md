Perfeito — agora vamos estruturar isso em um **nível mais profissional (QA pleno/sênior)** usando:

* Custom command (`healthCheck`)
* Separação de responsabilidades
* Page Object
* Código reutilizável e escalável dentro do **Cypress**

---

# 📁 Estrutura sugerida

```
cypress/
 ├── e2e/
 │    └── cadastro.cy.js
 ├── pages/
 │    └── cadastroPage.js
 └── support/
      ├── commands.js
      └── e2e.js
```

---

# 🧩 1. Custom Command (health check)

📄 `cypress/support/commands.js`

```javascript id="g6t4sl"
Cypress.Commands.add('healthCheck', (url) => {
  cy.request({
    method: 'GET',
    url,
    failOnStatusCode: false,
    retryOnStatusCodeFailure: true,
    retryOnNetworkFailure: true
  }).then((response) => {
    cy.log(`Status da API: ${response.status}`);
    expect(response.status).to.eq(200);
  });
});
```

👉 Agora você tem um check reutilizável pra qualquer API

---

# 🧱 2. Page Object (organização do E2E)

📄 `cypress/pages/cadastroPage.js`

```javascript id="krgpxw"
class CadastroPage {

  visitar() {
    cy.visit('/cadastrarusuarios');
  }

  preencherFormulario(nome, email, senha) {
    cy.get('input[name="nome"]').type(nome);
    cy.get('input[name="email"]').type(email);
    cy.get('input[name="password"]').type(senha);
  }

  marcarAdmin() {
    cy.get('input[type="checkbox"]').check();
  }

  submeter() {
    cy.get('button[type="submit"]').click();
  }

  validarSucesso() {
    cy.contains('Cadastro realizado com sucesso').should('be.visible');
  }
}

export default new CadastroPage();
```

---

# ⚙️ 3. Config base (opcional, mas recomendado)

📄 `cypress.config.js`

```javascript id="z6zbs9"
const { defineConfig } = require('cypress');

module.exports = defineConfig({
  e2e: {
    baseUrl: 'https://front.serverest.dev',
  },
});
```

---

# 🧪 4. Teste final (limpo e escalável)

📄 `cypress/e2e/cadastro.cy.js`

```javascript id="bx5mkk"
import cadastroPage from '../pages/cadastroPage';

describe('Teste de Cadastro - ServeRest', () => {

  const API_URL = 'https://serverest.dev/usuarios';

  before(() => {
    cy.healthCheck(API_URL);
  });

  it('Deve cadastrar um novo usuário com sucesso', () => {
    const email = `horadoqa_${Date.now()}@qa.com`;

    cadastroPage.visitar();
    cadastroPage.preencherFormulario('Hora do QA', email, '1q2w3e4r');
    cadastroPage.marcarAdmin();
    cadastroPage.submeter();
    cadastroPage.validarSucesso();
  });

});
```

---

# 🚀 O que você ganhou com isso

### ✔ Reutilização

* `cy.healthCheck()` serve pra qualquer API

### ✔ Legibilidade absurda

```javascript
cadastroPage.preencherFormulario(...)
```

### ✔ Manutenção fácil

* Mudou o seletor? Só altera no Page Object

### ✔ Escalabilidade real

* Pronto pra crescer com:

  * múltiplos testes
  * múltiplas páginas
  * pipelines CI/CD

---

# 💡 Próximo nível (se quiser evoluir ainda mais)

Posso te ajudar a implementar:

* 🔁 Retry inteligente (esperar API subir)
* 🔐 Testes autenticados (login via API)
* 📊 Relatórios (Allure / Mochawesome)
* ⚡ CI com GitHub Actions
* 🧪 Separação completa: API vs UI

Só falar que eu te levo pro nível **QA avançado mesmo** 🚀
