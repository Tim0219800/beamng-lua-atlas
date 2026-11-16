# `editor_roadNetworkExporter`

*Fichier : `lua/ge/extensions/editor/roadNetworkExporter.lua` · VM : Game Engine (GE) · 311 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadNetworkExporter` : `extensions.load("editor_roadNetworkExporter")`, puis la globale `editor_roadNetworkExporter`

Fenêtre d'éditeur « Road Network Import/Exporter » (menu Window > Tech), visible uniquement avec une licence tech (ResearchVerifier.isTechLicenseVerified()). Elle permet d'importer et d'exporter le réseau routier du Road Architect aux formats OpenDRIVE (.xodr), OpenStreetMap (.osm) et SUMO (.nod.xml / .edg.xml), avec des options d'import (placement, décalage vertical, terraformage, domaine d'influence et marge) reprises du Road Architect.

## Remarques

- Sans licence tech, onEditorInitialized ne crée ni fenêtre ni entrée de menu et les autres hooks sortent immédiatement.
- L'import passe par require() des modules editor/roadArchitect/openDriveImport, osmImport et sumoImport (importFromFile(chemin, options)) dans un pcall ; l'erreur éventuelle est affichée dans la fenêtre.
- Les options d'import envoyées sont : placeMode (0 = comme dans le fichier, 1 = X/Y personnalisés, 2 = XY de la caméra), placeX, placeY, offsetToTerrain, verticalOffset, terraform, domainOfInfluence (défaut 30), margin (défaut 1.0).
- L'export peut mettre le jeu en pause temporairement pendant le traitement (avertissement affiché dans la fenêtre).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadNetworkExporter.onEditorActivated()` | Hook appelé quand l'éditeur est activé. Mémorise le TerrainBlock courant (extensions.editor_terrainEditor.getTerrainBlock()). Sans effet sans licence tech. *(interne)* *(hook)* | 43 |
| `editor_roadNetworkExporter.onEditorGui()` | Hook appelé à chaque frame d'interface de l'éditeur. Dessine la fenêtre : options d'import, tableau Import/Export pour OpenDRIVE, OpenStreetMap et SUMO, puis le résultat de l'import (routes importées/ignorées, avertissements). *(interne)* *(hook)* | 241 |
| `editor_roadNetworkExporter.onEditorInitialized()` | Hook de l'éditeur, appelé à l'initialisation. Vérifie la licence tech et, si elle est valide, enregistre la fenêtre (600x600) et l'entrée de menu « Road Network Import/Exporter » dans le groupe Tech. *(interne)* *(hook)* | 36 |

## Appels vers le moteur (C++)

- `FS:` `virtual2Native`
- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadNetworkExporter.lua`.*
