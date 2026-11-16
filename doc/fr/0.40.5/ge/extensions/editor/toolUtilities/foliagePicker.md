# `editor_toolUtilities_foliagePicker`

*Fichier : `lua/ge/extensions/editor/toolUtilities/foliagePicker.lua` · VM : Game Engine (GE) · 150 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_foliagePicker` : `extensions.load("editor_toolUtilities_foliagePicker")`, puis la globale `editor_toolUtilities_foliagePicker`

Sélecteur imgui partagé d'espèces (ForestItemData du niveau) pour les outils de végétation de l'éditeur. Affiche une liste à cocher avec un curseur de poids par espèce cochée, plus des boutons (tout cocher, tout décocher, rescanner). Il lit et écrit les tables target.species et target.speciesWeights.

## Exemple

```lua
local picker = require('editor/toolUtilities/foliagePicker')
-- dans le dessin imgui d'un outil :
picker.draw(zone, {id = 'ts', onBeginEdit = snap, onCommit = commit, onChange = markDirty})
```

## Remarques

- La liste d'espèces est mise en cache et partagée entre outils ; elle est scannée au premier usage (liste vide = rescan) via foliageScatter.listForestItemData.
- Si aucune espèce n'est cochée, l'interface affiche que rien ne sera planté.
- L'option opts.height est documentée comme valant 150 par défaut, mais le code utilise la constante LIST_H = 180.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_foliagePicker.draw(target, opts)` | Dessine le sélecteur pour la cible : liste à cocher, curseurs de poids (0 à 1) et boutons tout cocher / tout décocher / rescanner. À appeler à chaque frame depuis le code imgui d'un outil. | 53 |
| `editor_toolUtilities_foliagePicker.getList()` | Renvoie la liste d'espèces en cache, en la scannant si elle est vide. | 32 |
| `editor_toolUtilities_foliagePicker.refresh()` | Rescanne les ForestItemData du niveau et remplit le cache partagé. | 26 |
| `editor_toolUtilities_foliagePicker.setTicked(target, nm, on)` | Coche une espèce (avec le poids par défaut 1.0 si elle n'en a pas) ou la décoche. | 38 |

### Détail des paramètres

#### `editor_toolUtilities_foliagePicker.draw(target, opts)`

Dessine le sélecteur pour la cible : liste à cocher, curseurs de poids (0 à 1) et boutons tout cocher / tout décocher / rescanner. À appeler à chaque frame depuis le code imgui d'un outil.

- `target` (*table*) : Cible avec les tables .species et .speciesWeights.
- `opts` (*table*) : id (obligatoire, suffixe d'id imgui unique), height (px), onBeginEdit() -> jeton d'annulation, onCommit(label, jeton) pour l'historique, onChange() pour marquer l'état modifié.

#### `editor_toolUtilities_foliagePicker.getList()`

Renvoie la liste d'espèces en cache, en la scannant si elle est vide.

- **renvoie** : string[] Noms des ForestItemData du niveau.

#### `editor_toolUtilities_foliagePicker.refresh()`

Rescanne les ForestItemData du niveau et remplit le cache partagé.

- **renvoie** : string[] Liste des noms d'espèces.

#### `editor_toolUtilities_foliagePicker.setTicked(target, nm, on)`

Coche une espèce (avec le poids par défaut 1.0 si elle n'en a pas) ou la décoche.

- `target` (*table*) : Cible avec les tables species et speciesWeights.
- `nm` (*string*) : Nom de l'espèce.
- `on` (*boolean*) : true pour cocher, false pour décocher.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/foliagePicker.lua`.*
