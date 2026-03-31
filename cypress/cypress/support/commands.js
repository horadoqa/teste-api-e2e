// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })

Cypress.Commands.add('healthCheck', (url) => {
  const check = (retries = 3) => {
    cy.request({
      method: 'GET',
      url,
      failOnStatusCode: false
    }).then((response) => {
      cy.log(`Status da API: ${response.status}`);

      if (response.status !== 200 && retries > 0) {
        cy.wait(2000);
        check(retries - 1);
      } else {
        expect(response.status).to.eq(200);
      }
    });
  };

  check();
});