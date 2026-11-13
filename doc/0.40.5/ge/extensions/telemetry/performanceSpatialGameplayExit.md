# `telemetry_performanceSpatialGameplayExit`

*Fichier : `lua/ge/extensions/telemetry/performanceSpatialGameplayExit.lua` · VM : Game Engine (GE) · 172 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_performanceSpatialGameplayExit` : `extensions.load("telemetry_performanceSpatialGameplayExit")`, puis la globale `telemetry_performanceSpatialGameplayExit`

Aide de télémétrie : détermine quelle activité de gameplay est en cours (mission, scénario, livraison, essai, certification, drag/drift/crawl en freeroam, livraison de carrière) et fabrique l'évènement « gameplayActivityExit » quand le joueur la quitte (abandon, sortie du monde ou du jeu), avec le niveau et la position arrondie du joueur. Les entrées sont validées strictement (types, longueur, caractères) ; un paramètre `source` permet d'injecter de faux modules pour les tests (par défaut _G).

## Remarques

- Types d'activité : mission, scenario, careerDelivery, testDrive, vehicleCertification, freeformDelivery, freeroamDrag, freeroamDrift, freeroamCrawl. Types de sortie : abort, worldExit, gameExit.
- Ordre de priorité de resolveActivity : mission au premier plan, scénario non terminé (état différent de finished/post), livraison libre, essai routier de carrière, test de certification, drag freeroam non terminé, drift freeroam hors phase de conclusion, crawl freeroam (hors mission, non terminé/disqualifié), enfin livraison de carrière.
- Un identifiant d'activité n'est conservé que s'il fait au plus 256 caractères, sans caractère de contrôle ni espace en début/fin et ne contient que lettres, chiffres, _ . / : + - et espaces ; sinon il est omis (l'évènement reste émis).
- Le niveau doit correspondre à ^[%w_.-]+$ (128 caractères max) et, si trackedLevels est fourni, y figurer ; sinon capture renvoie nil.
- La position est arrondie à 0,1 m ; elle vient du véhicule du joueur 0, à défaut de la caméra (positionSource = vehicle ou camera). Sans position valide, capture renvoie nil.
- Tous les appels vers les autres modules sont protégés par pcall : une erreur donne simplement nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_performanceSpatialGameplayExit.capture(exitKind, currentActivity, trackedLevels, source)` | Construit l'évènement de sortie d'activité : name = "gameplayActivityExit", exitKind, level, position {x,y,z}, positionSource, plus activityType/activityId. | 146 |
| `telemetry_performanceSpatialGameplayExit.resolveActivity(source)` | Identifie l'activité de gameplay en cours selon l'ordre de priorité décrit dans les notes. | 52 |

### Détail des paramètres

#### `telemetry_performanceSpatialGameplayExit.capture(exitKind, currentActivity, trackedLevels, source)`

Construit l'évènement de sortie d'activité : name = "gameplayActivityExit", exitKind, level, position {x,y,z}, positionSource, plus activityType/activityId.

- `exitKind` (*string*) : abort, worldExit ou gameExit.
- `currentActivity` (*table|nil*) : Activité déjà résolue ({activityType, activityId}) ; sinon resolveActivity(source) est appelée.
- `trackedLevels` (*table<string, boolean>|nil*) : Ensemble des niveaux suivis ; hors de cet ensemble, rien n'est capturé.
- `source` (*table|nil*) : Source de modules injectable (_G par défaut).
- **renvoie** : table|nil Évènement prêt à envoyer, ou nil si une validation échoue.

#### `telemetry_performanceSpatialGameplayExit.resolveActivity(source)`

Identifie l'activité de gameplay en cours selon l'ordre de priorité décrit dans les notes.

- `source` (*table|nil*) : Table dont les champs jouent le rôle des modules du jeu (_G par défaut) ; sert aux tests.
- **renvoie** : table|nil {activityType, activityId} ou nil si aucune activité n'est en cours.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/performanceSpatialGameplayExit.lua`.*
