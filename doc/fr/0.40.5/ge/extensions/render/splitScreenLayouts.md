# `render_splitScreenLayouts`

*Fichier : `lua/ge/extensions/render/splitScreenLayouts.lua` · VM : Game Engine (GE) · 267 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `render_splitScreenLayouts` : `extensions.load("render_splitScreenLayouts")`, puis la globale `render_splitScreenLayouts`

Catalogue des dispositions d'écran partagé, utilisé par render_splitScreen. Il fournit des dispositions prédéfinies pour 2, 3 et 4 joueurs, une disposition automatique en grille pour n'importe quel nombre de joueurs, et charge au chargement les dispositions personnalisées des moddeurs depuis /settings/**/*.splitscreenLayout.json. Les rectangles sont normalisés de 0 à 1 : {x, y, largeur, hauteur}.

## Exemple

```lua
-- fichier /settings/mon_layout.splitscreenLayout.json
-- {"layouts":[{"id":"trois_colonnes","label":"Trois colonnes","playerCount":3,"layout":[[0,0,0.33,1],[0.33,0,0.34,1],[0.67,0,0.33,1]]}]}
local rects = require('ge/extensions/render/splitScreenLayouts').getLayout(3, 'trois_colonnes', 1920, 1080)
```

## Remarques

- Format d'une disposition personnalisée : id (lettres, chiffres, _ . - ; 'automatic' et 'shared' réservés), playerCount (entier >= 1), layout (exactement un rectangle [x, y, w, h] par joueur), label (facultatif, sinon clé de traduction ui.multiseat.layout.<id>). Les rectangles doivent rester dans l'écran (x,y >= 0, w,h > 0, x+w <= 1, y+h <= 1) et peuvent se chevaucher.
- Une disposition invalide ou en double est ignorée avec un avertissement (tag splitScreenLayouts).
- Les fichiers sont lus une seule fois, à la première require du module, dans l'ordre alphabétique des chemins.
- Dispositions prédéfinies : 2 joueurs horizontal et vertical ; 3 joueurs horizontal, vertical, top, left, right, bottom ; 4 joueurs horizontal, vertical, corners.
- La disposition automatique choisit le nombre de lignes dont l'aspect des vues est le plus proche de 16/9 * 1.2.
- Un espace de 2 pixels est ménagé entre les vues (rognage sur les bords internes uniquement).
- Les réglages par nombre de joueurs sont limités à 8 : au-delà, getSettingsPlayerCount renvoie 9 (réglage commun).
- Les fonctions sont des champs de M (function M.getLayout...), pas des locales : ce module n'a pas de hooks. 'shared' (vue unique plein écran) n'apparaît pas dans getOptions.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `render_splitScreenLayouts.getLayout(playerCount, layoutId, screenWidth, screenHeight)` | Renvoie les rectangles de la disposition demandée pour ce nombre de joueurs. 'shared' donne un seul rectangle plein écran ; un identifiant inconnu ou 'automatic' donne la disposition automatique. Les écarts entre vues sont appliqués. | 224 |
| `render_splitScreenLayouts.getOptions(playerCount, screenWidth, screenHeight)` | Liste des choix de disposition offerts à l'utilisateur pour ce nombre de joueurs (sans 'shared'), avec libellé et rectangles. | 240 |
| `render_splitScreenLayouts.getSettingsPlayerCount(playerCount)` | Convertit un nombre de joueurs en numéro de réglage multiseatLayout<N> : valeur entière entre 0 et 8, ou 9 au-delà de 8. | 235 |
| `render_splitScreenLayouts.isShared(layoutId)` | Vrai si l'identifiant est 'shared' (vue unique partagée). | 262 |
| `render_splitScreenLayouts.isValid(playerCount, layoutId)` | Indique si un identifiant de disposition existe pour ce nombre de joueurs ('automatic' et 'shared' sont toujours valides). | 256 |

### Détail des paramètres

#### `render_splitScreenLayouts.getLayout(playerCount, layoutId, screenWidth, screenHeight)`

Renvoie les rectangles de la disposition demandée pour ce nombre de joueurs. 'shared' donne un seul rectangle plein écran ; un identifiant inconnu ou 'automatic' donne la disposition automatique. Les écarts entre vues sont appliqués.

- `playerCount` (*integer*) : Nombre de joueurs.
- `layoutId` (*string*) : 'automatic', 'shared' ou identifiant d'une disposition prédéfinie ou personnalisée.
- `screenWidth` (*number|nil*) : Largeur en pixels (si invalide, un nombre inférieur à 2 est lu comme un rapport d'aspect).
- `screenHeight` (*number|nil*) : Hauteur en pixels.
- **renvoie** : number[][] Liste de rectangles {x, y, w, h} normalisés.

#### `render_splitScreenLayouts.getOptions(playerCount, screenWidth, screenHeight)`

Liste des choix de disposition offerts à l'utilisateur pour ce nombre de joueurs (sans 'shared'), avec libellé et rectangles.

- `playerCount` (*integer*) : Nombre de joueurs.
- `screenWidth` (*number|nil*) : Largeur écran en pixels.
- `screenHeight` (*number|nil*) : Hauteur écran en pixels.
- **renvoie** : table[] Éléments {value, label, layout}.

#### `render_splitScreenLayouts.getSettingsPlayerCount(playerCount)`

Convertit un nombre de joueurs en numéro de réglage multiseatLayout<N> : valeur entière entre 0 et 8, ou 9 au-delà de 8.

- `playerCount` (*number*) : Nombre de joueurs.
- **renvoie** : integer Indice de réglage.

#### `render_splitScreenLayouts.isShared(layoutId)`

Vrai si l'identifiant est 'shared' (vue unique partagée).

- `layoutId` (*string*) : Identifiant.
- **renvoie** : boolean Résultat.

#### `render_splitScreenLayouts.isValid(playerCount, layoutId)`

Indique si un identifiant de disposition existe pour ce nombre de joueurs ('automatic' et 'shared' sont toujours valides).

- `playerCount` (*integer*) : Nombre de joueurs.
- `layoutId` (*string*) : Identifiant.
- **renvoie** : boolean Validité.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/render/splitScreenLayouts.lua`.*
