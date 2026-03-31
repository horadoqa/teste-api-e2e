.PHONY: menu loop install-cypress install-playwright install-robot run-cypress run-playwright run-robot run-all

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
	@echo "$(YELLOW)7$(NC) - Rodar TODOS os testes"
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
	pip install robotframework robotframework-seleniumlibrary robotframework-jsonlibrary

# ========================
# EXECUÇÃO
# ========================

run-cypress:
	@echo "$(BLUE)🧪 Executando Cypress...$(NC)"
	cd cypress && npx cypress run

run-playwright:
	@echo "$(BLUE)🧪 Executando Playwright...$(NC)"
	cd playwright && npx playwright test

run-robot:
	@echo "$(BLUE)🧪 Executando Robot...$(NC)"
	cd robot && mkdir -p results && robot --outputdir results serverest-cadastro.robot

run-all:
	@echo "$(GREEN)🚀 Executando TODOS os testes...$(NC)"
	$(MAKE) run-cypress
	$(MAKE) run-playwright
	$(MAKE) run-robot