# API Ping

## Description
Une API simple qui retourne les headers de la requête en JSON lorsqu'on effectue un `GET /ping`.
Toute autre requête renvoie une réponse vide avec un code `404`.

## Installation et exécution

### Prérequis
- Node.js installé

### Installation
```sh
npm install
```

### Lancement
```sh
PING_LISTEN_PORT=4000 node index.js
```
Par défaut, l'API écoute sur le port `3000` si `PING_LISTEN_PORT` n'est pas défini.

### Exemple de requête
```sh
curl -X GET http://localhost:3000/ping
```
