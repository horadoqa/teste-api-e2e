#!/bin/bash

set -e

echo "🚀 Instalando Google Chrome..."

# Baixar e instalar Google Chrome
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt update
sudo apt install -y ./google-chrome-stable_current_amd64.deb

echo "✅ Google Chrome instalado!"

# Obter versão do Chrome
CHROME_VERSION=$(google-chrome --version | grep -oP '\d+\.\d+\.\d+\.\d+')
CHROME_MAJOR=$(echo $CHROME_VERSION | cut -d '.' -f 1)

echo "🌐 Versão do Chrome: $CHROME_VERSION"
echo "🔎 Versão major: $CHROME_MAJOR"

echo "⬇️ Buscando versão compatível do ChromeDriver..."

# Obter versão do ChromeDriver compatível
DRIVER_VERSION=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_MAJOR")

echo "📦 Versão do ChromeDriver: $DRIVER_VERSION"

# Baixar ChromeDriver
wget -q "https://chromedriver.storage.googleapis.com/${DRIVER_VERSION}/chromedriver_linux64.zip"

# Extrair
unzip -o chromedriver_linux64.zip

# Permissão de execução
chmod +x chromedriver

# Mover para PATH
sudo mv chromedriver /usr/local/bin/

# Limpeza
rm chromedriver_linux64.zip google-chrome-stable_current_amd64.deb

echo "✅ ChromeDriver instalado!"

# Verificação final
echo ""
echo "🔍 Verificando versões instaladas..."

INSTALLED_DRIVER_VERSION=$(chromedriver --version | grep -oP '\d+\.\d+\.\d+\.\d+')

echo "Chrome:       $CHROME_VERSION"
echo "ChromeDriver: $INSTALLED_DRIVER_VERSION"

# Comparar versões major
DRIVER_MAJOR=$(echo $INSTALLED_DRIVER_VERSION | cut -d '.' -f 1)

if [ "$CHROME_MAJOR" == "$DRIVER_MAJOR" ]; then
    echo "✅ Versões COMPATÍVEIS!"
else
    echo "❌ Versões INCOMPATÍVEIS!"
fi

echo ""
echo "🎉 Instalação concluída!"