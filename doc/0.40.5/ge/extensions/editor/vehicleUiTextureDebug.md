# `editor_vehicleUiTextureDebug`

*Fichier : `lua/ge/extensions/editor/vehicleUiTextureDebug.lua` · VM : Game Engine (GE) · 187 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleUiTextureDebug` : `extensions.load("editor_vehicleUiTextureDebug")`, puis la globale `editor_vehicleUiTextureDebug`

Outil de debug de l'éditeur (menu Window > Vehicles > « Vehicle UI Textures »). Il liste les véhicules, puis les tags de textures UI HTML (écrans CEF dessinés sur les véhicules) actifs du véhicule choisi. Pour un tag, il permet d'ouvrir/fermer la console de la texture, d'exporter la texture en PNG et d'afficher les infos de debug (fps, taille, mode d'usage, URL de départ).

## Remarques

- Méthodes du véhicule utilisées : getActiveUITextureTagNames, getConsoleOpenUITexture, openConsoleUITexture(tag, bool), dumpCEFTexture(tag, fichier), getActiveUITextureDebugInfo(tag).
- Le bouton « Dump texture » écrit /vehicle_ui_<tag>_<date UTC>.png dans le système de fichiers du jeu.
- Bug : le code appelle log("I", logTag, ...) alors que logTag n'est pas défini dans le fichier (nil sauf si une globale logTag existe).

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleUiTextureDebug.onEditorGui()` | Hook de l'éditeur appelé à chaque frame : dessine les listes déroulantes de véhicule et de tag, les boutons console/dump et les informations de debug. *(interne)* *(hook)* | 62 |
| `editor_vehicleUiTextureDebug.onEditorInitialized()` | Hook de l'éditeur appelé à l'initialisation. Récupère ui_imgui, enregistre la fenêtre 'Vehicle UI Textures' (520x420) et ajoute l'entrée de menu dans le groupe 'Vehicles'. *(interne)* *(hook)* | 56 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'ui_imgui'} : extension chargée avant celle-ci. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleUiTextureDebug.lua`.*
