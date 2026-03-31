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