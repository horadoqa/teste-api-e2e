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