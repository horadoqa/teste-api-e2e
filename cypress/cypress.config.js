const { defineConfig } = require('cypress');

module.exports = defineConfig({
  e2e: {
    allowCypressEnv: false,
    baseUrl: 'https://front.serverest.dev',
  },
});
