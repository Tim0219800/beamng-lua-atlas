# `gameplay_drift_quickMessages`

*Fichier : `lua/ge/extensions/gameplay/drift/quickMessages.lua` · VM : Game Engine (GE) · 456 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_quickMessages` : `extensions.load("gameplay_drift_quickMessages")`, puis la globale `gameplay_drift_quickMessages`

Détecte les « quick messages » de drift (petits bonus affichés pendant le drift : grand angle, drift inversé, long drift, frôlement, chaîne longue, drift de précision) et leur attribue une récompense qui s'ajoute au score en cache. Chaque message est décrit par des conditions primaires (toutes à remplir en même temps), éventuellement des conditions de confirmation (ex. pas de crash ensuite) et des conditions de remise à zéro. Émet onDriftQuickMessageDisplay pour l'interface et onDriftQuickMessageReached pour le scoreboard.

## Remarques

- Messages et réglages : bigAngle (angle > 80°, +15), reverseDrift (angle > 105°, +30), longDrift (durée > 4 s et vitesse > 30, +20), closeCall (angle > 25°, vitesse > 30 km/h, distance au mur < 1.5 m, confirmé si pas de crash pendant 1 s, remise à zéro après 4 s, +80), longDriftChain (>= 10 drifts chaînés, +160), precisionDrifting (3 closeCalls dans une chaîne et plus en train de drifter, +150).
- Le texte vient de la traduction missions.drift.quickMessage.<id> et est affiché sous la forme « texte +récompense ».
- Les conditions ne sont pas évaluées quand le drift général est gelé (gameplay_drift_general.getFrozen()).
- Optimisation : après 2 s sans drift, ni chaîne ni confirmation en attente, le module passe en mode idle et saute les vérifications jusqu'au prochain drift.
- Un crash, un spinout ou la remise en place du véhicule du joueur appellent reset() et annulent tout message en attente.

**Dépendances (chargées avant) :** `gameplay_drift_general`, `gameplay_drift_drift`, `gameplay_drift_scoring`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_quickMessages.getDriftDebugInfo()` | Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift. | 422 |
| `gameplay_drift_quickMessages.getGC()` | Renvoie la quantité de garbage mesurée par le profileur à la dernière frame (0 hors debug). | 426 |
| `gameplay_drift_quickMessages.getQuickMessages()` | Retraduit puis renvoie la table des quick messages (utilisée par le scoreboard et l'écran de fin). | 416 |
| `gameplay_drift_quickMessages.onDriftActiveDataFinished()` | Hook : un drift individuel vient de se terminer (déclenche les remises à zéro de type onDriftEnd). *(interne)* *(hook)* | 402 |
| `gameplay_drift_quickMessages.onDriftCompleted()` | Hook : une chaîne de drifts est terminée (déclenche les remises à zéro de type onChainEnd). *(interne)* *(hook)* | 412 |
| `gameplay_drift_quickMessages.onDriftCrash()` | Hook : crash, appelle reset(). *(interne)* *(hook)* | 434 |
| `gameplay_drift_quickMessages.onDriftPlVehReset()` | Hook : le véhicule de drift du joueur a été remis en place ; appelle reset(). *(interne)* *(hook)* | 407 |
| `gameplay_drift_quickMessages.onDriftSpinout()` | Hook : spinout, appelle reset(). *(interne)* *(hook)* | 438 |
| `gameplay_drift_quickMessages.onUpdate(dt)` | Appelé à chaque frame : lit l'état de drift du véhicule suivi, vérifie conditions primaires, confirmations et remises à zéro, gère le mode idle. *(interne)* *(hook)* | 345 |
| `gameplay_drift_quickMessages.reset()` | Vide les messages en attente de confirmation et déjà déclenchés, remet le compteur de frôlements et le mode idle à zéro. | 393 |

### Détail des paramètres

#### `gameplay_drift_quickMessages.getDriftDebugInfo()`

Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift.

- **renvoie** : table {default = false, canBeChanged = true}

#### `gameplay_drift_quickMessages.getGC()`

Renvoie la quantité de garbage mesurée par le profileur à la dernière frame (0 hors debug).

- **renvoie** : number Garbage de la section « Drift quick messages ».

#### `gameplay_drift_quickMessages.getQuickMessages()`

Retraduit puis renvoie la table des quick messages (utilisée par le scoreboard et l'écran de fin).

- **renvoie** : table<string, {msg:string, reward:number, primaryConditions:table}> Quick messages indexés par id (precisionDrifting, bigAngle, reverseDrift, longDrift, closeCall, longDriftChain).

#### `gameplay_drift_quickMessages.onUpdate(dt)`

Appelé à chaque frame : lit l'état de drift du véhicule suivi, vérifie conditions primaires, confirmations et remises à zéro, gère le mode idle.

- `dt` (*number*) : Delta temps (premier argument de onUpdate, dtReal).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDriftQuickMessageDisplay` — écouté par 1 module(s)
- `onDriftQuickMessageReached` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/quickMessages.lua`.*
