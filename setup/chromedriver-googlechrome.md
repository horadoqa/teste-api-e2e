# 🚀 Como instalar o ChromeDriver no Linux

## ✅ 1. Método mais fácil (recomendado)

Se você usa Ubuntu/Debian:

```bash
sudo apt update
sudo apt install -y chromium-chromedriver
```

👉 Isso instala:

* Chromium
* ChromeDriver compatível

---

## 🔍 2. Verificar instalação

```bash
chromedriver --version
```

---

## ⚠️ 3. Se você usa Google Chrome (não Chromium)

Você precisa garantir que o **ChromeDriver tem a mesma versão do Chrome**.

### 🔹 Ver versão do Chrome

```bash
google-chrome --version
```

Exemplo:

```
Google Chrome 120.0.6099.109
```

---

### 🔹 Baixar ChromeDriver compatível

Acesse:
👉 [https://chromedriver.chromium.org/downloads](https://chromedriver.chromium.org/downloads)

Escolha a versão correspondente ao seu Chrome.

---

### 🔹 Instalar manualmente

```bash
# baixar (exemplo)
wget https://chromedriver.storage.googleapis.com/120.0.6099.109/chromedriver_linux64.zip

# extrair
unzip chromedriver_linux64.zip

# dar permissão
chmod +x chromedriver

# mover para PATH
sudo mv chromedriver /usr/local/bin/
```

---

## 🧠 4. Melhor abordagem moderna (recomendada 💡)

Hoje você nem precisa gerenciar driver manualmente 👇

### 🔹 Usar Selenium Manager (automático)

Se estiver usando Selenium recente (v4.6+), ele baixa o driver sozinho:

```bash
pip install --upgrade selenium
```

E no Robot Framework:

```robot
Open Browser    https://google.com    Chrome
```

👉 O Selenium automaticamente:

* detecta versão do Chrome
* baixa o ChromeDriver correto
* executa

---

## ⚠️ Problemas comuns

### ❌ Erro: driver não encontrado

➡️ Solução: garantir que está no PATH:

```bash
which chromedriver
```

---

### ❌ Versão incompatível

➡️ Chrome ≠ ChromeDriver
✔️ Sempre use versões compatíveis

---

## 💡 Minha recomendação pra você

Como você está usando:

* Robot Framework
* Cypress
* Playwright

👉 Melhor usar:

✔️ **Selenium 4 + Selenium Manager (automático)**
✔️ Evitar instalar driver manual

---
