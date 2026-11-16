# `gameplay_rally_loop_standaloneFallbackStream`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua` · VM : Game Engine (GE) · 344 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_standaloneFallbackStream` : `extensions.load("gameplay_rally_loop_standaloneFallbackStream")`, puis la globale `gameplay_rally_loop_standaloneFallbackStream`

Flux de données de secours pour les apps d'interface de spéciale de rallye quand aucune boucle (rally loop) ne les alimente (spéciale lancée seule, « standalone »). Il conserve les dernières données reçues d'un nœud de compte à rebours (état actif, compte à rebours, proximité du véhicule, horloge) et les complète avec les données de la spéciale du gestionnaire de rallye (gameplay_rally.getRallyManager():getActiveStageData()), l'horloge de l'environnement, les couleurs de thème et le réglage rallyShowStageApps. getStreamData renvoie la table à envoyer à l'UI.

## Remarques

- Un flux reçu reste « frais » 0.75 s (fallbackFreshTime) ; au-delà il n'est utilisé que si la spéciale est présente ou active.
- Le compte à rebours est protégé 0.75 s après chaque mise à jour (0.1 s pour l'affichage GO, countdown == 0) : un état non-compte-à-rebours entrant est ignoré pendant ce délai.
- data.resetFallbackStreamData = true efface l'état puis crée un flux de remise à zéro avec fallbackStageResetActive.
- Le mode NGRC est déduit de gameplay_rally.getRecoveryRepairVehicle() (NGRC = pas de réparation de véhicule).
- Le thème est coloré avec uiColors.updateForStage.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_standaloneFallbackStream.clear()` | Efface tout l'état du flux de secours (données, délais, horloge, drapeau de reset). | 191 |
| `gameplay_rally_loop_standaloneFallbackStream.getStreamData(now)` | Construit la table de flux pour l'UI : activeState, rallyClock, stageData, scheduleData, vehicleProximity, countdownData, showStageApps, uiColors. Choisit entre le flux de secours mis à jour, les données de la spéciale seule (état stageActive) ou un état inactif avec données remises à zéro. | 211 |
| `gameplay_rally_loop_standaloneFallbackStream.isActive()` | Indique si le flux doit être utilisé : des données de secours existent ou une spéciale est active côté gestionnaire de rallye. | 201 |
| `gameplay_rally_loop_standaloneFallbackStream.onSettingsChanged()` | Hook appelé quand les réglages changent : relit rallyShowStageApps (true par défaut). *(interne)* *(hook)* | 54 |
| `gameplay_rally_loop_standaloneFallbackStream.updateClock(dtSim)` | Avance l'horloge murale locale (fallbackClockSecs) de dtSim secondes, modulo 86400, si elle a été initialisée par un nœud. | 205 |
| `gameplay_rally_loop_standaloneFallbackStream.updateStreamData(data)` | Enregistre un paquet de données venant d'un nœud (activeState, vehicleProximity, countdownData, rallyClock, resetFallbackStreamData) et gère les délais de protection du compte à rebours et d'affichage de GO. | 279 |

### Détail des paramètres

#### `gameplay_rally_loop_standaloneFallbackStream.getStreamData(now)`

Construit la table de flux pour l'UI : activeState, rallyClock, stageData, scheduleData, vehicleProximity, countdownData, showStageApps, uiColors. Choisit entre le flux de secours mis à jour, les données de la spéciale seule (état stageActive) ou un état inactif avec données remises à zéro.

- `now` (*number|nil*) : Temps courant (RallyUtil.getTime() ou os.clockhp() par défaut).
- **renvoie** : table Données de flux.

#### `gameplay_rally_loop_standaloneFallbackStream.isActive()`

Indique si le flux doit être utilisé : des données de secours existent ou une spéciale est active côté gestionnaire de rallye.

- **renvoie** : boolean true si actif.

#### `gameplay_rally_loop_standaloneFallbackStream.updateClock(dtSim)`

Avance l'horloge murale locale (fallbackClockSecs) de dtSim secondes, modulo 86400, si elle a été initialisée par un nœud.

- `dtSim` (*number*) : Temps de simulation écoulé, en secondes.

#### `gameplay_rally_loop_standaloneFallbackStream.updateStreamData(data)`

Enregistre un paquet de données venant d'un nœud (activeState, vehicleProximity, countdownData, rallyClock, resetFallbackStreamData) et gère les délais de protection du compte à rebours et d'affichage de GO.

- `data` (*table|nil*) : Paquet du nœud ; ignoré si nil.

## Appels vers le moteur (C++)

- `core_environment.` `getTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua`.*
