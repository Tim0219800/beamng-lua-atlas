# `editor_dynamicDecals_settings`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/settings.lua` · VM : Game Engine (GE) · 263 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_settings` : `extensions.load("editor_dynamicDecals_settings")`, puis la globale `editor_dynamicDecals_settings`

Section « Settings » (ordre 1040) de l'outil Dynamic Decals. Permet d'activer/désactiver l'API de decals, de choisir la position du curseur (UV) ou la souris, la couche UV (0 ou 1), les matériaux et les meshes du véhicule joueur qui reçoivent les decals, et la résolution des textures. Maintient la table nom de matériau <-> indice utilisée par les autres modules.

## Remarques

- Changer la couche UV ou la résolution de texture reprojette tous les calques (peut être long).
- updateMaterials ne fait rien si l'API n'est pas définie ou s'il n'y a pas de véhicule joueur.
- getUsedMaterialNames dépend du dernier updateMaterials : sans mise à jour, des noms peuvent être nil.
- À setup, la liste des meshes est récupérée dans un job retardé d'une frame (« sinon les noms ne sont pas prêts ») et stockée dans shapeMeshes, variable qui n'est pas relue ensuite : sectionGui rappelle api.getShapeMeshes() directement.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_settings.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 204 |
| `editor_dynamicDecals_settings.getUsedMaterialNames()` | Renvoie les noms des matériaux actuellement activés (indices d'api.getMaterialIndices()). | 246 |
| `editor_dynamicDecals_settings.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 198 |
| `editor_dynamicDecals_settings.setup(tool_in)` | Appelé par l'outil : prépare les listes (couches UV, résolutions), initialise les indices de résolution depuis l'API si elle est prête, met à jour les matériaux, lance le job de lecture des meshes et enregistre la section « Settings ». *(interne)* | 213 |
| `editor_dynamicDecals_settings.updateMaterials()` | Relit api.getShapeMaterialNames() pour le véhicule joueur et reconstruit les tables nom->indice et indice->nom. | 28 |

### Détail des paramètres

#### `editor_dynamicDecals_settings.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_settings.getUsedMaterialNames()`

Renvoie les noms des matériaux actuellement activés (indices d'api.getMaterialIndices()).

- **renvoie** : string[] Liste de noms de matériaux.

#### `editor_dynamicDecals_settings.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_settings.setup(tool_in)`

Appelé par l'outil : prépare les listes (couches UV, résolutions), initialise les indices de résolution depuis l'API si elle est prête, met à jour les matériaux, lance le job de lecture des meshes et enregistre la section « Settings ».

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/settings.lua`.*
