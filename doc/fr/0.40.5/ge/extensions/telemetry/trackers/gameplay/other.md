# `telemetry_trackers_gameplay_other`

*Fichier : `lua/ge/extensions/telemetry/trackers/gameplay/other.lua` · VM : Game Engine (GE) · 79 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_gameplay_other` : `extensions.load("telemetry_trackers_gameplay_other")`, puis la globale `telemetry_trackers_gameplay_other`

Suiveur de télémétrie des petites fonctionnalités de gameplay qui n'ont pas leur propre suiveur : le constructeur de pistes (activité « trackBuilder ») et le taxi (évènement « taxiCalled » et activité « taxiRide »). La durée d'une session ou d'une course est portée par l'activité.

## Remarques

- La fenêtre du constructeur de pistes passe toutes les ouvertures/fermetures par un seul appel, qui répète aussi l'état courant : l'activité est donc appariée sur l'état interne du suiveur, pas sur chaque appel.
- onExit et onExtensionUnloaded (même fonction) ferment les deux activités ; une course de taxi interrompue est terminée avec reason = « gameExit ».
- Issues de course de taxi (onTaxiRideEnded) : reason vaut exited ou trafficStopped ; phase indique où en était la course (arriving = le taxi s'était arrêté pour le joueur) ; les distances sont en mètres.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_gameplay_other.onExit()` | Hook appelé à la fermeture du jeu : ferme les activités ouvertes. *(interne)* *(hook)* | 59 |
| `telemetry_trackers_gameplay_other.onExtensionLoaded()` | Hook appelé au chargement : déchargement manuel. *(interne)* *(hook)* | 64 |
| `telemetry_trackers_gameplay_other.onExtensionUnloaded()` | Hook appelé au déchargement : un rechargement Lua détruit les suiveurs sans onExit, donc les activités sont fermées ici aussi. *(interne)* *(hook)* | 59 |
| `telemetry_trackers_gameplay_other.onTaxiCalled(result)` | Hook appelé quand le joueur appelle un taxi : émet taxiCalled avec le résultat. *(interne)* *(hook)* | 34 |
| `telemetry_trackers_gameplay_other.onTaxiRideEnded(data)` | Hook appelé à la fin d'une course : termine l'activité taxiRide avec les données reçues. *(interne)* *(hook)* | 53 |
| `telemetry_trackers_gameplay_other.onTaxiRideStarted(called)` | Hook appelé au début d'une course : démarre l'activité taxiRide (appelé ou non, mode carrière ou non, niveau). *(interne)* *(hook)* | 42 |
| `telemetry_trackers_gameplay_other.onTrackBuilderWindowToggled(open)` | Hook appelé à l'ouverture/fermeture de la fenêtre du constructeur de pistes : démarre ou termine l'activité trackBuilder (avec le niveau courant). *(interne)* *(hook)* | 20 |

### Détail des paramètres

#### `telemetry_trackers_gameplay_other.onTaxiCalled(result)`

Hook appelé quand le joueur appelle un taxi : émet taxiCalled avec le résultat.

- `result` (*string*) : dispatched, noTaxiAvailable ou tooFarFromRoad.

#### `telemetry_trackers_gameplay_other.onTaxiRideEnded(data)`

Hook appelé à la fin d'une course : termine l'activité taxiRide avec les données reçues.

- `data` (*table*) : {reason, phase, distances…}

#### `telemetry_trackers_gameplay_other.onTaxiRideStarted(called)`

Hook appelé au début d'une course : démarre l'activité taxiRide (appelé ou non, mode carrière ou non, niveau).

- `called` (*boolean*) : false pour un taxi hélé au bord de la route.

#### `telemetry_trackers_gameplay_other.onTrackBuilderWindowToggled(open)`

Hook appelé à l'ouverture/fermeture de la fenêtre du constructeur de pistes : démarre ou termine l'activité trackBuilder (avec le niveau courant).

- `open` (*boolean*) : true si la fenêtre est ouverte.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/gameplay/other.lua`.*
