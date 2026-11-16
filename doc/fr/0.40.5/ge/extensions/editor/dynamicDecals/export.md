# `editor_dynamicDecals_export`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/export.lua` · VM : Game Engine (GE) · 219 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_export` : `extensions.load("editor_dynamicDecals_export")`, puis la globale `editor_dynamicDecals_export`

Section « Export » de l'outil Dynamic Decals. Deux blocs : « Export Skin » (nom du véhicule du joueur + nom de skin, appelle api.exportSkin pour générer textures, matériau et JBeam) et « Export Textures » (nom, dossier, par défaut /art/dynamicDecals/export/textures, puis api.exportTextures en PNG). Affiche les chemins de sortie et avertit si un fichier existe déjà.

## Remarques

- Les fichiers exportés pour les textures sont <dossier>/<nom>_color, _metallic, _roughness, _colorPalette en .png ; _normal est désactivé.
- Le format DDS est désactivé : exportTextures force « png » quel que soit le format passé.
- Les espaces du nom de skin / d'export sont remplacés par « _ ».
- Le nom de véhicule est lu depuis getPlayerVehicle(0).jbeam et le champ est en lecture seule ; si aucun véhicule n'existe, la dernière valeur (vide au départ) est conservée.
- La valeur par défaut skinExport_Vehicle (« vivace ») n'est pas utilisée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_export.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 191 |
| `editor_dynamicDecals_export.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 185 |
| `editor_dynamicDecals_export.setup(tool_in)` | Appelé par l'outil : récupère l'API et docs, prépare la liste des formats (dds, png) pour ImGui, calcule les chemins d'export, enregistre la section « Export » (ordre 25) et sa page de documentation. *(interne)* | 196 |

### Détail des paramètres

#### `editor_dynamicDecals_export.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_export.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_export.setup(tool_in)`

Appelé par l'outil : récupère l'API et docs, prépare la liste des formats (dds, png) pour ImGui, calcule les chemins d'export, enregistre la section « Export » (ordre 25) et sa page de documentation.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/export.lua`.*
