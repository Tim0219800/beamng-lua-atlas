# `editor_dynamicDecals_brushes`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/brushes.lua` · VM : Game Engine (GE) · 638 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_brushes` : `extensions.load("editor_dynamicDecals_brushes")`, puis la globale `editor_dynamicDecals_brushes`

Gestion des brosses (brushes) de l'outil Dynamic Decals : un preset enregistre l'état courant des propriétés de decal (textures color/alpha/metallic/normal/roughness, couleur, dégradé, rotation, échelle, skew, UV, masque alpha, SDF, miroir, intensités, wrap…). Les brosses sont stockées dans /art/dynamicDecals/brushes/brushes.json, listées dans l'onglet « Brushes » du navigateur (ordre 30) et inspectables (Use / Delete / Save). Un moddeur s'en sert pour sauvegarder ou recharger un réglage de decal.

## Remarques

- Le fichier brushes.json est lu à setup s'il existe, sinon la liste est vide (aucun fichier n'est créé avant le premier enregistrement).
- saveBrush sans nom utilise le nom de fichier (sans extension) de la texture couleur courante. Chaque appel ajoute une nouvelle entrée, sans test de doublon.
- Les propriétés SDF (sdfThickness, sdfSoftness, sdfOutline*) ne sont enregistrées que si la texture couleur est compatible SDF (decal.isTexturesSdfCompatible).
- loadBrush applique chaque propriété via getValueOrDefault, qui retombe sur la valeur par défaut de api.propertiesMap pour une valeur absente. Les lignes d'alphaMaskInvert et decalUseGradientColor sont commentées : ces deux propriétés enregistrées ne sont pas restaurées au chargement (et les setters supposés n'existent pas sous ce nom).
- deleteBrush remet à nil le champ id de toutes les brosses avant d'écrire le fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_brushes.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 609 |
| `editor_dynamicDecals_brushes.getBrushes()` | Renvoie la liste des brosses chargées en mémoire. | 599 |
| `editor_dynamicDecals_brushes.inspectorGui(brush)` | Dessine l'inspecteur d'une brosse sélectionnée : boutons Use (loadBrush), Delete et Save (visible seulement si brush.dirty), puis l'aperçu et les propriétés. *(interne)* | 306 |
| `editor_dynamicDecals_brushes.loadBrush(brush)` | Applique à l'API (api.set*) toutes les propriétés d'une brosse : masque alpha, blend mode, couleur, textures, rotation, échelle, skew, dégradé, UV, SDF, etc. | 135 |
| `editor_dynamicDecals_brushes.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 603 |
| `editor_dynamicDecals_brushes.saveBrush(name)` | Crée une brosse à partir de l'état courant de l'API (api.get*), l'ajoute à la liste et écrit brushes.json. | 55 |
| `editor_dynamicDecals_brushes.setup(tool_in)` | Appelé par l'outil : récupère API, browser, selection et layerTypes_decal, charge brushes.json si présent, enregistre l'onglet « Brushes » du navigateur. *(interne)* | 613 |

### Détail des paramètres

#### `editor_dynamicDecals_brushes.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_brushes.getBrushes()`

Renvoie la liste des brosses chargées en mémoire.

- **renvoie** : table[] Liste des brosses (la table interne, pas une copie).

#### `editor_dynamicDecals_brushes.inspectorGui(brush)`

Dessine l'inspecteur d'une brosse sélectionnée : boutons Use (loadBrush), Delete et Save (visible seulement si brush.dirty), puis l'aperçu et les propriétés.

- `brush` (*table*) : Brosse sélectionnée (editor.selection["dynamicDecalBrush"]).

#### `editor_dynamicDecals_brushes.loadBrush(brush)`

Applique à l'API (api.set*) toutes les propriétés d'une brosse : masque alpha, blend mode, couleur, textures, rotation, échelle, skew, dégradé, UV, SDF, etc.

- `brush` (*table*) : Brosse (entrée de brushes.json, voir saveBrush pour les champs).

#### `editor_dynamicDecals_brushes.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_brushes.saveBrush(name)`

Crée une brosse à partir de l'état courant de l'API (api.get*), l'ajoute à la liste et écrit brushes.json.

- `name` (*string|nil*) : Nom de la brosse ; par défaut le nom de la texture couleur.

#### `editor_dynamicDecals_brushes.setup(tool_in)`

Appelé par l'outil : récupère API, browser, selection et layerTypes_decal, charge brushes.json si présent, enregistre l'onglet « Brushes » du navigateur.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/brushes.lua`.*
