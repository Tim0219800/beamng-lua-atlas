# `editor_vehicleEditor_liveEditor_veJBeamPicker`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua` · VM : Game Engine (GE) · 805 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veJBeamPicker` : `extensions.load("editor_vehicleEditor_liveEditor_veJBeamPicker")`, puis la globale `editor_vehicleEditor_liveEditor_veJBeamPicker`

Fenêtre 'JBeam Picker' du Vehicle Editor live : permet de choisir des nœuds et des poutres du véhicule (à la souris, ou par saisie d'ID/nom avec suggestions) et d'en suivre des données en direct. Onglet 'Nodes' / 'Beams' : arbre des éléments choisis, choix des données à afficher (nœud : vitesse, vitesse relative, force ; poutre : longueur, vitesse, force, stress, damping), filtre par type de poutre (NORMALTYPE, BEAM_ANISOTROPIC, BEAM_BOUNDED, BEAM_PRESSURED, BEAM_LBEAM, BEAM_BROKEN, BEAM_HYDRO, BEAM_SUPPORT) et graphes (1000 points). Le picking utilise les modes debug Nœud/Poutre du jeu (Ctrl+M / Ctrl+B).

## Remarques

- Les valeurs de type de poutre (0 à 7) correspondent aux constantes du moteur C++ et ne doivent pas être changées.
- Les données dynamiques (force, vitesse, stress…) sont demandées au VM véhicule via be:queueObjectFastLua et renvoyées dans les tables M.nodeDataFromVELua[id][nom] et M.beamDataFromVELua[id][nom] par obj:queueGameEngineLua ; elles arrivent donc avec un frame de retard et valent 0 avant la première réponse.
- Les graphes avancent d'un échantillon par frame seulement quand la simulation tourne (be:getEnabled()).
- Unités : m, m/s, N.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onDeserialized(data)` | Restaure l'état d'ouverture. *(interne)* *(hook)* | 790 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur : crée les cases à cocher de types de poutres. *(interne)* *(hook)* | 776 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onSerialize()` | Renvoie {windowOpen}. *(interne)* *(hook)* | 784 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onUpdate(dt)` | Appelé chaque frame : dessine la fenêtre à onglets Nodes/Beams et avance l'offset des graphes. *(interne)* *(hook)* | 733 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | Hook de rendu émis par editor_veMain : dessine les éléments choisis et exécute le picking de nœuds ou de poutres selon l'état. *(interne)* *(hook)* | 720 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.open()` | Ouvre la fenêtre. | 772 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnBeamsCallback(beams, scale)` | Callback de la demande de poutres dessinées : mémorise les poutres disponibles et leur échelle (rayon de sélection = 5 x échelle). *(interne)* | 172 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnNodesCallback(nodes, scale)` | Callback de la demande de nœuds dessinés : mémorise la liste des nœuds disponibles pour le picking et leur échelle d'affichage (rayon de sélection = 2 x échelle). *(interne)* | 165 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.onDeserialized(data)`

Restaure l'état d'ouverture.

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.onSerialize()`

Renvoie {windowOpen}.

- **renvoie** : table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.onUpdate(dt)`

Appelé chaque frame : dessine la fenêtre à onglets Nodes/Beams et avance l'offset des graphes.

- `dt` (*number*) : Delta temps.

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`

Hook de rendu émis par editor_veMain : dessine les éléments choisis et exécute le picking de nœuds ou de poutres selon l'état.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnBeamsCallback(beams, scale)`

Callback de la demande de poutres dessinées : mémorise les poutres disponibles et leur échelle (rayon de sélection = 5 x échelle).

- `beams` (*table*) : Poutres disponibles pour le picking.
- `scale` (*number*) : Échelle de dessin des poutres.

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnNodesCallback(nodes, scale)`

Callback de la demande de nœuds dessinés : mémorise la liste des nœuds disponibles pour le picking et leur échelle d'affichage (rayon de sélection = 2 x échelle).

- `nodes` (*table*) : Nœuds disponibles pour le picking.
- `scale` (*number*) : Échelle de dessin des nœuds.

## Champs

| Champ | Type | Description |
|---|---|---|
| `beamDataFromVELua` | table<integer, table<string, any>> | Données de poutres renvoyées par le VM véhicule, indexées par ID de poutre puis nom de donnée (speed, force, stress, damping). |
| `menuEntry` | string | 'JBeam Picker'. |
| `nodeDataFromVELua` | table<integer, table<string, any>> | Données de nœuds renvoyées par le VM véhicule, indexées par ID de nœud puis nom de donnée (ex. force). |

## Appels vers le moteur (C++)

- `be:` `getEnabled`, `queueObjectFastLua`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua`.*
