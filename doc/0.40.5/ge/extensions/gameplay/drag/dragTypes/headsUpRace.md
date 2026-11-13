# `gameplay_drag_dragTypes_headsUpRace`

*Fichier : `lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua` · VM : Game Engine (GE) · 174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_dragTypes_headsUpRace` : `extensions.load("gameplay_drag_dragTypes_headsUpRace")`, puis la globale `gameplay_drag_dragTypes_headsUpRace`

Type de course « heads-up » : départ simultané sans handicap, le meilleur temps du timer important gagne. Chargée par gameplay_drag_core quand dragType vaut 'headsUpRace'. Chaque frame, onUpdate fait avancer chaque racer local (updateRacer puis la fonction de phase de phaseHandlers : stage, countdown, race, stop, emergencyStop) et déclenche les changements de phase de groupe selon le mode (solo, hôte MP, client MP). startActivity met tous les dials à 0.

## Remarques

- Classement (generateWinData) : tri par temps croissant du timer important (getImportantTimerValueForWin) ; les disqualifiés sont derniers (joueurs d'abord, puis couloir, puis vehId).
- Contrairement à bracketRace, startActivity force dial = 0 pour tous : pas de décalage de départ.
- Les racers distants en MP (isLocalRacer == false) ne sont pas simulés localement ; en MP le passage staging vers décompte est géré par l'hôte (checkTimerDrift) via le réseau.
- Une phase dont le nom ne correspond à aucune fonction de phaseHandlers produit une erreur de log et est ignorée.
- L'activité se termine (dragData.isCompleted = true) quand tous les racers locaux sont finis.

**Dépendances (chargées avant) :** `gameplay_drag_core`, `gameplay_drag_phaseHandlers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_dragTypes_headsUpRace.generateWinData(dragData)` | Construit la liste classée des résultats : chaque entrée contient vehId, lane, time, isPlayable, disqualified. Le plus petit temps gagne, les disqualifiés sont derniers. | 134 |
| `gameplay_drag_dragTypes_headsUpRace.onExtensionLoaded()` | Hook de chargement : récupère les références vers core et phaseHandlers et remet l'activité à zéro. *(interne)* *(hook)* | 36 |
| `gameplay_drag_dragTypes_headsUpRace.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame, actif uniquement quand l'activité est démarrée : simule les racers locaux, appelle la fonction de leur phase, change de phase quand elle est complétée (sans dépendance), marque la course terminée et gère l'avancement groupé des phases selon solo/hôte/client. *(interne)* *(hook)* | 61 |
| `gameplay_drag_dragTypes_headsUpRace.resetDragRace()` | Arrête l'activité (hasActivityStarted = false). | 42 |
| `gameplay_drag_dragTypes_headsUpRace.startActivity()` | Démarre l'activité : dragData.isStarted = true et fixe un délai de dial de 0 pour chaque racer (phaseHandlers.setDialsData). Appelée par core.startDragRaceActivity. | 46 |

### Détail des paramètres

#### `gameplay_drag_dragTypes_headsUpRace.generateWinData(dragData)`

Construit la liste classée des résultats : chaque entrée contient vehId, lane, time, isPlayable, disqualified. Le plus petit temps gagne, les disqualifiés sont derniers.

- `dragData` (*table*) : Données de course avec racers.
- **renvoie** : table[] Liste des résultats, {} si pas de racers.

#### `gameplay_drag_dragTypes_headsUpRace.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame, actif uniquement quand l'activité est démarrée : simule les racers locaux, appelle la fonction de leur phase, change de phase quand elle est complétée (sans dépendance), marque la course terminée et gère l'avancement groupé des phases selon solo/hôte/client.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta brut (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_core, gameplay_drag_phaseHandlers. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua`.*
