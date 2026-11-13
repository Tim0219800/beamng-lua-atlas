# `partCondition`

*Fichier : `lua/vehicle/partCondition.lua` · VM : Véhicule · 607 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `partCondition`

Système d'usure et d'état des pièces du véhicule (kilométrage, intégrité/dommages, état visuel dont la peinture vieillie). Il découvre quelles pièces (parts) contiennent quoi (devices de powertrain, réservoirs, flexbodies, poutres cassables/déformables), appelle powertrain, energyStorage et beamstate pour appliquer ou lire leur condition, et gère des instantanés (snapshots) pour pouvoir remettre le véhicule dans son état de spawn au reset. Le Lua du jeu l'utilise pour sauvegarder et recharger l'état d'un véhicule (garage, carrière) : initConditions à l'apparition, getConditions pour sauvegarder.

## Exemple

```lua
-- sauvegarder l'état
local conditions = partCondition.getConditions()  -- table partId -> {odometer, integrityValue, visualValue, integrityState, visualState} ou false
-- recharger
partCondition.initConditions(conditions, 0, 1, 1)
```

## Remarques

- Dépend de l'extension `odometer` (extensions.odometer.getRelativeRecording / startRecording) : le kilométrage d'une pièce = valeur de base absolue + distance parcourue depuis la pose de la condition. Les unités d'odomètre sont celles de l'extension odometer (le seuil de vieillissement de peinture 5 000 000 -> 800 000 000 laisse penser à des mètres cumulés, déduit).
- Types de pièces (partTypeData[partId]) déduits au premier appel : "powertrainDevice:<nom>" (+ ":radiator", ":exhaust", ":turbocharger" pour les sous-systèmes), "energyStorage:<nom>", "jbeam:flexbody:<mesh>", "jbeam:breakGroup:<groupe>", "jbeam:beamDamage:<cid>" (poutres cassables/déformables hors poutres support de type 7).
- Le vieillissement de peinture (getAgedPaint) augmente la rugosité (du clearcoat s'il y en a), diminue la saturation (jusqu'à 0.95) et éclaircit la couleur entre 5e6 et 8e8 d'odomètre. Pour le canal bleu l'éclaircissement utilise la constante du vert (maxColorBrightnessIncreaseG) au lieu de celle du bleu (incohérence apparente dans le code).
- Un snapshot nommé "reset" est créé à chaque initConditions et devient le snapshot de reset : partCondition.reset() (appelé par main.lua:onVehicleReset) efface les valeurs et ré-applique ce snapshot.
- initCondition journalise une erreur si on applique deux fois la condition d'une pièce (hasSetPartCondition) sans passer par reset ou un snapshot.
- Bugs mineurs : dans createConditionSnapshot le message d'erreur concatène snapshotKey même quand il est nil (ce qui lèverait une erreur) ; le message d'erreur de applyConditionSnapshot parle de « créer » un snapshot.
- getConditions renvoie false (pas une table) si aucune condition n'a encore été posée. Les erreurs par pièce sont capturées (xpcall) et loguées, la pièce est alors absente du résultat.
- testInit / testLoad / testSave servent au debug : écrivent ou lisent partConditionTest.json dans le répertoire courant.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `partCondition.applyConditionSnapshot(snapshotKey)` | Ré-applique un snapshot mémorisé (réinitialise l'état de pose puis initConditions). Erreur loguée si la clé est absente. | 50 |
| `partCondition.createConditionSnapshot(snapshotKey)` | Mémorise l'état courant (getConditions) sous une clé. | 40 |
| `partCondition.deleteConditionSnapshots()` | Supprime tous les snapshots et la clé de reset. | 65 |
| `partCondition.ensureConditionsInit(fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue)` | Appel « à l'aveugle » : initialise un état neuf si aucune condition n'a encore été posée (sinon ne fait rien). | 558 |
| `partCondition.getConditions()` | Lit l'état courant de toutes les pièces : kilométrage, intégrité (min des sous-systèmes), état visuel (dont peinture) et états détaillés par sous-système, prêts pour être sauvegardés ou repassés à initConditions. | 489 |
| `partCondition.getRootPartOdometerValue()` | Renvoie l'odomètre total de la pièce racine (slotType 'main') : valeur de base + distance depuis la pose. | 262 |
| `partCondition.getRootPartTripValue()` | Renvoie la distance parcourue depuis la pose de la condition de la pièce racine (trajet). | 268 |
| `partCondition.initConditions(partsCondition, fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue, defaultPaints)` | Applique l'état de chaque pièce du véhicule à partir d'une table sauvegardée (ou un état neuf si nil), via powertrain, energyStorage, beamstate et la peinture, puis crée le snapshot « reset ». | 515 |
| `partCondition.reset()` | Efface les conditions mémorisées et, si un snapshot de reset existe, le ré-applique. Appelée par main.lua au reset du véhicule. *(interne)* | 474 |
| `partCondition.setAllPartPaints(paints, paintOdometer)` | Applique le même jeu de peintures vieillies à toutes les pièces actives. | 356 |
| `partCondition.setPartMeshPaints(partId, paints)` | Applique les 3 peintures (couleur de base, rugosité, métal, vernis) aux flexbodies d'une pièce en envoyant des commandes setMeshColor / setMeshPaintData au GE. | 273 |
| `partCondition.setPartPaints(partId, paints, paintOdometer)` | Mémorise les peintures d'une pièce (les entrées 2 et 3 copient la 1 si absentes), les vieillit selon l'odomètre de peinture et les applique aux meshes. | 348 |
| `partCondition.setResetSnapshotKey(snapshotKey)` | Choisit le snapshot appliqué par reset(). | 70 |
| `partCondition.testInit()` | Debug : initialise un état de test (odomètre 812812000, intégrité 1, visuel 1). *(interne)* | 564 |
| `partCondition.testLoad()` | Debug : charge partConditionTest.json et l'applique avec initConditions. *(interne)* | 569 |
| `partCondition.testSave()` | Debug : initialise si nécessaire puis écrit getConditions() dans partConditionTest.json. *(interne)* | 575 |

### Détail des paramètres

#### `partCondition.applyConditionSnapshot(snapshotKey)`

Ré-applique un snapshot mémorisé (réinitialise l'état de pose puis initConditions). Erreur loguée si la clé est absente.

- `snapshotKey` (*string*) : Nom du snapshot.

#### `partCondition.createConditionSnapshot(snapshotKey)`

Mémorise l'état courant (getConditions) sous une clé.

- `snapshotKey` (*string*) : Nom du snapshot.

#### `partCondition.ensureConditionsInit(fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue)`

Appel « à l'aveugle » : initialise un état neuf si aucune condition n'a encore été posée (sinon ne fait rien).

- `fallbackOdometer` (*number|nil*) : Odomètre de repli.
- `fallbackIntegrityValue` (*number|nil*) : Intégrité de repli.
- `fallbackVisualValue` (*number|nil*) : État visuel de repli.

#### `partCondition.getConditions()`

Lit l'état courant de toutes les pièces : kilométrage, intégrité (min des sous-systèmes), état visuel (dont peinture) et états détaillés par sous-système, prêts pour être sauvegardés ou repassés à initConditions.

- **renvoie** : table|boolean Table partId -> condition, ou false si rien n'a encore été initialisé.

#### `partCondition.getRootPartOdometerValue()`

Renvoie l'odomètre total de la pièce racine (slotType 'main') : valeur de base + distance depuis la pose.

- **renvoie** : number Odomètre de la pièce principale.

#### `partCondition.getRootPartTripValue()`

Renvoie la distance parcourue depuis la pose de la condition de la pièce racine (trajet).

- **renvoie** : number Distance du trajet.

#### `partCondition.initConditions(partsCondition, fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue, defaultPaints)`

Applique l'état de chaque pièce du véhicule à partir d'une table sauvegardée (ou un état neuf si nil), via powertrain, energyStorage, beamstate et la peinture, puis crée le snapshot « reset ».

- `partsCondition` (*table|nil*) : Table partId -> {odometer, integrityValue, visualValue, integrityState, visualState} ; nil = véhicule neuf.
- `fallbackOdometer` (*number|nil*) : Odomètre pour les pièces sans donnée (0 par défaut).
- `fallbackIntegrityValue` (*number|nil*) : Intégrité 0..1 par défaut (1).
- `fallbackVisualValue` (*number|nil*) : État visuel 0..1 par défaut (1).
- `defaultPaints` (*table|nil*) : Peintures par défaut (3 entrées) remplaçant celles du jbeam pour une valeur visuelle numérique.

#### `partCondition.setAllPartPaints(paints, paintOdometer)`

Applique le même jeu de peintures vieillies à toutes les pièces actives.

- `paints` (*table*) : Tableau de 1 à 3 peintures.
- `paintOdometer` (*number*) : Usure de la peinture.

#### `partCondition.setPartMeshPaints(partId, paints)`

Applique les 3 peintures (couleur de base, rugosité, métal, vernis) aux flexbodies d'une pièce en envoyant des commandes setMeshColor / setMeshPaintData au GE.

- `partId` (*string*) : Identifiant (chemin) de la pièce.
- `paints` (*table*) : Tableau de 3 peintures {baseColor = {r,g,b,a (0..1)}, roughness, metallic, clearcoat, clearcoatRoughness}.

#### `partCondition.setPartPaints(partId, paints, paintOdometer)`

Mémorise les peintures d'une pièce (les entrées 2 et 3 copient la 1 si absentes), les vieillit selon l'odomètre de peinture et les applique aux meshes.

- `partId` (*string*) : Identifiant de la pièce.
- `paints` (*table*) : Tableau de 1 à 3 peintures.
- `paintOdometer` (*number*) : Usure de la peinture (0 = neuve).

#### `partCondition.setResetSnapshotKey(snapshotKey)`

Choisit le snapshot appliqué par reset().

- `snapshotKey` (*string|nil*) : Clé du snapshot de reset ; nil pour ne rien restaurer.

## Appels vers le moteur (C++)

- `obj:` `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/partCondition.lua`.*
