# `career_modules_debug_organizationsDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/organizationsDebug.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_organizationsDebug` : `extensions.load("career_modules_debug_organizationsDebug")`, puis la globale `career_modules_debug_organizationsDebug`

Onglet de debug carrière « Organizations ». Deux entrées de triche : donner une réputation aléatoire (-50 à 150) à environ 30 % des organisations (via career_modules_playerAttributes.addAttributes) et marquer environ 30 % des facilités de livraison comme 'interacted'.

## Remarques

- Outil de développement ; debugOrder = 3.
- La première entrée appelle aussi career_career.interactWithOrganization pour chaque organisation tirée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_organizationsDebug.drawDebugFunctions()` | Dessine les entrées '> Give random reputation to 30% of organizations' et 'Interact with random facilities'. *(interne)* | 9 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Organizations'. |
| `debugOrder` | number | Ordre de tri (3). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/organizationsDebug.lua`.*
