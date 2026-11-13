# `ui_arrowGPS.test`

*Fichier : `lua/ge/extensions/ui/arrowGPS.test.lua` · VM : Game Engine (GE) · 182 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_arrowGPS.test` : `extensions.load("ui_arrowGPS.test")`, puis la globale `ui_arrowGPS.test`

Tests unitaires de l'extension ui_arrowGPS (flèche GPS flottante à l'écran). Le fichier charge arrowGPS.lua dans un environnement simulé (faux createObject TSStatic, faux core_camera, GFXDevice, scenetree) via loadfile + setfenv, puis vérifie la création paresseuse de la flèche, sa réutilisation, sa couleur, sa rotation vers la cible de plus haute priorité et sa recréation après suppression de l'objet. Utile à un moddeur pour comprendre le contrat de ui_arrowGPS (setTarget, removeTarget, setScale, setDepth, setAppScreenPos, onPreRender).

## Exemple

```lua
require('testFramework/TestManager'):runTestFiles('ui/arrowGPS')
```

## Remarques

- Ce n'est pas une extension de jeu : le module est exécuté par testFramework/TestManager, pas par extensions.load.
- Chaque test reçoit un contexte ctx (assert, assertEqual, assertNear) fourni par le TestManager.
- Contrat déduit des tests : la flèche n'est créée qu'au premier onPreRender avec une cible ET un véhicule joueur ; la plus petite valeur de priorité l'emporte (priorité 1 devant 10) ; le shape utilisé est art/shapes/interface/s_mm_arrow_floating.dae et la couleur par défaut est '1 0.4 0.2 1'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_arrowGPS.test.testIdleExtensionDoesNotCreateArrow(ctx)` | Vérifie qu'aucun objet n'est créé tant qu'aucune cible valide (avec pos) n'est posée : onPreRender, setTarget sans pos, removeTarget et onExtensionUnloaded ne créent rien. *(interne)* | 54 |
| `ui_arrowGPS.test.testPriorityColorAndTargetRemoval(ctx)` | Vérifie que la cible de priorité la plus basse (1) dicte la couleur et la direction de la flèche, que removeTarget bascule sur la cible suivante, et que la flèche est masquée quand il n'y a plus de cible. *(interne)* | 97 |
| `ui_arrowGPS.test.testRenderedArrowIsReusedAndHidesWithoutPlayer(ctx)` | Vérifie la couleur et le shape par défaut, que la flèche est masquée quand le joueur disparaît puis réaffichée, sans recréation (un seul objet créé). *(interne)* | 81 |
| `ui_arrowGPS.test.testSceneDeletionRecreatesArrowWithoutTargetUpdate(ctx)` | Vérifie que si l'objet de scène est supprimé, onPreRender recrée la flèche en conservant couleur et échelle (setScale), sans nouvel appel à setTarget. *(interne)* | 115 |
| `ui_arrowGPS.test.testSettingsBeforeCreationAffectFirstRender(ctx)` | Vérifie que setScale, setDepth et setAppScreenPos appelés avant la création de la flèche sont pris en compte dès le premier rendu (échelle 0.08, profondeur 0.3, position écran 0.75/0.25). *(interne)* | 145 |
| `ui_arrowGPS.test.testTargetUpdateAfterSceneDeletionDoesNotUseOldObject(ctx)` | Vérifie qu'un setTarget/setScale après suppression de l'objet n'accède pas à l'ancien objet (le faux objet lève une erreur sinon) et que la recréation a lieu au onPreRender suivant. *(interne)* | 131 |
| `ui_arrowGPS.test.testTargetWaitsForPlayerAndRender(ctx)` | Vérifie que la flèche attend un véhicule joueur et un onPreRender : sans joueur rien n'est créé, dès que le joueur existe la flèche est créée et visible. *(interne)* | 68 |
| `ui_arrowGPS.test.testUnloadClearsObjectAndTargetState(ctx)` | Vérifie que onExtensionUnloaded supprime l'objet et vide l'état des cibles, et que l'extension reste utilisable ensuite avec de nouvelles cibles. *(interne)* | 162 |

### Détail des paramètres

#### `ui_arrowGPS.test.testIdleExtensionDoesNotCreateArrow(ctx)`

Vérifie qu'aucun objet n'est créé tant qu'aucune cible valide (avec pos) n'est posée : onPreRender, setTarget sans pos, removeTarget et onExtensionUnloaded ne créent rien.

- `ctx` (*table*) : Contexte de test du TestManager.

#### `ui_arrowGPS.test.testPriorityColorAndTargetRemoval(ctx)`

Vérifie que la cible de priorité la plus basse (1) dicte la couleur et la direction de la flèche, que removeTarget bascule sur la cible suivante, et que la flèche est masquée quand il n'y a plus de cible.

- `ctx` (*table*) : Contexte de test du TestManager.

#### `ui_arrowGPS.test.testRenderedArrowIsReusedAndHidesWithoutPlayer(ctx)`

Vérifie la couleur et le shape par défaut, que la flèche est masquée quand le joueur disparaît puis réaffichée, sans recréation (un seul objet créé).

- `ctx` (*table*) : Contexte de test du TestManager.

#### `ui_arrowGPS.test.testSceneDeletionRecreatesArrowWithoutTargetUpdate(ctx)`

Vérifie que si l'objet de scène est supprimé, onPreRender recrée la flèche en conservant couleur et échelle (setScale), sans nouvel appel à setTarget.

- `ctx` (*table*) : Contexte de test du TestManager.

#### `ui_arrowGPS.test.testSettingsBeforeCreationAffectFirstRender(ctx)`

Vérifie que setScale, setDepth et setAppScreenPos appelés avant la création de la flèche sont pris en compte dès le premier rendu (échelle 0.08, profondeur 0.3, position écran 0.75/0.25).

- `ctx` (*table*) : Contexte de test du TestManager.

#### `ui_arrowGPS.test.testTargetUpdateAfterSceneDeletionDoesNotUseOldObject(ctx)`

Vérifie qu'un setTarget/setScale après suppression de l'objet n'accède pas à l'ancien objet (le faux objet lève une erreur sinon) et que la recréation a lieu au onPreRender suivant.

- `ctx` (*table*) : Contexte de test du TestManager.

#### `ui_arrowGPS.test.testTargetWaitsForPlayerAndRender(ctx)`

Vérifie que la flèche attend un véhicule joueur et un onPreRender : sans joueur rien n'est créé, dès que le joueur existe la flèche est créée et visible.

- `ctx` (*table*) : Contexte de test du TestManager.

#### `ui_arrowGPS.test.testUnloadClearsObjectAndTargetState(ctx)`

Vérifie que onExtensionUnloaded supprime l'objet et vide l'état des cibles, et que l'extension reste utilisable ensuite avec de nouvelles cibles.

- `ctx` (*table*) : Contexte de test du TestManager.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/arrowGPS.test.lua`.*
