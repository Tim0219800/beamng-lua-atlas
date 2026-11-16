# `editor_vehicleDetailViewer`

*Fichier : `lua/ge/extensions/editor/vehicleDetailViewer.lua` · VM : Game Engine (GE) · 629 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleDetailViewer` : `extensions.load("editor_vehicleDetailViewer")`, puis la globale `editor_vehicleDetailViewer`

Outil d'éditeur « Vehicle Detail Viewer » (menu Window > Vehicles, aussi F11 > Window > Experimental). Ouvre des fenêtres imgui qui affichent des vues orthographiques du véhicule joueur (Left, Right, Top, Bottom, Front, Back) rendues dans une texture via RenderViewManagerInstance, avec zoom, déplacement par glisser et double-clic de remise à zéro. Chaque vue est calée sur la boîte englobante orientée du véhicule (getSpawnWorldOOBB). Les dispositions peuvent être sauvegardées dans /settings/vehicleDetails/*.vehicleDetailSetting.json (défaut : default.vehicleDetailSetting.json).

## Remarques

- Aucun rendu n'a lieu tant que l'utilisateur n'a pas choisi l'entrée de menu (detailViewerActive) ; quand la dernière fenêtre est fermée, toutes les vues sont détruites.
- Le plan de coupe lointain est fixé à 10 m (farClip) et l'échelle à 200 pixels par mètre.
- Les vues sont recréées à chaque apparition de véhicule (onVehicleSpawned remet `views` à nil) ; seul le véhicule joueur est affiché.
- onSerialize détruit les vues de rendu et convertit les pointeurs imgui en données simples avant rechargement Lua ; onDeserialized les reconvertit.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleDetailViewer.onDeserialized(data)` | Restaure les vues et recrée les pointeurs imgui windowOpen. Aussi utilisé pour charger un fichier de disposition. *(interne)* *(hook)* | 297 |
| `editor_vehicleDetailViewer.onEditorInitialized()` | Ajoute l'entrée de menu 'Vehicle Detail Viewer' (groupe Vehicles) qui active l'outil. *(interne)* *(hook)* | 614 |
| `editor_vehicleDetailViewer.onExtensionLoaded()` | Appelé au chargement de l'extension : affiche un message et liste les fichiers de disposition disponibles. *(interne)* *(hook)* | 600 |
| `editor_vehicleDetailViewer.onExtensionUnloaded()` | Appelé au déchargement : détruit les vues de rendu restantes. *(interne)* *(hook)* | 605 |
| `editor_vehicleDetailViewer.onPreRender(dtReal, dtSim, dtRaw)` | Appelé chaque frame avant le rendu : crée les modèles de vues pour le véhicule joueur, charge la disposition par défaut, dessine chaque fenêtre de vue et déclenche le rendu orthographique ; nettoie quand tout est fermé. *(interne)* *(hook)* | 488 |
| `editor_vehicleDetailViewer.onSerialize()` | Avant rechargement Lua : détruit les vues de rendu et renvoie {views} sans les objets non sérialisables. *(interne)* *(hook)* | 274 |
| `editor_vehicleDetailViewer.onVehicleSpawned(vehicleId)` | Appelé quand un véhicule apparaît : oublie les vues pour les recréer avec le nouveau véhicule. *(interne)* *(hook)* | 595 |

### Détail des paramètres

#### `editor_vehicleDetailViewer.onDeserialized(data)`

Restaure les vues et recrée les pointeurs imgui windowOpen. Aussi utilisé pour charger un fichier de disposition.

- `data` (*table|nil*) : Table de onSerialize ou contenu du fichier de disposition.

#### `editor_vehicleDetailViewer.onPreRender(dtReal, dtSim, dtRaw)`

Appelé chaque frame avant le rendu : crée les modèles de vues pour le véhicule joueur, charge la disposition par défaut, dessine chaque fenêtre de vue et déclenche le rendu orthographique ; nettoie quand tout est fermé.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `editor_vehicleDetailViewer.onSerialize()`

Avant rechargement Lua : détruit les vues de rendu et renvoie {views} sans les objets non sérialisables.

- **renvoie** : table {views = table}

#### `editor_vehicleDetailViewer.onVehicleSpawned(vehicleId)`

Appelé quand un véhicule apparaît : oublie les vues pour les recréer avec le nouveau véhicule.

- `vehicleId` (*integer*) : ID du véhicule.

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `removeFile`
- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawFrustum`, `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleDetailViewer.lua`.*
