# `gameplay_drag_dragTypes_bracketRace`

*Fichier : `lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua` · VM : Game Engine (GE) · 188 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_dragTypes_bracketRace` : `extensions.load("gameplay_drag_dragTypes_bracketRace")`, puis la globale `gameplay_drag_dragTypes_bracketRace`

Type de course « bracket race » : chaque pilote annonce un dial (temps visé) et gagne en s'en approchant sans le battre. Chargée par gameplay_drag_core quand dragType vaut 'bracketRace'. Chaque frame, onUpdate fait avancer chaque racer local (updateRacer puis la fonction de phase de phaseHandlers nommée comme la phase : stage, countdown, race, stop, emergencyStop), puis déclenche les changements de phase de groupe selon le mode (solo, hôte MP, client MP). startActivity règle les délais de départ d'après les dials (setDialsData).

## Remarques

- Classement (generateWinData) : d'abord ceux qui ont fini plus lentement que leur dial (dialDiff >= 0, du plus petit écart au plus grand), puis ceux qui ont fait mieux que leur dial (« breakout », dialDiff < 0, du plus petit écart absolu), puis les disqualifiés ou sans dial.
- Un dial <= 0 est considéré comme non défini (cas d'un pilote MP arrivé en retard) : dialNotSet = true, dialDiff = 0, classé avec les disqualifiés.
- Les racers distants en MP (isLocalRacer == false) ne sont pas simulés localement ; les clients MP attendent le broadcast de l'hôte pour les transitions de phase.
- Une phase dont le nom ne correspond à aucune fonction de phaseHandlers produit une erreur de log et est ignorée.
- L'activité se termine (dragData.isCompleted = true) quand tous les racers locaux sont finis.
- Les autres modules appellent seulement startActivity, resetDragRace et generateWinData (via core.getExtension).

**Dépendances (chargées avant) :** `gameplay_drag_core`, `gameplay_drag_phaseHandlers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_dragTypes_bracketRace.generateWinData(dragData)` | Construit la liste classée des résultats : chaque entrée contient vehId, lane, time (timer important), dialDiff, dialNotSet, isPlayable, disqualified. Ordre : écarts positifs croissants, puis breakouts (écart absolu croissant), puis disqualifiés/sans dial (joueurs d'abord, puis couloir, puis vehId). | 127 |
| `gameplay_drag_dragTypes_bracketRace.onExtensionLoaded()` | Hook de chargement : récupère les références vers core et phaseHandlers et remet l'activité à zéro. *(interne)* *(hook)* | 34 |
| `gameplay_drag_dragTypes_bracketRace.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame, actif uniquement quand l'activité est démarrée : simule les racers locaux, appelle la fonction de leur phase, change de phase quand elle est complétée (sans dépendance), marque la course terminée et gère l'avancement groupé des phases selon solo/hôte/client. *(interne)* *(hook)* | 59 |
| `gameplay_drag_dragTypes_bracketRace.resetDragRace()` | Arrête l'activité (hasActivityStarted = false). | 40 |
| `gameplay_drag_dragTypes_bracketRace.startActivity()` | Démarre l'activité : dragData.isStarted = true et calcule les délais de départ de chaque racer d'après la valeur de son timer dial (phaseHandlers.setDialsData). Appelée par core.startDragRaceActivity. | 44 |

### Détail des paramètres

#### `gameplay_drag_dragTypes_bracketRace.generateWinData(dragData)`

Construit la liste classée des résultats : chaque entrée contient vehId, lane, time (timer important), dialDiff, dialNotSet, isPlayable, disqualified. Ordre : écarts positifs croissants, puis breakouts (écart absolu croissant), puis disqualifiés/sans dial (joueurs d'abord, puis couloir, puis vehId).

- `dragData` (*table*) : Données de course avec racers.
- **renvoie** : table[] Liste des résultats, {} si pas de racers.

#### `gameplay_drag_dragTypes_bracketRace.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame, actif uniquement quand l'activité est démarrée : simule les racers locaux, appelle la fonction de leur phase, change de phase quand elle est complétée (sans dépendance), marque la course terminée et gère l'avancement groupé des phases selon solo/hôte/client.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta brut (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_core, gameplay_drag_phaseHandlers. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua`.*
