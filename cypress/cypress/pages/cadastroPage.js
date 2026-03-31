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

  validarSucesso(nome) {
  cy.contains('Cadastro realizado com sucesso').should('be.visible');

  // valida URL de redirecionamento
  cy.url().should('include', '/admin/home');

  // valida mensagem de boas-vindas com o nome
  cy.contains('h1', `Bem Vindo ${nome}`).should('be.visible');
}
}

export default new CadastroPage();