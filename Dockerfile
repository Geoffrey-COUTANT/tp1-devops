# Étape 1: Build
FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json tsconfig.json ./

# Installer toutes les dépendances, y compris les devDependencies pour TypeScript
RUN npm ci

COPY . .

# Compiler le TypeScript en JavaScript
RUN npm run build

# Étape 2: Execution (image finale plus légère)
FROM node:20-alpine

# Créer un utilisateur non-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copier uniquement les fichiers nécessaires à l’exécution
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist

USER appuser

# Exposer le port (utilisation de la variable d'environnement)
EXPOSE 8000

# Lancer l’application
CMD ["node", "dist/index.js"]