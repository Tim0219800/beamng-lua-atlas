# `editor_perfProfiler`

*Fichier : `lua/ge/extensions/editor/perfProfiler.lua` · VM : Game Engine (GE) · 558 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_perfProfiler` : `extensions.load("editor_perfProfiler")`, puis la globale `editor_perfProfiler`

Fenêtre de l'éditeur « CameraProfiler » (menu Debug > Performance Recorder) pour enregistrer et comparer des performances. Elle lance un enregistrement le long d'un chemin de caméra (*.camPath.json du dossier levels/<niveau>/perfRecordingCampaths/) via test_util_fpsCamRecorder et util_stepHandler, charge des fichiers .perfRecording.json, trace des courbes (fps_average, fps_min, polyCount, drawCalls, mémoire…) dans des fenêtres « Profiler Chart N » (10 max) et compare les fichiers dans un tableau. Utile pour mesurer l'impact d'un mod ou d'un réglage graphique.

## Remarques

- Clés de données traçables : fps_instant, fps_average, fps_min, fps_max, fps_waitForGPU, gfx_polyCount, gfx_drawCalls, mem_osPhys*/mem_osVirt*, mem_processPhysUsed/VirtUsed.
- Fichiers de chargement : filtre « .perfRecording.json », dossier /perfRecordings/. Un fichier d'annotation optionnel est cherché dans /levels/<lvl>/perfRecordingCampaths/<nom>.perfAnnotation.json.
- Bug probable : dans loadFile, la ligne « metadataFile = file » utilise une variable « file » jamais définie dans la fonction (nil) ; la fenêtre de métadonnées ne s'ouvre donc pas après un chargement. De plus, globalNames reçoit file.name, champ que loadFile ne renseigne pas (seulement file.meta.name).
- Le bouton « Delete All Vehicles » du popup d'enregistrement supprime réellement tous les véhicules.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_perfProfiler.loadFile(data)` | Charge un fichier de performance JSON (jsonReadFile), complète meta.name (nom de fichier), cherche un fichier d'annotation du niveau, convertit chaque sample en pos=vec3 et rot=quat, marque le fichier actif et l'ajoute à la liste des fichiers comparés. Ne fait rien si filepath est vide. | 426 |
| `editor_perfProfiler.onEditorGui(dt)` | Appelé à chaque frame par l'éditeur. Dessine la fenêtre principale (menu Record / Load / New Chart Window, tableau des fichiers avec case, couleur, nom), recalcule couleurs et graphiques si nécessaire, puis les graphiques, le tableau comparateur, la fenêtre de métadonnées et le popup d'enregistrement. *(interne)* *(hook)* | 461 |
| `editor_perfProfiler.onEditorInitialized()` | Enregistre la fenêtre CameraProfiler (500x500) et l'entrée de menu « Performance Recorder » (groupe Debug). *(interne)* *(hook)* | 549 |
| `editor_perfProfiler.show()` | Affiche la fenêtre CameraProfiler (editor.showWindow). | 545 |

### Détail des paramètres

#### `editor_perfProfiler.loadFile(data)`

Charge un fichier de performance JSON (jsonReadFile), complète meta.name (nom de fichier), cherche un fichier d'annotation du niveau, convertit chaque sample en pos=vec3 et rot=quat, marque le fichier actif et l'ajoute à la liste des fichiers comparés. Ne fait rien si filepath est vide.

- `data` (*table*) : Table de retour du dialogue de fichier ; seul data.filepath (chemin du .perfRecording.json) est lu.

#### `editor_perfProfiler.onEditorGui(dt)`

Appelé à chaque frame par l'éditeur. Dessine la fenêtre principale (menu Record / Load / New Chart Window, tableau des fichiers avec case, couleur, nom), recalcule couleurs et graphiques si nécessaire, puis les graphiques, le tableau comparateur, la fenêtre de métadonnées et le popup d'enregistrement.

- `dt` (*number*) : Delta temps passé aux graphiques.

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `obj:` `delete`

**Charge les extensions :** `test_util_camPosDataToBucket`, `test_util_fpsCamRecorder`, `util_stepHandler`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/perfProfiler.lua`.*
