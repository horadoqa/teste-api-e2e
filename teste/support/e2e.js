// Importa comandos customizados
import './commands';

// Pode adicionar configurações globais aqui
beforeEach(() => {
  // Exemplo: limpar cookies antes de cada teste
  cy.clearCookies();
});

console.log('Support carregado');