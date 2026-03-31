.PHONY: menu loop install-cypress install-playwright install-robot run-cypress run-playwright run-robot run-all run-cypress-docker run-playwright-docker run-robot-docker run-all-docker

# Cores ANSI
GREEN=\033[0;32m
YELLOW=\033[1;33m
BLUE=\033[0;34m
RED=\033[0;31m
NC=\033[0m

menu:
	@clear
	@echo "$(BLUE)=====================================$(NC)"
	@echo "$(GREEN)   🚀 MENU DE EXECUÇÃO DE TESTES$(NC)"
	@echo "$(BLUE)=====================================$(NC)"
	@echo "$(YELLOW)1$(NC) - Instalar Cypress"
	@echo "$(YELLOW)2$(NC) - Instalar Playwright"
	@echo "$(YELLOW)3$(NC) - Instalar Robot Framework"
	@echo "$(YELLOW)4$(NC) - Rodar testes Cypress"
	@echo "$(YELLOW)5$(NC) - Rodar testes Playwright"
	@echo "$(YELLOW)6$(NC) - Rodar testes Robot"
	@echo "$(YELLOW)7$(NC) - Rodar TODOS os testes Localmente"
	@echo "$(YELLOW)8$(NC) - Limpar usuários 'Hora do QA'"
	@echo "$(YELLOW)9$(NC) - Rodar testes Cypress (Docker)"
	@echo "$(YELLOW)10$(NC) - Rodar testes Playwright (Docker)"
	@echo "$(YELLOW)11$(NC) - Rodar testes Robot (Docker)"
	@echo "$(YELLOW)12$(NC) - Rodar TODOS os testes (Docker)"
	@echo "$(RED)0$(NC) - Sair"
	@echo "$(BLUE)=====================================$(NC)"

loop:
	@while true; do \
		$(MAKE) menu; \
		read -p "👉 Escolha uma opção: " opcao; \
		case $$opcao in \
			1) $(MAKE) install-cypress ;; \
			2) $(MAKE) install-playwright ;; \
			3) $(MAKE) install-robot ;; \
			4) $(MAKE) run-cypress ;; \
			5) $(MAKE) run-playwright ;; \
			6) $(MAKE) run-robot ;; \
			7) $(MAKE) run-all ;; \
			8) $(MAKE) clear ;; \
			9) $(MAKE) run-cypress-docker ;; \
			10) $(MAKE) run-playwright-docker ;; \
			11) $(MAKE) run-robot-docker ;; \
			12) $(MAKE) run-all-docker ;; \
			0) echo "$(RED)👋 Saindo...$(NC)"; break ;; \
			*) echo "$(RED)❌ Opção inválida!$(NC)" ;; \
		esac; \
		echo ""; \
		read -p "Pressione ENTER para voltar ao menu..." dummy; \
	done

# ========================
# INSTALAÇÃO
# ========================

install-cypress:
	@echo "$(GREEN)📦 Instalando Cypress...$(NC)"
	cd cypress && npm install

install-playwright:
	@echo "$(GREEN)📦 Instalando Playwright...$(NC)"
	cd playwright && npm install && npx playwright install

install-robot:
	@echo "$(GREEN)📦 Instalando Robot Framework...$(NC)"
	pip install robotframework robotframework-seleniumlibrary robotframework-jsonlibrary robotframework-requests requests selenium

# ========================
# EXECUÇÃO
# ========================

run-cypress:
	@echo "$(BLUE)🧪 Executando Cypress...$(NC)"
	cd cypress && npx cypress run

run-playwright:
	@echo "$(BLUE)🧪 Executando Playwright...$(NC)"
	cd playwright && rm -rf test-results && mkdir -p test-results && npx playwright test

run-robot:
	@echo "$(BLUE)🧪 Executando Robot...$(NC)"
	cd robot && mkdir -p results && robot --outputdir results serverest-cadastro.robot

run-all:
	@echo "$(GREEN)🚀 Executando TODOS os testes...$(NC)"
	$(MAKE) run-cypress
	$(MAKE) run-playwright
	$(MAKE) run-robot

clear:
	@echo "$(RED)🗑️  Limpando usuários 'Hora do QA' da API...$(NC)"
	@curl -s 'https://serverest.dev/usuarios' | jq -r '.usuarios[] | select(.nome == "Hora do QA") | ._id' | while read id; do \
		echo "$(GREEN)Deletando usuário $$id$(NC)"; \
		curl -X DELETE "https://serverest.dev/usuarios/$$id" -w "Status: %{http_code}\n"; \
	done

# ========================
# EXECUÇÃO VIA DOCKER
# ========================

run-cypress-docker:
	@echo "$(BLUE)🐳 Executando Cypress via Docker...$(NC)"
	docker-compose run cypress

run-playwright-docker:
	@echo "$(BLUE)🐳 Executando Playwright via Docker...$(NC)"
	docker-compose run playwright

run-robot-docker:
	@echo "$(BLUE)🐳 Executando Robot via Docker...$(NC)"
	docker-compose run robot

run-all-docker:
	@echo "$(GREEN)🚀 Executando TODOS os testes via Docker...$(NC)"
	$(MAKE) run-cypress-docker
	$(MAKE) run-playwright-docker
	$(MAKE) run-robot-docker