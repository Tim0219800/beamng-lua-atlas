# `skeleton`

*Fichier : `lua/vehicle/extensions/skeleton.lua` · VM : Véhicule · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `skeleton` : `extensions.load (VM véhicule)("skeleton")`, puis la globale `skeleton`

Modèle minimal d'extension véhicule, et extension réellement utilisée : main.lua la charge toujours (extensions.load("skeleton")) à la fin de l'initialisation du véhicule. Cycle de vie : le gestionnaire d'extensions la charge, appelle onExtensionLoaded(), et si celle-ci renvoie false l'extension est déchargée immédiatement (ses hooks ne seront jamais appelés) ; sinon elle reste active et reçoit les hooks globaux (ici onDebugDraw, appelé à chaque frame de debug par main.lua). Convention : une extension expose ses hooks dans la table M (onExtensionLoaded, onInit, onReset, updateGFX, onDebugDraw, onExtensionUnloaded…) et renvoie M.
Celle-ci dessine les poutres et nœuds du véhicule pour aider à démarrer en jbeam quand il n'y a aucun flexbody.

## Exemple

```lua
-- squelette d'une extension véhicule
local M = {}
local function onExtensionLoaded()
  if not v.data.nodes then return false end -- false = se décharger
end
local function updateGFX(dt) end
M.onExtensionLoaded = onExtensionLoaded
M.updateGFX = updateGFX
return M
```

## Remarques

- Se décharge (retourne false) si v.data.beams ou v.data.nodes est nil, si v.data.information.showSkeleton est défini et faux, ou si le véhicule possède des flexbodies non vides. Elle ne reste donc que pour les véhicules sans mesh visible et dont information.showSkeleton n'est pas désactivé.
- Le retour d'onExtensionLoaded : `false` = décharger ; `true` ou nil = garder (extensions.lua ne teste que res == false).
- Le dessin est désactivé quand bdebug.isEnabled() est vrai pour éviter un conflit avec le mode debug.
- Couleurs : poutres (44,71,112,230) épaisseur 0.01 ; nœuds (170,57,57,230) rayon 0.03 ; triangles de collision via drawColTris.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `skeleton.onDebugDraw(focusPos)` | Hook appelé à chaque frame par main.lua (extensions.hook('onDebugDraw', focusPos)). Dessine toutes les poutres (drawBeam3d), tous les nœuds (drawNodeSphere) et les triangles de collision, sauf si le debug beam (bdebug) est actif. *(interne)* *(hook)* | 24 |
| `skeleton.onExtensionLoaded()` | Hook appelé juste après le chargement de l'extension. Renvoie false pour se décharger (pas de beams/nodes, showSkeleton faux, ou flexbodies présents), true sinon. *(interne)* *(hook)* | 11 |

### Détail des paramètres

#### `skeleton.onDebugDraw(focusPos)`

Hook appelé à chaque frame par main.lua (extensions.hook('onDebugDraw', focusPos)). Dessine toutes les poutres (drawBeam3d), tous les nœuds (drawNodeSphere) et les triangles de collision, sauf si le debug beam (bdebug) est actif.

- `focusPos` (*vec3*) : Position du focus caméra (non utilisée).

#### `skeleton.onExtensionLoaded()`

Hook appelé juste après le chargement de l'extension. Renvoie false pour se décharger (pas de beams/nodes, showSkeleton faux, ou flexbodies présents), true sinon.

- **renvoie** : boolean false = décharger l'extension, true = la garder.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/skeleton.lua`.*
