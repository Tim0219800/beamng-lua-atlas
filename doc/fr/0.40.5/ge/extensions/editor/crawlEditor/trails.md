# `editor_crawlEditor_trails`

*Fichier : `lua/ge/extensions/editor/crawlEditor/trails.lua` · VM : Game Engine (GE) · 603 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/trails")` (fichier sous extensions/ mais pas une extension classique)

Sous-outil « Trails » de l'éditeur Crawl. Le module renvoie un constructeur de classe C. Un trail relie un chemin (pathId), une frontière (boundaryId) et des positions de départ (startingPositionId, startingPositionIdReversed) avec des prefabs, une miniature, un aperçu et des règles. L'outil affiche la liste et le détail dans ImGui (nom, fichier, description, propriétés de mission, références manquantes en couleur, prefabs, règles) et dessine dans la vue 3D la position de départ référencée.

## Remarques

- Le menu contextuel Delete d'un trail supprime aussi son fichier sur disque (trail._filePath) via FS:removeFile.
- Le bouton « Test From Start » lance gameplay_crawl_general.startCrawlFreeroam(trail, véhicule joueur) ; sans véhicule joueur, un avertissement est loggé.
- Les prefabs sont cherchés dans /levels/<niveau>/crawls/*.prefab.json (niveau courant uniquement, non récursif).
- Les modifications marquent le trail comme modifié via editor_crawlEditor.markAsDirty("trail", index).

## Classe `C`

Instance de l'outil. Champs : currentTab ("paths" par défaut), trail (trail édité), snapToTerrain (true), buffers ImGui (name, fileName, description, rules, thumbnail, preview, missionName, pathReversed, isFromMission).

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_trails")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearSelection()` | Ne fait rien (aucune sélection à effacer pour les trails). | 563 |
| `C:draw(mouseInfo)` | Dessine la sphère de zone (vert translucide) et l'icône (rouge) de la position de départ référencée par le trail, avec étiquettes. | 577 |
| `C:drawTrailDetail(trail)` | Dessine le panneau de détail du trail : boutons Goto (caméra vers la position de départ ou le premier nœud du chemin) et Test From Start, champs, sélecteurs de miniature/aperçu, références chemin/frontière/positions, prefabs, règles. | 150 |
| `C:drawTrailsList(allTrails, selection)` | Dessine le bouton « Add Trail » et la liste sélectionnable ; le clic droit propose Delete (efface aussi le fichier du trail). | 95 |
| `C:getNewTrail()` | Crée un trail par défaut (nom « New Trail », références vides, pathReversed false, prefabs vide, règles par défaut, métadonnées version "1.0"). | 534 |
| `C:getPrefabFiles()` | Liste les fichiers *.prefab.json du dossier /levels/<niveau>/crawls/ du niveau courant. | 77 |
| `C:init()` | Initialise l'onglet courant à "paths", aucun trail sélectionné, snapToTerrain = true. | 71 |
| `C:input(mouseInfo)` | Gestion de la souris : vide pour les trails. | 571 |
| `C:setCurrentTab(tab)` | Mémorise l'onglet courant de l'éditeur. | 567 |
| `C:setFields(trail)` | Remplit les buffers ImGui à partir du trail. | 138 |
| `C:setTrail(trailParam)` | Définit le trail en cours d'édition. | 559 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`
- `be:` `getPlayerVehicle`
- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/trails.lua`.*
