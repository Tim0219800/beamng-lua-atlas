# `client_lighting`

*Fichier : `lua/ge/client/lighting.lua` · VM : Game Engine (GE) · 116 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/lighting")`

Choisit et active le gestionnaire de lumière (light manager) du jeu. Il charge tous les fichiers init.lua des sous-dossiers de lua/ge/client/lighting/ (advanced, basic, shadowMaps), puis tente d'abord $pref::lightManager, sinon parcourt les noms de la réglage defaultLightManagerNames. Si aucun ne fonctionne, le jeu se ferme avec « Failed to set a light manager! ».

## Remarques

- initLightingSystems et reloadLightingSystems ont un corps identique dans le code ; la seule différence est le nom.
- Le test de GFX Null Device ne fait rien (commentaire : on ne peut pas retourner ici sinon plantage plus tard).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `client_lighting.initLightingSystems()` | Charge les modules d'éclairage et active un light manager via setLightManager ; quitte le jeu avec un message d'erreur si aucun n'est utilisable. *(interne)* | 61 |
| `client_lighting.reloadLightingSystems()` | Même logique que initLightingSystems, appelée par reloadClient. *(interne)* | 7 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/lighting.lua`.*
