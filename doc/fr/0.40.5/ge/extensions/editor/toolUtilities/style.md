# `editor_toolUtilities_style`

*Fichier : `lua/ge/extensions/editor/toolUtilities/style.lua` · VM : Game Engine (GE) · 409 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_style` : `extensions.load("editor_toolUtilities_style")`, puis la globale `editor_toolUtilities_style`

Réglages de style des outils de splines de l'éditeur : couleurs 3D (curseur, nœuds, jonctions, splines, poignées, fils de prévisualisation) pour le dessin de debug, et palettes de couleurs ImGui par thème. Les thèmes disponibles sont blueRose, vapourStatic, canyonClay, terminalAurora, summerOfLove, deerPark, dreamMachine, headlights, crystal (défaut) et neoIndustrial.

## Exemple

```lua
local cols = require('editor/toolUtilities/style').getImguiCols('crystal')
im.TextColored(cols.dullWhite, 'texte')
```

## Remarques

- getStyle() construit une nouvelle table à chaque appel (color(r,g,b,a) 0-255 pour le rendu, ImVec4 0-1 pour ImGui).
- getImguiCols renvoie la palette 'crystal' pour un thème inconnu ou nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_style.getImguiCols(theme)` | Renvoie la palette de couleurs ImGui du thème demandé. | 379 |
| `editor_toolUtilities_style.getStyle()` | Renvoie les propriétés de style de l'interface : couleurs de curseur, nœuds, jonctions, splines (sélectionnée, estompée, liée), poignées, fils de prévisualisation, et quelques ImVec4 (greenD, blueB, blueD, redB, yellowB). | 14 |

### Détail des paramètres

#### `editor_toolUtilities_style.getImguiCols(theme)`

Renvoie la palette de couleurs ImGui du thème demandé.

- `theme` (*string|nil*) : Nom du thème (voir module) ; 'crystal' par défaut.
- **renvoie** : table Palette de couleurs nommées (ImVec4).

#### `editor_toolUtilities_style.getStyle()`

Renvoie les propriétés de style de l'interface : couleurs de curseur, nœuds, jonctions, splines (sélectionnée, estompée, liée), poignées, fils de prévisualisation, et quelques ImVec4 (greenD, blueB, blueD, redB, yellowB).

- **renvoie** : table Table de couleurs nommées.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/style.lua`.*
