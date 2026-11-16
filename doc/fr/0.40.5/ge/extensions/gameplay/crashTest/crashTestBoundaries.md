# `gameplay_crashTest_crashTestBoundaries`

*Fichier : `lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crashTest_crashTestBoundaries` : `extensions.load("gameplay_crashTest_crashTestBoundaries")`, puis la globale `gameplay_crashTest_crashTestBoundaries`

Gère les limites de zone du scénario de test de collision (crash test). Charge un fichier .sites.json de la mission (bounds.sites.json, ou boundsStep<id>.sites.json si l'étape a son propre fichier) et vérifie à chaque image si le véhicule du joueur est hors de toutes les zones. Si oui, il appelle gameplay_crashTest_scenarioManager.onPlayerOutOfBounds(). Dessine aussi les zones en blanc, ou en rouge clignotant quand le joueur est dehors.

## Remarques

- Bug probable : dans checkOutOfBounds, la boucle 'for i = 0, 8' appelle toujours oobb:getPoint(0) au lieu de getPoint(i) ; seul le premier coin de la boîte est testé.
- Bug probable : setParameters teste params.drawBoundsWhenNear_ == nil (avec un underscore final) et met alors drawBoundsWhenNear à true ; le champ n'est donc jamais réellement lu et le dessin est activé dès qu'un fichier est donné.
- setDebug mémorise isBeingDebugged mais cette variable n'est jamais utilisée ailleurs.
- checkForStepBoundsFile contient un dump("new step") de debug laissé dans le code.
- Dépend de la mission au premier plan (gameplay_missions_missionManager) pour résoudre les chemins de fichiers de bornes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crashTest_crashTestBoundaries.deactivateBounds()` | Désactive les limites (équivaut à setParameters sans filePath). | 96 |
| `gameplay_crashTest_crashTestBoundaries.onNewCrashTestStep(stepData)` | Hook appelé au début d'une étape du crash test : charge le fichier de bornes de cette étape (ou bounds.sites.json par défaut). *(interne)* *(hook)* | 92 |
| `gameplay_crashTest_crashTestBoundaries.onUpdate()` | Hook appelé à chaque image : teste si le véhicule joueur est hors limites, prévient scenarioManager le cas échéant et dessine les limites. *(interne)* *(hook)* | 64 |
| `gameplay_crashTest_crashTestBoundaries.setDebug(debug)` | Mémorise un drapeau de debug (non exploité ailleurs dans le fichier). | 75 |
| `gameplay_crashTest_crashTestBoundaries.setParameters(params)` | Charge les zones de limites depuis un fichier de sites et les finalise. Sans filePath, supprime les limites et remet isPlayerOutOfBounds à false. | 16 |

### Détail des paramètres

#### `gameplay_crashTest_crashTestBoundaries.onNewCrashTestStep(stepData)`

Hook appelé au début d'une étape du crash test : charge le fichier de bornes de cette étape (ou bounds.sites.json par défaut).

- `stepData` (*table*) : Données de l'étape : id, hasStepBoundsFile.

#### `gameplay_crashTest_crashTestBoundaries.setDebug(debug)`

Mémorise un drapeau de debug (non exploité ailleurs dans le fichier).

- `debug` (*boolean*) : Drapeau de debug.

#### `gameplay_crashTest_crashTestBoundaries.setParameters(params)`

Charge les zones de limites depuis un fichier de sites et les finalise. Sans filePath, supprime les limites et remet isPlayerOutOfBounds à false.

- `params` (*table|nil*) : Table avec filePath (string) : chemin du fichier .sites.json ; drawBoundsWhenNear_ (voir notes).

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua`.*
