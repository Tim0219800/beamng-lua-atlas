# `util_wsTest`

*Fichier : `lua/ge/extensions/util/wsTest.lua` · VM : Game Engine (GE) · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_wsTest` : `extensions.load("util_wsTest")`, puis la globale `util_wsTest`

Outil de développement : démarre un serveur web/WebSocket (port 8083, protocole « bng-test », page ./ui/entrypoints/util_wsTest/) écoutant sur toutes les adresses. Un client distant peut exécuter du code Lua GE, recharger le Lua, recharger l'interface CEF, ouvrir la console de développement CEF et mesurer la bande passante. Sert aux tests d'outils externes.

## Exemple

```lua
extensions.load('util_wsTest')
```

## Remarques

- Sécurité : la commande execGELua évalue du Lua arbitraire envoyé par n'importe quel client connecté, sur toutes les interfaces réseau. À n'utiliser qu'en local de confiance.
- Commandes JSON reconnues (champ type) : execGELua (cmd), reloadGELua, reloadCEF, toggleCEFDevConsole, bandwidthDown, bandwidthUpStart (size). Le message texte « ping » répond « pong ».
- Bug mineur : en cas d'échec du décodage JSON, le message d'erreur utilise la variable `e`, non définie (nil), au lieu de evt.msg.
- Le résultat de execGELua est renvoyé tel quel dans jsonEncode({result = ...}) ; une erreur donne une chaîne « Error: ... ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_wsTest.onExtensionLoaded()` | Crée (ou récupère) le serveur WebSocket via utils/wsUtils sur le port 8083 et affiche son adresse dans la console. *(interne)* *(hook)* | 17 |
| `util_wsTest.onExtensionUnloaded()` | Détruit le serveur WebSocket (BNGWebWSServer.destroy) s'il existe. *(interne)* *(hook)* | 23 |
| `util_wsTest.onUpdate()` | Chaque image : lit les évènements des clients, répond au ping, décode les commandes JSON et les traite, puis met à jour le serveur. *(interne)* *(hook)* | 73 |

## Appels vers le moteur (C++)

- `Lua:` `requestReload`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/wsTest.lua`.*
