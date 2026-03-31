import { test, expect, request } from '@playwright/test';
import fs from 'fs';

const credentials = JSON.parse(fs.readFileSync('../credentials.json', 'utf8'));

test.describe('Teste de Cadastro - ServeRest', () => {

  let API_URL = credentials.url_api + '/usuarios';
  let FRONT_URL = credentials.url_fe;
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

    await page.fill('input[name="nome"]', credentials.nome);
    await page.fill('input[name="email"]', email);
    await page.fill('input[name="password"]', credentials.senha);

    await page.check('input[type="checkbox"]');
    await page.click('button[type="submit"]');

    await expect(page.locator('text=Cadastro realizado com sucesso')).toBeVisible();

    console.log('Usuário cadastrado com sucesso !!!!');
  });

});


// npx playwright test tests/serverest-cadastro.spec.js