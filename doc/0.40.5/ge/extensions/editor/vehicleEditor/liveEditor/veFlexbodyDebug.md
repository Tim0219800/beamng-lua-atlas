# `editor_vehicleEditor_liveEditor_veFlexbodyDebug`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua` · VM : Game Engine (GE) · 1171 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veFlexbodyDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veFlexbodyDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veFlexbodyDebug`

Fenêtre 'Flexbody Debug' du Vehicle Editor live, pour diagnostiquer les flexbodies (meshes déformables) du véhicule. Onglet 'Single Flexmesh' : choisir un flexbody (combo trié, favoris), régler la visibilité du mesh, afficher le flexbody choisi, picker un nœud ou un sommet (vertex) à la souris dans un rayon 'Max Dist from Cursor' (0 à 10 m) et visualiser leurs relations. Onglet 'All Flexmeshes' : trouver les sommets sans nœud proche et (mode expert) les sommets aux coordonnées hors limites. Dépend de editor_veMain.

## Remarques

- Les réglages par véhicule (favoris) sont sauvegardés dans /settings/editor/flexbodyDebug_settings.json, indexés par nom de fichier JBeam.
- L'état est conservé par ID de véhicule (copie profonde de vehData) ; onVehicleSpawned supprime l'état du véhicule réapparu pour qu'il soit reconstruit.
- Modes internes : défaut, picking nœud, nœud pickés, picking vertex, vertex pickés, affichage des sommets sans nœuds proches.
- La recherche des sommets sans nœuds proches active vehicle:setFlexmeshDebugMode(true) et parcourt tous les flexbodies : peut être lente sur un gros véhicule.
- Le dessin utilise debugDrawer (drawLine, drawSphere, drawTextAdvanced) dans le hook onVehicleEditorRenderJBeams.

**Dépendances (chargées avant) :** `editor_veMain`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onDeserialized(data)` | Restaure l'état d'ouverture. *(interne)* *(hook)* | 1157 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onSerialize()` | Renvoie {windowOpen}. *(interne)* *(hook)* | 1151 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onUpdate(dt)` | Appelé chaque frame : initialise l'état du véhicule, dessine la fenêtre à onglets et les fenêtres annexes (sommets hors limites, sommets sans nœuds). *(interne)* *(hook)* | 1108 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | Hook de rendu émis par editor_veMain : dessine le flexbody sélectionné et exécute le picking de nœud/sommet selon le mode courant. *(interne)* *(hook)* | 622 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSpawned(id)` | Quand un véhicule apparaît, oublie ses données mémorisées. *(interne)* *(hook)* | 1143 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSwitched(oldVehicle, newVehicle, player)` | Au changement de véhicule, bascule vers l'état (ou crée l'état) du nouveau véhicule. *(interne)* *(hook)* | 1139 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.open()` | Ouvre la fenêtre. | 1147 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onDeserialized(data)`

Restaure l'état d'ouverture.

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onSerialize()`

Renvoie {windowOpen}.

- **renvoie** : table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onUpdate(dt)`

Appelé chaque frame : initialise l'état du véhicule, dessine la fenêtre à onglets et les fenêtres annexes (sommets hors limites, sommets sans nœuds).

- `dt` (*number*) : Delta temps.

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`

Hook de rendu émis par editor_veMain : dessine le flexbody sélectionné et exécute le picking de nœud/sommet selon le mode courant.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSpawned(id)`

Quand un véhicule apparaît, oublie ses données mémorisées.

- `id` (*integer*) : ID du véhicule.

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSwitched(oldVehicle, newVehicle, player)`

Au changement de véhicule, bascule vers l'état (ou crée l'état) du nouveau véhicule.

- `oldVehicle` (*integer*) : ID de l'ancien véhicule.
- `newVehicle` (*integer*) : ID du nouveau véhicule.
- `player` (*integer*) : Index du joueur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'editor_veMain'}. |
| `menuEntry` | string | 'Flexbody Debug'. |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua`.*
