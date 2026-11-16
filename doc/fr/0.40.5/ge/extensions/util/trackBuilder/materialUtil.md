# `util_trackBuilder_materialUtil`

*Fichier : `lua/ge/extensions/util/trackBuilder/materialUtil.lua` · VM : Game Engine (GE) · 455 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_materialUtil` : `extensions.load("util_trackBuilder_materialUtil")`, puis la globale `util_trackBuilder_materialUtil`

Gère les huit jeux de matériaux (lettres A à H) du Track Builder. Chaque lettre correspond à deux matériaux de la scène, 'track_editor_<lettre>_center' et 'track_editor_<lettre>_border'. Le module lit et écrit leurs couleurs, textures (base, specular, normal, décalques centre/bordure), l'éclat (glow/emissive) et le type de sol (groundtype) ; il sait aussi revenir aux valeurs d'origine et ne renvoyer que les valeurs différentes des défauts.

## Remarques

- Un matériau est une table avec : baseCenterColor, baseBorderColor, centerColor, borderColor (tableaux {r,g,b,a} de 0 à 1), baseTexture, baseTextureN, baseTextureS, centerTexture, borderTexture, centerGlow, borderGlow (booléens), groundtype (ASPHALT par défaut).
- Les matériaux de la scène sont retrouvés par scenetree.findObject ; les fonctions échouent si 'track_editor_X_center' ou '_border' n'existent pas.
- loadMaterial (local) relit l'état réel depuis les objets matériaux sauf si skipSet est vrai, et utilise editor.texObj : cela suppose l'éditeur chargé.
- Bug : M.loadMaterials est exporté mais loadMaterials n'est pas défini dans le fichier (l'appel est commenté), donc le champ vaut nil.
- resetMaterialsToDefault(letter) appelle dump() deux fois (traces de débogage laissées dans le code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_materialUtil.getMaterials()` | Relit les 8 matériaux depuis la scène et renvoie, par lettre, uniquement les valeurs qui diffèrent des valeurs d'origine (removeDefaults). | 437 |
| `util_trackBuilder_materialUtil.resetMaterialsToDefault(letter)` | Remet les matériaux aux valeurs d'origine : tous si letter est nil, sinon seulement cette lettre. | 426 |
| `util_trackBuilder_materialUtil.setMaterials(materials, skipSet)` | Applique plusieurs matériaux : complète chaque entrée avec les valeurs d'origine manquantes (fillDefaults) puis appelle setSingleMaterial. Sans argument, ne fait rien. | 395 |
| `util_trackBuilder_materialUtil.setSingleMaterial(letter, material, skipSet)` | Applique un matériau à la lettre donnée : textures, couleurs, glow, groundtype, puis flush et reload des matériaux centre et bordure ; met à jour currentMaterials. | 402 |

### Détail des paramètres

#### `util_trackBuilder_materialUtil.getMaterials()`

Relit les 8 matériaux depuis la scène et renvoie, par lettre, uniquement les valeurs qui diffèrent des valeurs d'origine (removeDefaults).

- **renvoie** : table<string, table> Matériaux allégés, indexés par lettre.

#### `util_trackBuilder_materialUtil.resetMaterialsToDefault(letter)`

Remet les matériaux aux valeurs d'origine : tous si letter est nil, sinon seulement cette lettre.

- `letter` (*string|nil*) : Lettre 'A' à 'H', ou nil pour tous.

#### `util_trackBuilder_materialUtil.setMaterials(materials, skipSet)`

Applique plusieurs matériaux : complète chaque entrée avec les valeurs d'origine manquantes (fillDefaults) puis appelle setSingleMaterial. Sans argument, ne fait rien.

- `materials` (*table<string, table>|nil*) : Matériaux indexés par lettre.
- `skipSet` (*boolean|nil*) : Si vrai, ne relit pas l'état courant des objets de la scène avant d'appliquer.

#### `util_trackBuilder_materialUtil.setSingleMaterial(letter, material, skipSet)`

Applique un matériau à la lettre donnée : textures, couleurs, glow, groundtype, puis flush et reload des matériaux centre et bordure ; met à jour currentMaterials.

- `letter` (*string*) : Lettre 'A' à 'H'.
- `material` (*table*) : Table de matériau complète (voir module).
- `skipSet` (*boolean|nil*) : Voir setMaterials.

## Champs

| Champ | Type | Description |
|---|---|---|
| `currentMaterials` | table<string, table> | État courant des matériaux, indexé par lettre (A à H). |
| `loadMaterials` | nil | Toujours nil : référence à une fonction non définie (bug). ⚠ référence `loadMaterials` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/materialUtil.lua`.*
