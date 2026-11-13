# `editor_ezObjectSelect_subtools_fence_anchors`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/anchors.lua` · VM : Game Engine (GE) · 262 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_subtools_fence_anchors` : `extensions.load("editor_ezObjectSelect_subtools_fence_anchors")`, puis la globale `editor_ezObjectSelect_subtools_fence_anchors`

Découverte automatique d'une clôture dans l'outil Easy Object Select. À partir d'un TSStatic de départ (dont le mesh figure dans la liste d'assets autorisés), il cherche les TSStatic voisins dont les ancres (milieux des petits côtés de la boîte, via objectBoxAnchors) se correspondent mutuellement à moins de options.distance, construit le graphe de connexion, ordonne les pièces, détecte une boucle et calcule les points de jonction de la spline. draw() trace ces jonctions avec debugDrawer.

## Remarques

- Seuls les TSStatic non « global bounds » dont shapeName (normalisé : minuscules, / , sans / initial) est dans assetPaths sont éligibles.
- La correspondance doit être mutuelle : l'ancre la plus proche de A doit avoir A pour ancre la plus proche.
- La découverte est plafonnée à options.maximumPieces (2048 par défaut) ; result.capped vaut alors true.
- Une boucle est détectée quand il y a plus de 2 pièces et que la première et la dernière ont chacune 2 voisins.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_subtools_fence_anchors.discover(seedObjectId, options)` | Parcourt en largeur les pièces de clôture connectées au seed. Renvoie nil et un message si l'objet de départ n'est pas une pièce éligible. | 184 |
| `editor_ezObjectSelect_subtools_fence_anchors.draw(result)` | Dessine avec debugDrawer:drawLine la polyligne des jonctions (et le segment de fermeture si boucle) du résultat de discover. | 251 |

### Détail des paramètres

#### `editor_ezObjectSelect_subtools_fence_anchors.discover(seedObjectId, options)`

Parcourt en largeur les pièces de clôture connectées au seed. Renvoie nil et un message si l'objet de départ n'est pas une pièce éligible.

- `seedObjectId` (*integer*) : ID de l'objet TSStatic de départ.
- `options` (*table|nil*) : assetPaths (string[], mesh autorisés), distance (m, défaut 0.5, min 0.001), maximumPieces (défaut 2048).
- **renvoie** : table|nil {ids (ordonnés), graph, descriptors, joints (vec3[]), isLoop, capped}.
- **renvoie** : string|nil Message d'erreur si nil.

#### `editor_ezObjectSelect_subtools_fence_anchors.draw(result)`

Dessine avec debugDrawer:drawLine la polyligne des jonctions (et le segment de fermeture si boucle) du résultat de discover.

- `result` (*table|nil*) : Résultat de discover ; ne fait rien si nil.

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `debugDrawer:` `drawLine`
- `obj:` `getClassName`, `getField`, `getID`, `isGlobalBounds`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/anchors.lua`.*
