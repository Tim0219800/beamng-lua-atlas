# `scenario_race_marker`

*Fichier : `lua/ge/extensions/scenario/race_marker.lua` · VM : Game Engine (GE) · 135 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_race_marker` : `extensions.load("scenario_race_marker")`, puis la globale `scenario_race_marker`

Gestionnaire des marqueurs 3D de checkpoints d'une course de scénario. Il crée un marqueur par waypoint avec le type choisi (module scenario/raceMarkers/<type>, par défaut sideColumnMarker), les masque ou affiche, règle leur mode (courant, suivant, caché...) et les met à jour à chaque image. Les marqueurs sont masqués en mode photo.

## Remarques

- M.idToMarker est copié à l'export : clearMarkerList réassigne la variable locale idToMarker, donc M.idToMarker ne suit plus la table réellement utilisée après un premier nettoyage.
- Dans setupMarkers, marker:createMarkers() est appelé deux fois par marqueur (une fois dans createRaceMarker, une fois ensuite).
- Les modes passés à setModes sont des noms de mode propres à chaque type de marqueur (voir scenario/raceMarkers/*) ; un waypoint absent de la table reçoit 'hidden'.
- La variable globale photoModeOpen est lue pour masquer les marqueurs.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_race_marker.createRaceMarker(detached, type)` | Crée un marqueur du type donné (ou du type courant par défaut), appelle createMarkers() et, sauf si detached, l'enregistre pour les mises à jour et le masquage. | 29 |
| `scenario_race_marker.drawOnMinimap(td)` | Demande à chaque marqueur qui en est capable (drawOnMinimap) de se dessiner sur la minicarte. | 106 |
| `scenario_race_marker.hide()` | Masque tous les marqueurs gérés. | 17 |
| `scenario_race_marker.init()` | Efface les marqueurs précédents et masque ceux qui restent. *(interne)* | 50 |
| `scenario_race_marker.onClientEndMission()` | Hook de fin de mission : supprime les marqueurs et remet le type de marqueur par défaut. *(interne)* *(hook)* | 115 |
| `scenario_race_marker.render(dt, dtSim)` | À appeler chaque image : masque les marqueurs en mode photo (et les restaure à la sortie), sinon appelle marker:update(dt, dtSim) sur chacun. *(interne)* | 76 |
| `scenario_race_marker.setModes(wpModes)` | Règle le mode de chaque marqueur d'après une table nom de waypoint -> mode ; les noms absents passent en 'hidden'. | 93 |
| `scenario_race_marker.setToCheckpoints(data)` | Replace chaque marqueur sur les données de checkpoint correspondant à son nom. | 98 |
| `scenario_race_marker.setupMarkers(wps, marker)` | Choisit le type de marqueur puis crée un marqueur par waypoint et le place sur son checkpoint (setToCheckpoint). Les anciens marqueurs sont d'abord supprimés. Les marqueurs sont indexés par wp.name. | 57 |
| `scenario_race_marker.show()` | Affiche tous les marqueurs gérés. | 23 |

### Détail des paramètres

#### `scenario_race_marker.createRaceMarker(detached, type)`

Crée un marqueur du type donné (ou du type courant par défaut), appelle createMarkers() et, sauf si detached, l'enregistre pour les mises à jour et le masquage.

- `detached` (*boolean|nil*) : Si true, le marqueur n'est pas géré par ce module (pas de mise à jour automatique).
- `type` (*string|nil*) : Nom du module dans scenario/raceMarkers/, par exemple 'ringMarker'.
- **renvoie** : table Le marqueur créé.

#### `scenario_race_marker.drawOnMinimap(td)`

Demande à chaque marqueur qui en est capable (drawOnMinimap) de se dessiner sur la minicarte.

- `td` (*any*) : Contexte de dessin transmis tel quel aux marqueurs (déduit du code).

#### `scenario_race_marker.render(dt, dtSim)`

À appeler chaque image : masque les marqueurs en mode photo (et les restaure à la sortie), sinon appelle marker:update(dt, dtSim) sur chacun.

- `dt` (*number*) : Durée de l'image réelle (s).
- `dtSim` (*number*) : Durée de simulation (s).

#### `scenario_race_marker.setModes(wpModes)`

Règle le mode de chaque marqueur d'après une table nom de waypoint -> mode ; les noms absents passent en 'hidden'.

- `wpModes` (*table<string, string>*) : Mode par nom de waypoint.

#### `scenario_race_marker.setToCheckpoints(data)`

Replace chaque marqueur sur les données de checkpoint correspondant à son nom.

- `data` (*table<string, table>*) : Données de checkpoint par nom de waypoint.

#### `scenario_race_marker.setupMarkers(wps, marker)`

Choisit le type de marqueur puis crée un marqueur par waypoint et le place sur son checkpoint (setToCheckpoint). Les anciens marqueurs sont d'abord supprimés. Les marqueurs sont indexés par wp.name.

- `wps` (*table[]*) : Liste de waypoints, chacun avec un champ name.
- `marker` (*string|nil*) : Nom du module dans scenario/raceMarkers/ ; nil pour le type par défaut sideColumnMarker.

## Champs

| Champ | Type | Description |
|---|---|---|
| `idToMarker` | table | Table id -> marqueur, copie initiale de la table interne (voir notes). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/race_marker.lua`.*
