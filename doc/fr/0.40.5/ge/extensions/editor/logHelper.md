# `editor_logHelper`

*Fichier : `lua/ge/extensions/editor/logHelper.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_logHelper` : `extensions.load("editor_logHelper")`, puis la globale `editor_logHelper`

Extension d'éditeur qui affiche dans la barre de menu principale de l'éditeur le compteur d'erreurs (rouge, suffixe E) et d'avertissements (jaune, suffixe W) du log de développement, via Lua:getDevLogStats().

## Remarques

- Le test de garde utilise `Lua.getDevLogStats` (point) alors que l'appel utilise `Lua:getDevLogStats()` (deux-points).
- Le commentaire du code indique que le positionnement à droite de la barre (SameLine) ne fonctionne plus : le texte s'affiche à la suite des menus.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_logHelper.onEditorMainMenuBar(windowSize)` | Hook de dessin de la barre de menu principale. Écrit « LogStats: » puis le nombre d'erreurs et d'avertissements s'ils sont supérieurs à 0. Ne fait rien si Lua.getDevLogStats n'existe pas. *(interne)* *(hook)* | 9 |

### Détail des paramètres

#### `editor_logHelper.onEditorMainMenuBar(windowSize)`

Hook de dessin de la barre de menu principale. Écrit « LogStats: » puis le nombre d'erreurs et d'avertissements s'ils sont supérieurs à 0. Ne fait rien si Lua.getDevLogStats n'existe pas.

- `windowSize` (*table*) : Taille de la fenêtre (non utilisée : la ligne SameLine est commentée).

## Appels vers le moteur (C++)

- `Lua:` `getDevLogStats`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/logHelper.lua`.*
