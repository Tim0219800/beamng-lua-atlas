# `editor_dynamicDecals_vehicleColorPalette`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua` · VM : Game Engine (GE) · 465 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_vehicleColorPalette` : `extensions.load("editor_dynamicDecals_vehicleColorPalette")`, puis la globale `editor_dynamicDecals_vehicleColorPalette`

Section « Vehicle Color Palette » de l'outil Dynamic Decals : permet de changer les couleurs du véhicule joueur (color, colorPalette0, colorPalette1) et ses données de peinture métallique (metallicPaintData : Metallic, Roughness, Clear Coat, Clear Coat Roughness, via getField/setField) pour voir l'effet sur un design. Enregistre aussi une préférence « palettes » avec 19 palettes de 3 couleurs prédéfinies (BeamNG, Camouflage, Chocolate, Dunes, Fast Car, France, Icy, Italy, Lilac, Midnight, Moss, Neptune, Pastelle, Retro Handheld Console, Sunset, Tape Deck, The 80's, Vintage, Watermelon). Les couleurs du véhicule sont sérialisées avec l'état de l'outil et restaurées après 5 frames.

## Remarques

- Les couleurs sont des triplets RGB 0..1 ; Point4F pour les couleurs du véhicule (le 4e composant garde la valeur existante ou stockée).
- L'interface de gestion des palettes dans les préférences est entièrement commentée dans le code : seule la liste par défaut est enregistrée.
- Si aucun véhicule n'existe, la section affiche « No vehicle ».
- Restauration des couleurs : si le véhicule est absent quand le compteur tombe à 0, un avertissement est loggé et la restauration est retentée à chaque frame.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_vehicleColorPalette.editorPreferenceValueChanged(path, value)` | Hook de préférence vide. *(interne)* | 394 |
| `editor_dynamicDecals_vehicleColorPalette.onDeserialized(data)` | Hook de désérialisation : programme la restauration des couleurs sauvegardées dans 5 frames. *(interne)* *(hook)* | 454 |
| `editor_dynamicDecals_vehicleColorPalette.onGui(guiId)` | Dessine le contenu de la section (couleurs et réglages métalliques du véhicule joueur). Appelé par l'outil dans la section et dans sa fenêtre dédiée. *(interne)* *(hook)* | 66 |
| `editor_dynamicDecals_vehicleColorPalette.onSerialize()` | Hook de sérialisation : renvoie {colors = {{color}, {colorPalette0}, {colorPalette1}}} (4 composantes chacune) du véhicule joueur, ou colors = nil sans véhicule. *(interne)* *(hook)* | 438 |
| `editor_dynamicDecals_vehicleColorPalette.registerEditorPreferences(prefsRegistry)` | Enregistre dans la sous-catégorie dynamicDecalsTool.vehicleColorPalette la préférence palettes (table de {name, values = 3 triplets RGB}). *(interne)* | 322 |
| `editor_dynamicDecals_vehicleColorPalette.setup(tool_in)` | Initialise le module avec l'outil parent : enregistre la section (ordre 120, fermée par défaut, bouton d'aide), la fonction de mise à jour de restauration des couleurs et la page de documentation. *(interne)* | 426 |

### Détail des paramètres

#### `editor_dynamicDecals_vehicleColorPalette.editorPreferenceValueChanged(path, value)`

Hook de préférence vide.

- `path` (*string*) : Chemin de préférence
- `value` (*any*) : Nouvelle valeur

#### `editor_dynamicDecals_vehicleColorPalette.onDeserialized(data)`

Hook de désérialisation : programme la restauration des couleurs sauvegardées dans 5 frames.

- `data` (*table*) : Données renvoyées par onSerialize

#### `editor_dynamicDecals_vehicleColorPalette.onGui(guiId)`

Dessine le contenu de la section (couleurs et réglages métalliques du véhicule joueur). Appelé par l'outil dans la section et dans sa fenêtre dédiée.

- `guiId` (*string*) : Suffixe d'identifiant imgui pour éviter les collisions entre section et fenêtre

#### `editor_dynamicDecals_vehicleColorPalette.onSerialize()`

Hook de sérialisation : renvoie {colors = {{color}, {colorPalette0}, {colorPalette1}}} (4 composantes chacune) du véhicule joueur, ou colors = nil sans véhicule.

- **renvoie** : table {colors = table|nil}

#### `editor_dynamicDecals_vehicleColorPalette.registerEditorPreferences(prefsRegistry)`

Enregistre dans la sous-catégorie dynamicDecalsTool.vehicleColorPalette la préférence palettes (table de {name, values = 3 triplets RGB}).

- `prefsRegistry` (*table*) : Registre de préférences

#### `editor_dynamicDecals_vehicleColorPalette.setup(tool_in)`

Initialise le module avec l'outil parent : enregistre la section (ordre 120, fermée par défaut, bouton d'aide), la fonction de mise à jour de restauration des couleurs et la page de documentation.

- `tool_in` (*table*) : Module editor_dynamicDecalsTool

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua`.*
