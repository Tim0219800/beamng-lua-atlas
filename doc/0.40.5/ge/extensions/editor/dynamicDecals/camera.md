# `editor_dynamicDecals_camera`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/camera.lua` · VM : Game Engine (GE) · 138 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_camera` : `extensions.load("editor_dynamicDecals_camera")`, puis la globale `editor_dynamicDecals_camera`

Section « Camera » de l'outil Dynamic Decals de l'éditeur. Affiche un bouton par preset de caméra (default, front, back, left, right, top) qui bascule sur la caméra orbit du véhicule joueur avec une rotation par défaut donnée. Les presets sont stockés dans la préférence editor `dynamicDecalsTool.camera.presets` (nom -> {x,y,z}) et sont éditables dans la fenêtre des préférences.

## Remarques

- Le logTag du fichier est « editor_dynamicDecals_meshes » (copier-coller, sans effet fonctionnel).
- Le changement de caméra tourne dans un job (core_jobsystem) : commands.setGameCamera, orbit, puis une pause d'une frame avant core_camera.setDefaultRotation / resetCamera. Cela modifie la rotation par défaut de la caméra et elle n'est pas restaurée.
- Dans presetsGui, le renommage d'un preset appelle table.remove(presets, i) sur une table indexée par nom : cela ne retire pas l'ancienne clé (probable bug, l'ancien nom reste dans la table).
- Le bouton de chaque preset réutilise l'identifiant d'ImGui « Generate Materials » (copié d'une autre section).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_camera.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence de l'outil change. Ne fait rien ici. *(interne)* | 119 |
| `editor_dynamicDecals_camera.registerEditorPreferences(prefsRegistry)` | Enregistre la sous-catégorie de préférences `dynamicDecalsTool.camera` avec la table `presets` (valeurs par défaut : default {145,-5,0}, front {180,0,0}, back {0,0,0}, left {-90,0,0}, right {90,0,0}, top {90,-90,0}) et son éditeur graphique. *(interne)* | 103 |
| `editor_dynamicDecals_camera.setup(tool_in)` | Appelé par l'outil dynamicDecalsTool : mémorise l'outil, l'API editor_api_dynamicDecals et le module docs, enregistre la section « Camera » (ordre 125) avec un bouton d'aide, et enregistre la page de documentation. *(interne)* | 123 |

### Détail des paramètres

#### `editor_dynamicDecals_camera.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence de l'outil change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence modifiée.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_camera.registerEditorPreferences(prefsRegistry)`

Enregistre la sous-catégorie de préférences `dynamicDecalsTool.camera` avec la table `presets` (valeurs par défaut : default {145,-5,0}, front {180,0,0}, back {0,0,0}, left {-90,0,0}, right {90,0,0}, top {90,-90,0}) et son éditeur graphique.

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_camera.setup(tool_in)`

Appelé par l'outil dynamicDecalsTool : mémorise l'outil, l'API editor_api_dynamicDecals et le module docs, enregistre la section « Camera » (ordre 125) avec un bouton d'aide, et enregistre la page de documentation.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/camera.lua`.*
