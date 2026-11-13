# `editor_toolUtilities_fenceStyles`

*Fichier : `lua/ge/extensions/editor/toolUtilities/fenceStyles.lua` · VM : Game Engine (GE) · 97 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_fenceStyles` : `extensions.load("editor_toolUtilities_fenceStyles")`, puis la globale `editor_toolUtilities_fenceStyles`

Styles de clôture déclaratifs pour les outils de l'éditeur (clôtures, rambardes). Chaque style donne la hauteur de poteau (qui choisit la forme cuite fence_post_sq_*), la bande de hauteur des lisses, le nombre de lisses et l'espacement par défaut des poteaux. Fournit aussi le calcul des hauteurs de lisses selon un préréglage de disposition.

## Exemple

```lua
local fs = require('editor/toolUtilities/fenceStyles')
local style = fs.get('deck')
local h = fs.railHeights(style, 3, 'pinned', {})
```

## Remarques

- Deux styles existent : 'postrail' (Post & Rail, poteau 1.4 m, 1 à 7 lisses, lisses entre 0.35 et 1.25 m, espacement 2.4 m) et 'deck' (Deck Railing, poteau 1.0 m, 1 à 5 lisses, lisses entre 0.30 et 0.90 m, espacement 1.8 m).
- Hauteurs en mètres (Z du centre de la lisse). Les dispositions reconnues : 'pinned' (défaut), 'even', 'topGroup', 'bottomGroup', 'split'.
- Les fonctions réécrivent le tableau 'out' fourni (table.clear puis remplissage) et le renvoient.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_fenceStyles.get(id)` | Renvoie le style d'id donné, ou le style 'postrail' si l'id est inconnu. | 84 |
| `editor_toolUtilities_fenceStyles.railFractions(count, layout, out, pitchFrac)` | Calcule les positions fractionnaires des lisses dans [0,1] (0 = bas, 1 = haut) pour un préréglage de disposition. Avec une seule lisse, elle est à 0.5. Les dispositions de groupe plafonnent pitchFrac à 0.9/max(1,count-2). | 41 |
| `editor_toolUtilities_fenceStyles.railHeights(style, count, layout, out, railH, postH)` | Calcule les hauteurs Z (m) du centre des lisses pour un style, un nombre de lisses et une disposition. Pour les dispositions de groupe, le haut de la bande est relevé pour que la lisse du haut arrive juste sous le chapeau du poteau. | 71 |

### Détail des paramètres

#### `editor_toolUtilities_fenceStyles.get(id)`

Renvoie le style d'id donné, ou le style 'postrail' si l'id est inconnu.

- `id` (*string*) : Id du style ('postrail' ou 'deck').
- **renvoie** : table Table du style.

#### `editor_toolUtilities_fenceStyles.railFractions(count, layout, out, pitchFrac)`

Calcule les positions fractionnaires des lisses dans [0,1] (0 = bas, 1 = haut) pour un préréglage de disposition. Avec une seule lisse, elle est à 0.5. Les dispositions de groupe plafonnent pitchFrac à 0.9/max(1,count-2).

- `count` (*integer*) : Nombre de lisses (minimum 1).
- `layout` (*string|nil*) : 'pinned' (défaut, réparties de 0 à 1), 'even', 'topGroup', 'bottomGroup' ou 'split'.
- `out` (*table*) : Tableau de sortie, vidé puis rempli.
- `pitchFrac` (*number|nil*) : Pas fractionnaire entre lisses groupées (défaut 0.18).
- **renvoie** : table Le tableau out.

#### `editor_toolUtilities_fenceStyles.railHeights(style, count, layout, out, railH, postH)`

Calcule les hauteurs Z (m) du centre des lisses pour un style, un nombre de lisses et une disposition. Pour les dispositions de groupe, le haut de la bande est relevé pour que la lisse du haut arrive juste sous le chapeau du poteau.

- `style` (*table*) : Style (voir get).
- `count` (*integer|nil*) : Nombre de lisses ; défaut style.railCountDefault.
- `layout` (*string|nil*) : Préréglage de disposition (voir railFractions).
- `out` (*table*) : Tableau de sortie.
- `railH` (*number|nil*) : Hauteur d'une lisse (m) ; sert à calculer le pas des groupes (railH * 1.25).
- `postH` (*number|nil*) : Hauteur du poteau (m) ; sert à relever le haut de bande pour les dispositions de groupe.
- **renvoie** : table Le tableau out, rempli de hauteurs Z.

## Champs

| Champ | Type | Description |
|---|---|---|
| `styleOrder` | string[] | Ordre d'affichage des styles : { 'postrail', 'deck' }. |
| `styles` | table<string, table> | Définitions des styles indexées par id ('postrail', 'deck'). Champs : id, name, postHeight, railCountDefault/Min/Max, railBottom, railTop, spacingDefault. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/fenceStyles.lua`.*
