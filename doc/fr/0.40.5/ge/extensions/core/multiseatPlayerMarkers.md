# `core_multiseatPlayerMarkers`

*Fichier : `lua/ge/extensions/core/multiseatPlayerMarkers.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_multiseatPlayerMarkers` : `extensions.load("core_multiseatPlayerMarkers")`, puis la globale `core_multiseatPlayerMarkers`

Extension GE `core_multiseatPlayerMarkers` : lit et écrit le réglage 'multiseatTags' qui contrôle l'affichage des marqueurs (étiquettes) de joueurs en multi-joueur local. Trois modes : 'always', 'smart' (défaut) et 'never'. Les anciennes valeurs booléennes sont converties (true devient 'smart', false devient 'never').

## Exemple

```lua
local mode = core_multiseatPlayerMarkers.getMode()  -- 'smart' par défaut
core_multiseatPlayerMarkers.setMode('always')
```

## Remarques

- getMode réécrit le réglage dans settings si la valeur stockée n'était pas déjà normalisée (migration des booléens).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_multiseatPlayerMarkers.getMode()` | Renvoie le mode courant du réglage multiseatTags (défaut 'smart'), en le normalisant et en corrigeant le réglage si besoin. | 19 |
| `core_multiseatPlayerMarkers.isEnabled(mode)` | Indique si les marqueurs sont actifs, c'est-à-dire si le mode normalisé n'est pas 'never'. | 32 |
| `core_multiseatPlayerMarkers.normalize(mode)` | Convertit une valeur de réglage en mode valide : true devient 'smart', false devient 'never', 'always'/'smart'/'never' restent, toute autre valeur devient 'smart'. | 13 |
| `core_multiseatPlayerMarkers.setMode(mode)` | Normalise puis enregistre le mode dans le réglage multiseatTags. | 26 |

### Détail des paramètres

#### `core_multiseatPlayerMarkers.getMode()`

Renvoie le mode courant du réglage multiseatTags (défaut 'smart'), en le normalisant et en corrigeant le réglage si besoin.

- **renvoie** : string 'always', 'smart' ou 'never'.

#### `core_multiseatPlayerMarkers.isEnabled(mode)`

Indique si les marqueurs sont actifs, c'est-à-dire si le mode normalisé n'est pas 'never'.

- `mode` (*string|boolean|nil*) : Mode à tester.
- **renvoie** : boolean true sauf pour 'never'.

#### `core_multiseatPlayerMarkers.normalize(mode)`

Convertit une valeur de réglage en mode valide : true devient 'smart', false devient 'never', 'always'/'smart'/'never' restent, toute autre valeur devient 'smart'.

- `mode` (*string|boolean|nil*) : Valeur à normaliser.
- **renvoie** : string 'always', 'smart' ou 'never'.

#### `core_multiseatPlayerMarkers.setMode(mode)`

Normalise puis enregistre le mode dans le réglage multiseatTags.

- `mode` (*string|boolean|nil*) : Mode souhaité.
- **renvoie** : string Le mode réellement enregistré.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/multiseatPlayerMarkers.lua`.*
