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