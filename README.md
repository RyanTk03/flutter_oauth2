# Authentication flutter app based on oauth2

## Presentation
This is a monorepo for two part of the same project. So the repo is subdivised in two part:
- the project backend
- the project frontend

**1. The backend** is a nodejs API server that communicate with the frontend. This server has the endpoints for user authentication using oauth2.
**2. Th frontend** is a flutter app. It is a simple application with 3 page:
- login: to let user login to the account
- register: to register a new user
- home: the protected pad

## Setup
Read the read the of each part(backend & flutter app) to know how to setup the project

sequenceDiagram
    participant FE as Flutter Frontend (App)
    participant API as Node.js API (OAuth2 Server)
    participant DB as PostgreSQL DB

    Note over FE, API: Étape 1 - Soumission des identifiants
    FE->>API: [1] POST /login (email, password)
    API->>DB: Vérifie les identifiants de l'utilisateur
    DB-->>API: Résultat de la vérification (succès/échec)
    API-->>FE: Réponse (OK ou erreur d'identification)

    Note over FE, API: Étape 2 - Demande de jeton
    FE->>API: [2] POST /oauth/token<br>grant_type=password<br>client_id, client_secret<br>username, password
    API->>DB: Génère et stocke access_token et refresh_token
    DB-->>API: Confirmation d’enregistrement des tokens
    API-->>FE: access_token, refresh_token

    Note over FE, API: Étape 3 - Accès à une ressource protégée
    FE->>API: [3] GET /protected-resource<br>Authorization: Bearer access_token
    API->>DB: Vérifie access_token
    DB-->>API: Valide / Invalide
    API-->>FE: Donnée protégée ou erreur d'autorisation

    Note over FE, API: Étape 4 - Rafraîchissement du token
    FE->>API: [4] POST /oauth/token<br>grant_type=refresh_token<br>refresh_token
    API->>DB: Vérifie refresh_token, génère nouveau access_token
    DB-->>API: Confirmation, stocke nouveau token
    API-->>FE: Nouveau access_token (et parfois un nouveau refresh_token)
