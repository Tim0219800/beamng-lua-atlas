# `gameplay_rally_loop_uiColors`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/uiColors.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_uiColors` : `extensions.load("gameplay_rally_loop_uiColors")`, puis la globale `gameplay_rally_loop_uiColors`

Palette de couleurs d'interface pour le rallye : une couleur de thème pour la boucle (loop) et une pour la spéciale (stage), avec une variante en mode NGRC. Les fonctions écrivent la couleur dans le champ theme d'une table cible (données envoyées à l'UI). Une couleur de thème globale peut surcharger toutes les autres.

## Exemple

```lua
local data = {}
gameplay_rally_loop_uiColors.updateForStage(data, false)
-- data.theme == '#1f8fff'
```

## Remarques

- Couleurs : loop #009a1a, loopNgrc #00B890, stage #1f8fff, stageNgrc #1998b8.
- Le override est normalisé : espaces retirés, # ajouté si absent, format #RRGGBB exigé ; sinon il vaut nil (donc désactivé).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_uiColors.getThemeOverride()` | Renvoie l'override normalisé courant. | 30 |
| `gameplay_rally_loop_uiColors.setThemeOverride(hexOrNil)` | Définit (ou efface avec nil / valeur invalide) une couleur de thème qui remplace les couleurs par défaut. | 26 |
| `gameplay_rally_loop_uiColors.updateForLoop(target, isNgrcMode)` | Écrit target.theme avec la couleur de la boucle (ou de l'override s'il existe). Ne fait rien si target est nil. | 43 |
| `gameplay_rally_loop_uiColors.updateForStage(target, isNgrcMode)` | Idem pour la couleur de spéciale. | 47 |

### Détail des paramètres

#### `gameplay_rally_loop_uiColors.getThemeOverride()`

Renvoie l'override normalisé courant.

- **renvoie** : string|nil Couleur '#RRGGBB' ou nil.

#### `gameplay_rally_loop_uiColors.setThemeOverride(hexOrNil)`

Définit (ou efface avec nil / valeur invalide) une couleur de thème qui remplace les couleurs par défaut.

- `hexOrNil` (*string|nil*) : Couleur hexadécimale, avec ou sans '#', 6 chiffres.

#### `gameplay_rally_loop_uiColors.updateForLoop(target, isNgrcMode)`

Écrit target.theme avec la couleur de la boucle (ou de l'override s'il existe). Ne fait rien si target est nil.

- `target` (*table|nil*) : Table à modifier.
- `isNgrcMode` (*boolean*) : true pour la variante NGRC.

#### `gameplay_rally_loop_uiColors.updateForStage(target, isNgrcMode)`

Idem pour la couleur de spéciale.

- `target` (*table|nil*) : Table à modifier.
- `isNgrcMode` (*boolean*) : true pour la variante NGRC.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/uiColors.lua`.*
