import { test, expect, request } from '@playwright/test';

test.describe('Teste de Cadastro - ServeRest', () => {

  let API_URL = 'https://serverest.dev/usuarios';
  let FRONT_URL = 'https://front.serverest.dev/cadastrarusuarios';
  let apiContext;

  test.beforeAll(async ({ playwright }) => {
    // Cria um contexto de API
    apiContext = await request.newContext();

    let response = await apiContext.get(API_URL);
    console.log(`Status da API: ${response.status()}`);
    expect(response.status()).toBe(200);
  });

  test('Deve cadastrar um novo usuário com sucesso', async ({ page }) => {
    await page.goto(FRONT_URL);

    let email = `horadoqa_${Date.now()}@qa.com`;

    await page.fill('input[name="nome"]', 'Hora do QA');
    await page.fill('input[name="email"]', email);
    await page.fill('input[name="password"]', '1q2w3e4r');

    await page.check('input[type="checkbox"]');
    await page.click('button[type="submit"]');

    await expect(page.locator('text=Cadastro realizado com sucesso')).toBeVisible();

    console.log('Usuário cadastrado com sucesso !!!!');
  });

});


// npx playwright test tests/serverest-cadastro.spec.js