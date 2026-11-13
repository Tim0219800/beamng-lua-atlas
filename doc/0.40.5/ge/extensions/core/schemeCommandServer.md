# `core_schemeCommandServer`

*Fichier : `lua/ge/extensions/core/schemeCommandServer.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_schemeCommandServer` : `extensions.load("core_schemeCommandServer")`, puis la globale `core_schemeCommandServer`

Ancien serveur UDP local (127.0.0.1:22137) qui recevait les commandes du schéma d'URL 'beamng:' et les passait à commandhandler.onSchemeCommand. Le code est marqué OBSOLÈTE : le gestionnaire de schéma par défaut est désormais un tube Windows (pipe).

## Remarques

- Seuls les paquets commençant par 'beamng:' sont traités ; le préfixe de 7 caractères est retiré avant l'appel.
- Un seul paquet (4096 octets max) est lu par image.
- onFirstUpdate renvoie false si le port ne peut pas être ouvert, mais ce retour n'est pas utilisé par un hook.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_schemeCommandServer.onFirstUpdate()` | Hook de première mise à jour : ouvre le socket UDP 127.0.0.1:22137 (non bloquant). Journalise un avertissement si l'ouverture échoue. *(interne)* *(hook)* | 11 |
| `core_schemeCommandServer.onUpdate()` | Hook de mise à jour : lit un paquet UDP ; si le texte commence par 'beamng:', appelle commandhandler.onSchemeCommand avec la suite. *(interne)* *(hook)* | 22 |

### Détail des paramètres

#### `core_schemeCommandServer.onFirstUpdate()`

Hook de première mise à jour : ouvre le socket UDP 127.0.0.1:22137 (non bloquant). Journalise un avertissement si l'ouverture échoue.

- **renvoie** : boolean|nil false si le socket n'a pas pu être ouvert.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/schemeCommandServer.lua`.*
