# `ui_extApp`

*Fichier : `lua/ge/extensions/ui/extApp.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_extApp` : `extensions.load("ui_extApp")`, puis la globale `ui_extApp`

Serveur web/WebSocket pour afficher l'interface du jeu sur un appareil externe (téléphone). Au chargement, il démarre via utils/wsUtils un serveur sur le port 8084 (protocole 'bng-ext-app-v1', page /ui/entrypoints/main/index.html), en HTTPS/WSS pour que les capteurs de mouvement du téléphone soient accessibles, et publie l'URL à l'UI par guihooks.trigger('externalUIURL', url). Usage : extensions.load('ui_extApp').

## Remarques

- Les données de flux sont gérées côté C++ ; _handleData ne fait que journaliser une erreur « unknown command » pour tout message JSON reçu.
- Le serveur écoute sur toutes les adresses ('any') ; l'adresse annoncée est celle choisie par wsUtils.createOrGetWS.
- Au déchargement, externalUIURL est émis sans argument pour effacer l'URL côté UI.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_extApp.onExtensionLoaded()` | Hook de chargement : crée ou récupère le serveur WebSocket/HTTPS, journalise l'URL et la publie à l'UI. *(interne)* *(hook)* | 26 |
| `ui_extApp.onExtensionUnloaded()` | Hook de déchargement : détruit le serveur (BNGWebWSServer.destroy) et efface l'URL côté UI. *(interne)* *(hook)* | 32 |
| `ui_extApp.onUpdate()` | Hook par frame : lit les évènements des pairs WebSocket, décode les messages JSON de type 'D' et les passe à _handleData (qui journalise une erreur car tout est géré en C++). *(interne)* *(hook)* | 45 |
| `ui_extApp.requestUIData()` | Renvoie à l'UI l'URL du serveur (guihooks.trigger('externalUIURL', url)). Alias de updateUIData. | 21 |

**Évènements UI (guihooks.trigger) :** `externalUIURL`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/extApp.lua`.*
