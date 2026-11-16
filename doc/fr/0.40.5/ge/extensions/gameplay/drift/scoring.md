# `gameplay_drift_scoring`

*Fichier : `lua/ge/extensions/gameplay/drift/scoring.lua` · VM : Game Engine (GE) · 823 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_scoring` : `extensions.load("gameplay_drift_scoring")`, puis la globale `gameplay_drift_scoring`

Calcule le score de drift de chaque véhicule suivi (un état de score par vehId). Pendant un drift, ajoute à un score en cache des points continus (distance parcourue x multiplicateurs d'angle, de vitesse et de proximité des murs, plus un bonus de palier), fait monter un combo (creep-up) via drift d'un seul côté, transitions de drift, zones de cascade et murs frôlés, et détermine le palier courant et le facteur de performance (1 à 4, lissé). À la fin d'un drift ou d'une chaîne, le score en cache multiplié par le combo est ajouté au score permanent (wrapUp) puis onDriftCompletedScored est émis.

## Exemple

```lua
local s = gameplay_drift_scoring.getScore()
print(s.score, s.cachedScore, s.combo, s.potentialScore)
-- valider le score en cours (ex. fin d'épreuve) :
gameplay_drift_scoring.wrapUp()
```

## Remarques

- Modèle : score potentiel = floor(cachedScore * combo). Les points continus valent angleMulti * speedMulti * wallMulti * distanceParcourue * continuousDriftPoints (0.6), plus continuousScore du palier * dtSim ; ils sont multipliés par le facteur du stallingSystem s'il est chargé (mode Gymkhana).
- Multiplicateurs : angle de 1 (minAngle) à 10 (maxAngle) ; vitesse de 1 à 4 (22 à 200 de airSpeed) ; mur 1 + jusqu'à 3 pour chaque distance avant/arrière.
- Combo : démarre à 1, +0.1 par tranche de 100 de creep-up ; creep-up lent (valeur « low ») au-delà du soft cap 10 ; plafond dur 25. Sources : drift d'un seul côté (angle >= 25°, 10 par 0.1 s, 100 incréments max), zone de cascade (140), transition de drift (de 100 à 500 selon la vitesse 30/60/90/120/150, moitié au-delà du soft cap, minimum 25 de vitesse et recharge 2 s).
- Paliers (minScore du score en cache -> id, bonus continu/s) : 0 drift 10, 250 greatDrift 20, 750 awesomeDrift 30, 2000 superiorDrift 40, 5000 epicDrift 50, 9000 apexDrift 60, 15000 legendaryDrift 75. Noms traduits via missions.drift.tiers.<id>.
- Facteur de performance : rapport du score continu de la frame (sans palier) au score d'un drift de référence (angle 80°, vitesse 70, mur arrière 1.8 m) ; sa version « stepped » (1 à 4) a 0.3 s d'hystérésis sur le palier 4, puis est lissée.
- Points de base des zones de cascade : driftThrough 300, donut 100, hitPole 300, nearPole 300 (basePoints) ; points par défaut driftThrough 1500, donut 500, hitPole 1000, nearPole 1000.
- Les ajouts de score sont ignorés si le drift général est gelé, ou si le véhicule est gelé individuellement (setVehicleFrozen). Les mises à jour de score sont sautées en pause ou si dtSim <= 0.
- Les fonctions sans vehId utilisent le véhicule du joueur 0 puis, à défaut, n'importe quel état de score ; seul getScore(vehId) ne retombe jamais sur un autre véhicule (renvoie un score vide).
- Évènements émis : onDriftNewCombo({newCombo, comboChange}, vehId), onNewDriftTierReached(tier, vehId), onDriftScoreChanged(driftScore, vehId), onDriftCachedScoreReset(vehId), onDriftScoreWrappedUp(score, vehId), onDriftCompletedScored({addedScore, combo, careerRewards, tier, vehId}), onTightDriftScored / onHitPoleScored / onNearPoleScored / onDonutDriftScored(score, vehId).
- getCareerRewardsForDriftScore calcule beamXP mais renvoie toujours une table vide : careerRewards vaut {} (ou nil si score < 300). careerRewards.minScore et scoreMulForXp sont donc inutilisés en pratique.
- calculatePerformanceFactor peut sortir sans lisser (return) pendant l'hystérésis du palier 4.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_scoring.addCachedScore(valueToAdd, useStallingSystem, vehId)` | Ajoute des points au score en cache (avant combo). Ignoré si le drift est gelé ou si le véhicule est gelé. Avec useStallingSystem, applique le facteur de gameplay_drift_stallingSystem et arrondit à l'entier inférieur. | 280 |
| `gameplay_drift_scoring.getCurrentDriftTier(vehId)` | Renvoie la table du palier de drift courant du véhicule (le premier si aucun état). | 740 |
| `gameplay_drift_scoring.getDriftDebugInfo()` | Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift. | 724 |
| `gameplay_drift_scoring.getDriftPerformanceFactor(vehId)` | Renvoie le facteur de performance continu de la dernière frame (1 = drift de référence très bon). | 709 |
| `gameplay_drift_scoring.getDriftTiers()` | Renvoie la liste des paliers de drift (noms traduits au premier onUpdate). | 728 |
| `gameplay_drift_scoring.getGC()` | Renvoie la quantité de garbage mesurée par le profileur. | 732 |
| `gameplay_drift_scoring.getPotentialScore(vehId)` | Renvoie le score potentiel (floor(cachedScore * combo)). | 704 |
| `gameplay_drift_scoring.getScore(vehId)` | Renvoie la table de score du véhicule demandé, ou celle du joueur 0 si vehId est nil. Si le véhicule n'a pas d'état, renvoie un score vide. | 693 |
| `gameplay_drift_scoring.getScoreAddedThisFrame(vehId)` | Renvoie les points continus ajoutés à la dernière frame (bonus de palier inclus). | 719 |
| `gameplay_drift_scoring.getScoreOptions()` | Renvoie la table des réglages de score (points des zones, multiplicateurs, options de combo, récompenses carrière). Modifiable à chaud. | 736 |
| `gameplay_drift_scoring.getSteppedDriftPerformanceFactor(vehId)` | Renvoie le facteur de performance par paliers (1 à 4), lissé dans le temps. | 714 |
| `gameplay_drift_scoring.getStuntZoneBasePoints(stuntZoneType)` | Renvoie les points de base d'un type de zone de cascade. | 745 |
| `gameplay_drift_scoring.isVehicleFrozen(vehId)` | Indique si le scoring de ce véhicule est gelé individuellement. | 753 |
| `gameplay_drift_scoring.onAnyStuntZoneAccomplished(vehId)` | Hook : zone de cascade réussie ; fait monter le combo (creep-up 140, ou 20 au-delà du soft cap). *(interne)* *(hook)* | 568 |
| `gameplay_drift_scoring.onClientEndMission()` | Hook : vide tous les états de score et les gels. *(interne)* *(hook)* | 239 |
| `gameplay_drift_scoring.onDeserialized(data)` | Hook : restaure les cases de debug. *(interne)* *(hook)* | 778 |
| `gameplay_drift_scoring.onDonutDriftAccomplished(data)` | Hook : donut réussi ; ajoute les points de la zone au cache, puis hook onDonutDriftScored. *(interne)* *(hook)* | 596 |
| `gameplay_drift_scoring.onDriftChainStarted(vehId)` | Hook : début d'une chaîne de drifts ; émet onNewDriftTierReached avec le premier palier. *(interne)* *(hook)* | 761 |
| `gameplay_drift_scoring.onDriftCompleted(data)` | Hook : fin d'une chaîne de drifts ; valide le score (wrapUp) puis émet onDriftCompletedScored avec le score ajouté, le combo, le palier et le véhicule. *(interne)* *(hook)* | 631 |
| `gameplay_drift_scoring.onDriftCrash(vehId)` | Hook : crash ; perd le score en cache et le combo (reset du cache, hook onDriftCachedScoreReset). *(interne)* *(hook)* | 685 |
| `gameplay_drift_scoring.onDriftFreeroamCruisingStarted()` | Hook : début du cruising en roaming libre ; remet à zéro le score permanent de tous les véhicules. *(interne)* *(hook)* | 765 |
| `gameplay_drift_scoring.onDriftPlVehReset(vehId)` | Hook : véhicule remis en place ; reset de l'état de score de ce véhicule. *(interne)* *(hook)* | 757 |
| `gameplay_drift_scoring.onDriftSpinout(vehId)` | Hook : spinout ; perd le score en cache et le combo. *(interne)* *(hook)* | 689 |
| `gameplay_drift_scoring.onDriftThroughAccomplished(data)` | Hook : drift à travers une zone ; score = linearScale(angle, 0..90, 0..points de la zone) ajouté au cache avec stalling, puis hook onTightDriftScored. *(interne)* *(hook)* | 575 |
| `gameplay_drift_scoring.onDriftTransition(vehId)` | Hook : transition de drift (changement de côté) ; fait monter le combo selon la vitesse si elle dépasse 25 et que 2 s se sont écoulées depuis le dernier démarrage de drift. *(interne)* *(hook)* | 667 |
| `gameplay_drift_scoring.onHitPoleAccomplished(data)` | Hook : poteau touché ; score = linearScale(angle + vitesse, 0..250, 0..points) ajouté au cache, puis hook onHitPoleScored. *(interne)* *(hook)* | 582 |
| `gameplay_drift_scoring.onNearPoleAccomplished(data)` | Hook : poteau frôlé ; score = angle * closeness / 90 * points ajouté au cache, puis hook onNearPoleScored. *(interne)* *(hook)* | 589 |
| `gameplay_drift_scoring.onSerialize()` | Hook : sauvegarde les cases de debug avant rechargement Lua. *(interne)* *(hook)* | 771 |
| `gameplay_drift_scoring.onUpdate(dtReal, _dtSim)` | Appelé à chaque frame : crée les états de score des véhicules suivis, met à jour tier, facteur de performance, creep-up et score continu pour chacun. Au premier appel, traduit les paliers et calcule le score de référence. *(interne)* *(hook)* | 533 |
| `gameplay_drift_scoring.onVehicleDestroyed(vehId)` | Hook : supprime l'état de score et le gel du véhicule détruit. *(interne)* *(hook)* | 234 |
| `gameplay_drift_scoring.reset(vehId)` | Remet à zéro l'état de score d'un véhicule (ou de tous si vehId est nil) et vide l'historique de debug. Appelé par gameplay_drift_general.reset. | 222 |
| `gameplay_drift_scoring.setVehicleFrozen(vehId, isFrozen)` | Gèle ou dégèle le scoring d'un véhicule individuel (ses ajouts de score sont alors ignorés). | 749 |
| `gameplay_drift_scoring.wrapUp(vehId)` | Valide le score en cache : ajoute floor(cachedScore * combo) au score permanent puis remet le cache et le combo à zéro (hook onDriftCachedScoreReset). Ne fait rien si le résultat est < 1. | 602 |
| `gameplay_drift_scoring.wrapUpWithText(vehId)` | Comme wrapUp, mais émet aussi onDriftScoreWrappedUp(addedScore, vehId) pour que l'UI présente le score validé. | 614 |

### Détail des paramètres

#### `gameplay_drift_scoring.addCachedScore(valueToAdd, useStallingSystem, vehId)`

Ajoute des points au score en cache (avant combo). Ignoré si le drift est gelé ou si le véhicule est gelé. Avec useStallingSystem, applique le facteur de gameplay_drift_stallingSystem et arrondit à l'entier inférieur.

- `valueToAdd` (*number*) : Points à ajouter.
- `useStallingSystem` (*boolean|nil*) : true pour appliquer le facteur de stalling (défaut false).
- `vehId` (*integer|nil*) : Id du véhicule (joueur 0 par défaut).
- **renvoie** : number Points réellement ajoutés (0 si ignoré).

#### `gameplay_drift_scoring.getCurrentDriftTier(vehId)`

Renvoie la table du palier de drift courant du véhicule (le premier si aucun état).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : table {minScore, continuousScore, id, order, name}

#### `gameplay_drift_scoring.getDriftDebugInfo()`

Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift.

- **renvoie** : table {default = true, canBeChanged = true}

#### `gameplay_drift_scoring.getDriftPerformanceFactor(vehId)`

Renvoie le facteur de performance continu de la dernière frame (1 = drift de référence très bon).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number Facteur, 0 hors drift.

#### `gameplay_drift_scoring.getDriftTiers()`

Renvoie la liste des paliers de drift (noms traduits au premier onUpdate).

- **renvoie** : table[] Liste de {minScore, continuousScore, id, order, name}.

#### `gameplay_drift_scoring.getGC()`

Renvoie la quantité de garbage mesurée par le profileur.

- **renvoie** : number|nil nil tant que le debug général n'a jamais été actif.

#### `gameplay_drift_scoring.getPotentialScore(vehId)`

Renvoie le score potentiel (floor(cachedScore * combo)).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number Score potentiel, 0 si aucun état.

#### `gameplay_drift_scoring.getScore(vehId)`

Renvoie la table de score du véhicule demandé, ou celle du joueur 0 si vehId est nil. Si le véhicule n'a pas d'état, renvoie un score vide.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : table {score, combo, cachedScore, potentialScore, comboCreepup}. Attention : c'est la table vivante, pas une copie.

#### `gameplay_drift_scoring.getScoreAddedThisFrame(vehId)`

Renvoie les points continus ajoutés à la dernière frame (bonus de palier inclus).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number Points de la frame.

#### `gameplay_drift_scoring.getScoreOptions()`

Renvoie la table des réglages de score (points des zones, multiplicateurs, options de combo, récompenses carrière). Modifiable à chaud.

- **renvoie** : table scoreOptions (table vivante).

#### `gameplay_drift_scoring.getSteppedDriftPerformanceFactor(vehId)`

Renvoie le facteur de performance par paliers (1 à 4), lissé dans le temps.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number Facteur lissé, 0 hors drift.

#### `gameplay_drift_scoring.getStuntZoneBasePoints(stuntZoneType)`

Renvoie les points de base d'un type de zone de cascade.

- `stuntZoneType` (*string*) : "driftThrough", "donut", "hitPole" ou "nearPole".
- **renvoie** : number basePoints de ce type.

#### `gameplay_drift_scoring.isVehicleFrozen(vehId)`

Indique si le scoring de ce véhicule est gelé individuellement.

- `vehId` (*integer*) : Id du véhicule.
- **renvoie** : boolean true si gelé.

#### `gameplay_drift_scoring.onAnyStuntZoneAccomplished(vehId)`

Hook : zone de cascade réussie ; fait monter le combo (creep-up 140, ou 20 au-delà du soft cap).

- `vehId` (*integer*) : Véhicule.

#### `gameplay_drift_scoring.onDeserialized(data)`

Hook : restaure les cases de debug.

- `data` (*table*) : Table de onSerialize.

#### `gameplay_drift_scoring.onDonutDriftAccomplished(data)`

Hook : donut réussi ; ajoute les points de la zone au cache, puis hook onDonutDriftScored.

- `data` (*table*) : {vehId, zoneData = {points}}.

#### `gameplay_drift_scoring.onDriftChainStarted(vehId)`

Hook : début d'une chaîne de drifts ; émet onNewDriftTierReached avec le premier palier.

- `vehId` (*integer*) : Véhicule.

#### `gameplay_drift_scoring.onDriftCompleted(data)`

Hook : fin d'une chaîne de drifts ; valide le score (wrapUp) puis émet onDriftCompletedScored avec le score ajouté, le combo, le palier et le véhicule.

- `data` (*table|nil*) : Contient vehId.

#### `gameplay_drift_scoring.onDriftCrash(vehId)`

Hook : crash ; perd le score en cache et le combo (reset du cache, hook onDriftCachedScoreReset).

- `vehId` (*integer*) : Véhicule.

#### `gameplay_drift_scoring.onDriftPlVehReset(vehId)`

Hook : véhicule remis en place ; reset de l'état de score de ce véhicule.

- `vehId` (*integer*) : Véhicule.

#### `gameplay_drift_scoring.onDriftSpinout(vehId)`

Hook : spinout ; perd le score en cache et le combo.

- `vehId` (*integer*) : Véhicule.

#### `gameplay_drift_scoring.onDriftThroughAccomplished(data)`

Hook : drift à travers une zone ; score = linearScale(angle, 0..90, 0..points de la zone) ajouté au cache avec stalling, puis hook onTightDriftScored.

- `data` (*table*) : {vehId, currDegAngle, zoneData = {points}}.

#### `gameplay_drift_scoring.onDriftTransition(vehId)`

Hook : transition de drift (changement de côté) ; fait monter le combo selon la vitesse si elle dépasse 25 et que 2 s se sont écoulées depuis le dernier démarrage de drift.

- `vehId` (*integer*) : Véhicule.

#### `gameplay_drift_scoring.onHitPoleAccomplished(data)`

Hook : poteau touché ; score = linearScale(angle + vitesse, 0..250, 0..points) ajouté au cache, puis hook onHitPoleScored.

- `data` (*table*) : {vehId, currDegAngle, currAirSpeed, zoneData = {points}}.

#### `gameplay_drift_scoring.onNearPoleAccomplished(data)`

Hook : poteau frôlé ; score = angle * closeness / 90 * points ajouté au cache, puis hook onNearPoleScored.

- `data` (*table*) : {vehId, currDegAngle, closeness, zoneData = {points}}.

#### `gameplay_drift_scoring.onSerialize()`

Hook : sauvegarde les cases de debug avant rechargement Lua.

- **renvoie** : table {scoreExperiment, debugToggleSmothnessGraph}

#### `gameplay_drift_scoring.onUpdate(dtReal, _dtSim)`

Appelé à chaque frame : crée les états de score des véhicules suivis, met à jour tier, facteur de performance, creep-up et score continu pour chacun. Au premier appel, traduit les paliers et calcule le score de référence.

- `dtReal` (*number*) : Delta temps réel (debug).
- `_dtSim` (*number*) : Delta temps simulé, utilisé pour les calculs.

#### `gameplay_drift_scoring.onVehicleDestroyed(vehId)`

Hook : supprime l'état de score et le gel du véhicule détruit.

- `vehId` (*integer*) : Véhicule détruit.

#### `gameplay_drift_scoring.reset(vehId)`

Remet à zéro l'état de score d'un véhicule (ou de tous si vehId est nil) et vide l'historique de debug. Appelé par gameplay_drift_general.reset.

- `vehId` (*integer|nil*) : Véhicule à réinitialiser ; nil pour tous.

#### `gameplay_drift_scoring.setVehicleFrozen(vehId, isFrozen)`

Gèle ou dégèle le scoring d'un véhicule individuel (ses ajouts de score sont alors ignorés).

- `vehId` (*integer*) : Id du véhicule.
- `isFrozen` (*boolean*) : true pour geler.

#### `gameplay_drift_scoring.wrapUp(vehId)`

Valide le score en cache : ajoute floor(cachedScore * combo) au score permanent puis remet le cache et le combo à zéro (hook onDriftCachedScoreReset). Ne fait rien si le résultat est < 1.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number|boolean Points ajoutés, ou false si rien à valider.

#### `gameplay_drift_scoring.wrapUpWithText(vehId)`

Comme wrapUp, mais émet aussi onDriftScoreWrappedUp(addedScore, vehId) pour que l'UI présente le score validé.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number|boolean Points ajoutés, ou false.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDonutDriftScored` — écouté par 1 module(s)
- `onDriftCachedScoreReset` — écouté par 1 module(s)
- `onDriftCompletedScored` — écouté par 5 module(s)
- `onDriftNewCombo` — écouté par 1 module(s)
- `onDriftScoreChanged` — écouté par 1 module(s)
- `onDriftScoreWrappedUp` — écouté par 1 module(s)
- `onHitPoleScored` — écouté par 1 module(s)
- `onNearPoleScored` — écouté par 1 module(s)
- `onNewDriftTierReached` — écouté par 2 module(s)
- `onTightDriftScored` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/scoring.lua`.*
