# `editor_crawlEditor_input`

*Fichier : `lua/ge/extensions/editor/crawlEditor/input.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_crawlEditor_input` : `extensions.load("editor_crawlEditor_input")`, puis la globale `editor_crawlEditor_input`

Aide de l'éditeur de crawl pour la souris : à chaque appel de updateMouseInfo, calcule le rayon caméra-souris, le raycast sur la scène (forêt désactivée le temps du tir) et les états clic/maintien/relâché du bouton gauche. Les autres fichiers du crawlEditor lisent le résultat via getMouseInfo().

## Remarques

- Champs de la table mouseInfo : camPos, ray, rayDir, rayCast, valid, down, hold, up, closestNodeHovered, et _downPos/_downNormal, _holdPos/_holdNormal, _upPos/_upNormal (vec3 issus de rayCast.pos et rayCast.normal).
- down/hold/up sont forcés à false quand le raycast ne touche rien ; sinon ils sont aussi faux si imgui capte la souris (WantCaptureMouse).
- getMouseInfo() renvoie nil tant que updateMouseInfo n'a jamais été appelé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_crawlEditor_input.getMouseInfo()` | Renvoie la table mouseInfo courante. | 45 |
| `editor_crawlEditor_input.updateMouseInfo()` | Met à jour la table mouseInfo (position caméra, rayon souris, raycast, états du bouton gauche). Désactive puis réactive la collision de la forêt autour du raycast. | 10 |

### Détail des paramètres

#### `editor_crawlEditor_input.getMouseInfo()`

Renvoie la table mouseInfo courante.

- **renvoie** : table|nil mouseInfo, ou nil avant le premier updateMouseInfo

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/input.lua`.*
