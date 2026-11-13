# `gameplay_rallyStartClock`

*Fichier : `lua/ge/extensions/gameplay/rallyStartClock.lua` · VM : Game Engine (GE) · 528 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rallyStartClock` : `extensions.load("gameplay_rallyStartClock")`, puis la globale `gameplay_rallyStartClock`

Gère les horloges de départ de spéciale (panneaux physiques présents dans les niveaux) pour le rallye. Il charge les types d'horloges depuis `lua/ge/extensions/gameplay/rally/startClocks/*.lua` (chacun doit exposer `textures`, `findClocks` et `draw`), crée un objet TSStatic d'affichage par horloge trouvée, dessine l'heure murale, le libellé « SS<n> » et le compte à rebours (avec code de feu R, A ou G) dans des textures dynamiques, puis, si le réglage `rallyStartCountdownDisplay` vaut '3d', affiche l'horloge la plus proche de la ligne de départ dans une vue de rendu incrustée en haut de l'écran avec un cadre coloré selon le feu. Il alimente son état à partir du hook `onRallyDataUpdated`.

## Remarques

- Un type d'horloge valide est un module de startClocks/ qui renvoie une table avec `textures` (table clé -> {tag, width, height, clearColor}), `findClocks()` (liste d'horloges {shapeName, transform, scale, anchor}) et `draw(textures, display)`. getView(clock, startLine, targetPos) est optionnel. Les modules invalides sont journalisés en erreur.
- Table `display` passée à draw : {clock = 'HH:MM:SS', clockSeconds, label = 'SSn', countdown, countdownSeconds, semaphore = 'R'|'A'|'G'}.
- Compte à rebours : feu R au-delà de 5 s, A à 5 s ou moins, G après le départ (affiche '0' puis '-1' à '-5', 6 s au total) ; ensuite '-' en rouge. Au-delà de 60 s, affiché en m:ss.
- L'heure murale vient du RallyLoopManager (getWallClockTimeSecs) si une boucle est active, sinon de rallyClock.wallClockSecs reçu par onRallyDataUpdated, sinon de core_environment.getTimeOfDay (décalée de 12 h : (time + 0.5) % 1 x 86400).
- Les horloges sont recherchées une fois par seconde tant qu'aucune n'est valide ; les textures sont re-liées 4 fois (toutes les 0,5 s) après la création.
- La vue 3D s'efface 1,5 s après la fin du compte à rebours et n'est disponible (isRenderViewAvailable) qu'à partir de la deuxième image valide. L'horloge choisie est celle à moins de 20 m de la ligne de départ de la spéciale (gameplay_rally:getRallyManager():getSSStartLinePos()).
- Bogue mineur : getStageDisplay écrit 'SS' .. tostring(label):gsub(...) : gsub renvoie deux valeurs mais la concaténation n'en garde qu'une, donc sans effet visible.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rallyStartClock.getClockTypes()` | Types d'horloges chargés. | 525 |
| `gameplay_rallyStartClock.isRenderViewAvailable()` | Indique si la vue de rendu 3D du compte à rebours est active ; rallyLoop s'en sert pour masquer le compte à rebours 2D. | 524 |
| `gameplay_rallyStartClock.onExtensionLoaded()` | Hook de chargement : charge (ou recharge) les types d'horloges depuis le dossier startClocks. *(interne)* *(hook)* | 69 |
| `gameplay_rallyStartClock.onExtensionUnloaded()` | Hook de déchargement : détruit la vue de rendu, les affichages et réinitialise l'état. *(interne)* *(hook)* | 426 |
| `gameplay_rallyStartClock.onPreRender(dtReal, dtSim)` | Appelé avant le rendu, après tous les onUpdate : avance l'horloge locale si aucune donnée fraîche n'est arrivée, redessine les textures si l'affichage a changé et trace le cadre coloré de la vue 3D. *(interne)* *(hook)* | 499 |
| `gameplay_rallyStartClock.onRallyDataUpdated(data)` | Hook appelé quand les données de rallye changent. Lit activeState (début et fin du compte à rebours, délai de 1,5 s de la vue 3D), rallyClock.wallClockSecs et startClockCountdownData (ou countdownData) pour calculer l'heure de départ (timeUntilLaunch en secondes, state 'launched'). *(interne)* *(hook)* | 440 |
| `gameplay_rallyStartClock.onRallySessionEnd()` | Hook émis à la fin d'une session de rallye : même nettoyage que le déchargement. *(interne)* *(hook)* | 426 |
| `gameplay_rallyStartClock.onUpdate(dtReal, dtSim)` | Hook de mise à jour : (re)détecte les horloges du niveau toutes les secondes si besoin, relie les textures, fait tourner le délai de la vue et met à jour la vue de rendu 3D. *(interne)* *(hook)* | 476 |

### Détail des paramètres

#### `gameplay_rallyStartClock.getClockTypes()`

Types d'horloges chargés.

- **renvoie** : table[] Liste de {name, module} (name = nom du fichier sans extension).

#### `gameplay_rallyStartClock.isRenderViewAvailable()`

Indique si la vue de rendu 3D du compte à rebours est active ; rallyLoop s'en sert pour masquer le compte à rebours 2D.

- **renvoie** : boolean true si la vue 3D est disponible.

#### `gameplay_rallyStartClock.onPreRender(dtReal, dtSim)`

Appelé avant le rendu, après tous les onUpdate : avance l'horloge locale si aucune donnée fraîche n'est arrivée, redessine les textures si l'affichage a changé et trace le cadre coloré de la vue 3D.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_rallyStartClock.onRallyDataUpdated(data)`

Hook appelé quand les données de rallye changent. Lit activeState (début et fin du compte à rebours, délai de 1,5 s de la vue 3D), rallyClock.wallClockSecs et startClockCountdownData (ou countdownData) pour calculer l'heure de départ (timeUntilLaunch en secondes, state 'launched').

- `data` (*table*) : Données de rallye (activeState, rallyClock, startClockCountdownData, countdownData).

#### `gameplay_rallyStartClock.onUpdate(dtReal, dtSim)`

Hook de mise à jour : (re)détecte les horloges du niveau toutes les secondes si besoin, relie les textures, fait tourner le délai de la vue et met à jour la vue de rendu 3D.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `Sim.` `getUniqueName`
- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `currentRenderViewMaskClear`, `currentRenderViewMaskSet`, `drawLineInstance`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rallyStartClock.lua`.*
