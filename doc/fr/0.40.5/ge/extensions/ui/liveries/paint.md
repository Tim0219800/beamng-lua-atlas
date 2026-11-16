# `ui_liveries_paint`

*Fichier : `lua/ge/extensions/ui/liveries/paint.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_paint` : `extensions.load("ui_liveries_paint")`, puis la globale `ui_liveries_paint`

Lit et modifie la peinture (couleur RGBA, métallisation, rugosité) d'une couche de l'éditeur de livrées, retrouvée par son uid dans editor_api_dynamicDecals. Il fournit aussi les peintures prédéfinies du modèle de véhicule actuel. Il sert à l'écran de peinture de l'interface et à l'éditeur de décalques.

## Remarques

- Toutes les valeurs venant de l'interface sont normalisées entre 0 et 1 : une valeur hors plage est ramenée par clamp, une valeur non numérique est remplacée par celle de la couche.
- setLayerPaint travaille sur une copie profonde de la couche et appelle setLayer(updatedLayer, true), pour ne pas polluer l'historique de l'API.
- Une couche liée à une palette de couleurs du véhicule (colorPaletteMapId différent de nil) repasse en palette 0 dès qu'on modifie sa peinture ici.
- Les couches fill n'ont ni metallicIntensity ni roughnessIntensity : ces champs restent nil dans getLayerPaint et sont ignorés par setLayerPaint.

**Dépendances (chargées avant) :** `editor_api_dynamicDecals`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_paint.getLayerPaint(layerUid)` | Renvoie la peinture de la couche d'uid donné : layerUid, color {r, g, b, a} (blanc par défaut), metallic, roughness et presets. Renvoie nil, avec un avertissement, si l'uid n'est pas une chaîne ou si la couche n'existe pas. | 59 |
| `ui_liveries_paint.getVehiclePaintPresets()` | Renvoie la liste model.paints du modèle du véhicule du joueur 0 (via core_vehicles.getModel), ou une table vide s'il n'y a pas de véhicule. Partagée avec l'éditeur de décalques. | 12 |
| `ui_liveries_paint.readNormalized(value, fallback)` | Convertit value en nombre et le borne entre 0 et 1 ; renvoie fallback si la conversion échoue. | 21 |
| `ui_liveries_paint.setLayerPaint(layerUid, paint)` | Applique color, metallic et roughness à la couche d'uid donné, via une copie de la couche passée à editor_api_dynamicDecals.setLayer. Renvoie false si la couche est introuvable ou si paint n'est pas une table. | 67 |

### Détail des paramètres

#### `ui_liveries_paint.getLayerPaint(layerUid)`

Renvoie la peinture de la couche d'uid donné : layerUid, color {r, g, b, a} (blanc par défaut), metallic, roughness et presets. Renvoie nil, avec un avertissement, si l'uid n'est pas une chaîne ou si la couche n'existe pas.

- `layerUid` (*string*) : Uid de la couche.
- **renvoie** : table|nil Table de peinture.

#### `ui_liveries_paint.getVehiclePaintPresets()`

Renvoie la liste model.paints du modèle du véhicule du joueur 0 (via core_vehicles.getModel), ou une table vide s'il n'y a pas de véhicule. Partagée avec l'éditeur de décalques.

- **renvoie** : table Peintures prédéfinies du modèle.

#### `ui_liveries_paint.readNormalized(value, fallback)`

Convertit value en nombre et le borne entre 0 et 1 ; renvoie fallback si la conversion échoue.

- `value` (*any*) : Valeur reçue de l'interface.
- `fallback` (*number*) : Valeur renvoyée si value n'est pas numérique.
- **renvoie** : number Valeur dans [0, 1] ou fallback.

#### `ui_liveries_paint.setLayerPaint(layerUid, paint)`

Applique color, metallic et roughness à la couche d'uid donné, via une copie de la couche passée à editor_api_dynamicDecals.setLayer. Renvoie false si la couche est introuvable ou si paint n'est pas une table.

- `layerUid` (*string*) : Uid de la couche.
- `paint` (*table*) : Champs facultatifs color {r, g, b, a}, metallic, roughness, tous normalisés entre 0 et 1.
- **renvoie** : boolean true si la mise à jour a été faite.

## Champs

| Champ | Type | Description |
|---|---|---|
| `EDITABLE_COLOR_PALETTE_MAP_ID` | integer | Vaut 0. C'est le seul mode où une couche affiche sa propre couleur ; tout autre id prend la couleur dans un emplacement de palette du véhicule et ignore celle de la couche. |
| `dependencies` | string[] | Extensions chargées avant celle-ci : editor_api_dynamicDecals. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/paint.lua`.*
