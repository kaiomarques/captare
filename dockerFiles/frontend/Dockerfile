# Estágio de construção
FROM node:18 AS build

# Define o diretório de trabalho
WORKDIR /app

# Copia o código do projeto para o diretório de trabalho
COPY frontend/package.json frontend/package-lock.json ./

# Instala as dependências
RUN npm install

# Copia o restante dos arquivos do projeto
COPY frontend/ ./

# Executa o build
RUN npm run build

# Estágio de produção
FROM node:18 AS production

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de build do estágio anterior
COPY --from=build /app/.next /app/.next
COPY --from=build /app/package.json /app/package.json
COPY --from=build /app/package-lock.json /app/package-lock.json

# Instala as dependências de produção
RUN npm install --only=production

# Expondo a porta 3000 para o Next.js
EXPOSE 3000

# Comando para iniciar o servidor
CMD ["npm", "start"]