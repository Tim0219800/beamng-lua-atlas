# `editor_api_guiInstancer`

*Fichier : `lua/ge/extensions/editor/api/guiInstancer.lua` · VM : Game Engine (GE) · 42 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/api/guiInstancer")` (fichier sous extensions/ mais pas une extension classique)

Petite classe utilitaire de l'éditeur qui gère une liste d'instances d'une fenêtre GUI (par ex. plusieurs copies d'un même panneau). Chaque instance est une table `{ locked = false }` rangée dans `instances` avec un index entier. Le module renvoie un constructeur sans argument qui crée l'objet et appelle `init`.

## Exemple

```lua
local instancer = require("editor/api/guiInstancer")()
local idx = instancer:addInstance()
instancer:removeInstance(idx)
```

## Remarques

- `nextInstanceIndex` est remis à 1 quand la table d'instances est vide au moment de `addInstance`.
- `removeInstance` met seulement la case à nil : les indices ne sont pas décalés.

## Classe `C`

Objet renvoyé par le constructeur du module. Champs : `instances` (table index -> {locked}), `nextInstanceIndex` (integer).

Le module renvoie un constructeur : `local obj = require("editor_api_guiInstancer")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addInstance()` | Ajoute une instance `{ locked = false }` et renvoie son index. Repart de 1 si aucune instance n'existe. | 12 |
| `C:deserialize(name, state)` | Restaure `instances` et `nextInstanceIndex` depuis `state[name]` s'il existe (défauts `{}` et 1). | 29 |
| `C:init()` | Initialise `instances` à vide et `nextInstanceIndex` à 1. Appelé par le constructeur. | 7 |
| `C:removeInstance(instanceIndex)` | Supprime l'instance à l'index donné (met la case à nil). | 21 |
| `C:serialize(name, state)` | Écrit `{ instances, nextInstanceIndex }` dans `state[name]` pour la sauvegarde de l'état de l'éditeur. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/guiInstancer.lua`.*
