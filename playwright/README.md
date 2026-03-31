Perfeito! Vamos converter seu teste de **Cypress** para **Playwright**, mantendo a mesma lógica:

* Primeiro faz o **health check da API**
* Depois executa o **teste E2E de cadastro**

Aqui está a versão completa:

---

## 📄 Código Playwright (JavaScript/Node.js)

```javascript id="d1kpt2"
const { test, expect, request } = require('@playwright/test');

test.describe('Teste de Cadastro - ServeRest', () => {

  const API_URL = 'https://serverest.dev/usuarios';
  const FRONT_URL = 'https://front.serverest.dev/cadastrarusuarios';

  let apiContext;

  test.beforeAll(async ({ playwright }) => {
    // Cria um contexto de API
    apiContext = await request.newContext();

    const response = await apiContext.get(API_URL);
    console.log(`Status da API: ${response.status()}`);
    expect(response.status()).toBe(200);
  });

  test('Deve cadastrar um novo usuário com sucesso', async ({ page }) => {
    await page.goto(FRONT_URL);

    const email = `horadoqa_${Date.now()}@qa.com`;

    await page.fill('input[name="nome"]', 'Hora do QA');
    await page.fill('input[name="email"]', email);
    await page.fill('input[name="password"]', '1q2w3e4r');

    await page.check('input[type="checkbox"]');
    await page.click('button[type="submit"]');

    await expect(page.locator('text=Cadastro realizado com sucesso')).toBeVisible();
  });

});
```

---

## 🔍 Observações sobre a conversão

1. **Health check da API**

   * Cypress: `cy.request()`
   * Playwright: `request.newContext().get()`

2. **E2E**

   * Cypress: `cy.visit()` → Playwright: `page.goto()`
   * Cypress: `cy.get().type()` → Playwright: `page.fill()`
   * Cypress: `cy.get().check()` → Playwright: `page.check()`
   * Cypress: `cy.contains().should('be.visible')` → Playwright: `expect(page.locator()).toBeVisible()`

3. **Execução**

   * Salve o arquivo, por exemplo, em `tests/cadastro.spec.js`
   * Execute:

     ```bash
     npm init playwright@latest
     

     ✔ Success! Created a Playwright Test project at /home/rfahham/projetos/teste-api-e2e/playwright

Inside that directory, you can run several commands:

  npx playwright test
    Runs the end-to-end tests.

  npx playwright test --ui
    Starts the interactive UI mode.

  npx playwright test --project=chromium
    Runs the tests only on Desktop Chrome.

  npx playwright test example
    Runs the tests in a specific file.

  npx playwright test --debug
    Runs the tests in debug mode.

  npx playwright codegen
    Auto generate tests with Codegen.

We suggest that you begin by typing:

    npx playwright test

And check out the following files:
  - ./tests/example.spec.js - Example end-to-end test
  - ./playwright.config.js - Playwright Test configuration

Visit https://playwright.dev/docs/intro for more information. ✨

Happy hacking! 🎭
     ```

Execute:

```Bash
npx playwright test cadastro.spec.js
```

---

Se você quiser, posso criar uma **versão Playwright ainda mais profissional**, usando:

* **Page Object Model (POM)**
* **Comando reutilizável para health check**
* **E-mail dinâmico e geração automática de usuário**

Isso deixaria seu teste no mesmo nível avançado que a versão Cypress que criamos.

Quer que eu faça essa versão?
