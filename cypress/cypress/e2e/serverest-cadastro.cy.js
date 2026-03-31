import cadastroPage from '../pages/cadastroPage';

describe('Teste de Cadastro - ServeRest', () => {

  const API_URL = 'https://serverest.dev/usuarios';

  before(() => {
    cy.healthCheck(API_URL);
  });

  it('Deve cadastrar um novo usuário com sucesso', () => {
    cy.readFile('../credentials.json').then((credentials) => {
      const nome = credentials.nome;
      const senha = credentials.senha;
      const email = `horadoqa_${Date.now()}@qa.com`;

      cadastroPage.visitar();
      cadastroPage.preencherFormulario(nome, email, senha);
      cadastroPage.marcarAdmin();
      cadastroPage.submeter();
      cadastroPage.validarSucesso(nome);
    });
  });

});