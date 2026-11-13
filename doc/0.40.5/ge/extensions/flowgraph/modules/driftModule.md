# `flowgraph_modules_driftModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/driftModule.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/driftModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 0, dépend de gameplay_drift_general) qui relaie les évènements du gameplay de drift vers les nœuds flowgraph. Il écoute les hooks onDriftSpinout, onDriftCrash, onDonutDriftScored, onTightDriftScored et onDriftCompletedScored, et conserve chaque évènement dans une table de callbacks avec une durée de vie (ttl) de 2 ticks que les nœuds peuvent lire.

## Remarques

- Les callbacks connus à l'init sont tight, donut, spinout, crash, tap, scored ; chacun a ttl = 0 au départ.
- Un évènement est considéré actif tant que ttl > 0 ; onUpdate décrémente le ttl d'un par appel.
- addCallback fixe ttl = 2 : l'évènement reste visible environ 2 mises à jour.
- onDonutZoneReactivated n'est pas déclaré dans C.hooks ; il est appelé directement et relaie vers gameplay_drift_drift.onDonutZoneReactivated().

**Dépendances (chargées avant) :** `gameplay_drift_general`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_driftModule.addCallback(name, data)` | Enregistre (ou remplace) un évènement avec ttl = 2 et des données. (assignée dynamiquement) | dyn |
| `flowgraph_modules_driftModule.getCallBacks()` | Renvoie la table des callbacks (clé = nom, valeur = {ttl, data}). (assignée dynamiquement) | dyn |
| `flowgraph_modules_driftModule.init()` | Appelé à la création du module : appelle resetModule(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_driftModule.onDonutDriftScored(score)` | Hook : donut marqué ; enregistre 'donut' avec {score}. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.onDonutZoneReactivated()` | Relaie vers gameplay_drift_drift.onDonutZoneReactivated(). (assignée dynamiquement) *(hook)* | dyn |
| `flowgraph_modules_driftModule.onDriftCompletedScored(data)` | Hook : drift terminé et compté ; enregistre 'scored' avec addedScore, cachedScore et combo. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.onDriftCrash()` | Hook : crash en drift ; enregistre 'crash'. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.onDriftSpinout()` | Hook : le joueur a fait un tête-à-queue ; enregistre 'spinout'. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.onTightDriftScored(score)` | Hook : drift serré marqué ; enregistre 'tight' avec {score}. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.onUpdate()` | Appelé à chaque mise à jour du manager : décrémente le ttl de chaque callback positif. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.resetModule()` | Recrée la table callbacks avec tous les évènements à ttl = 0. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `flowgraph_modules_driftModule.addCallback(name, data)`

Enregistre (ou remplace) un évènement avec ttl = 2 et des données. (assignée dynamiquement)

- `name` (*string*) : nom de l'évènement (tight, donut, spinout, crash, scored…)
- `data` (*table|nil*) : données associées

#### `flowgraph_modules_driftModule.getCallBacks()`

Renvoie la table des callbacks (clé = nom, valeur = {ttl, data}). (assignée dynamiquement)

- **renvoie** : table<string, table> callbacks par nom

#### `flowgraph_modules_driftModule.onDonutDriftScored(score)`

Hook : donut marqué ; enregistre 'donut' avec {score}. (assignée dynamiquement)

- `score` (*number*) : score obtenu

#### `flowgraph_modules_driftModule.onDriftCompletedScored(data)`

Hook : drift terminé et compté ; enregistre 'scored' avec addedScore, cachedScore et combo. (assignée dynamiquement)

- `data` (*table*) : champs addedScore, cachedScore, combo

#### `flowgraph_modules_driftModule.onTightDriftScored(score)`

Hook : drift serré marqué ; enregistre 'tight' avec {score}. (assignée dynamiquement)

- `score` (*number*) : score obtenu

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:addCallback(name, data)` |  | 38 |
| `C:getCallBacks()` |  | 34 |
| `C:init()` |  | 21 |
| `C:onDonutDriftScored(score)` |  | 57 |
| `C:onDonutZoneReactivated()` |  | 65 |
| `C:onDriftCompletedScored(data)` |  | 61 |
| `C:onDriftCrash()` |  | 49 |
| `C:onDriftSpinout()` |  | 45 |
| `C:onTightDriftScored(score)` |  | 53 |
| `C:onUpdate()` |  | 25 |
| `C:resetModule()` |  | 10 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/driftModule.lua`.*
