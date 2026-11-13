# `aiDebugDraw`

*Fichier : `lua/vehicle/aiDebugDraw.lua` · VM : Véhicule · 447 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("aiDebugDraw")`

Dessin de debug de l'IA véhicule (sphères, cylindres, textes via obj.debugDrawProxy). Chargé par ai.lua (require 'aiDebugDraw') ; ai.setVehicleDebugMode l'active ou le coupe selon ai.debugMode. Il lit un contexte (ego, twt, route courante, carte, scriptai…) fourni par ai.lua via setContextBinder, et n'écrit que dans ai.debugDraw (fonction appelée par la boucle principale pour dessiner). Un moddeur ne l'appelle normalement pas directement.

## Remarques

- Modes dessinés d'après ai.debugMode : 'target', 'route', 'speeds', 'trajectory', 'rays'. En mode 'script' avec scriptai actif, scriptai.debugDraw() est aussi appelé.
- enable() initialise le contexte au premier appel (via le binder), puis remplace ai.debugDraw par la fonction de dessin ; disable() remet ai.debugDraw = nop.
- Bug mineur : dans onDebugModeChanged, quand le mode n'est pas 'speeds' c'est visDebug.trajecRec qui est vidé (et non un tampon propre aux vitesses), même si ce tampon est déjà vidé hors 'trajectory'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `aiDebugDraw.disable()` | Désactive le dessin debug (ai.debugDraw = nop). | 442 |
| `aiDebugDraw.enable()` | Active le dessin debug : lie le contexte si nécessaire puis place la fonction de dessin dans ai.debugDraw. | 435 |
| `aiDebugDraw.init(context)` | Stocke le contexte utilisé par le dessin. *(interne)* | 409 |
| `aiDebugDraw.onDebugModeChanged(debugMode)` | Hook appelé par ai.setVehicleDebugMode quand le mode debug change : vide les historiques de dessin (trajectoire, route) qui ne correspondent plus au mode choisi. *(interne)* *(hook)* | 413 |
| `aiDebugDraw.reset()` | Vide les historiques de dessin (trajectoire et route). Appelée par ai.setMode. *(interne)* | 428 |
| `aiDebugDraw.setContextBinder(fn)` | Enregistre la fonction qui construira le contexte (ego, twt, accès route/carte/scriptai, castRay…) au premier enable(). *(interne)* | 405 |

### Détail des paramètres

#### `aiDebugDraw.init(context)`

Stocke le contexte utilisé par le dessin.

- `context` (*table*) : Table avec ego, twt, lastCommand, player (fonction), getCurrentRoute, getMapData, getScriptai, roadNaturalContinuation, castRay, populateOBBinRange.

#### `aiDebugDraw.onDebugModeChanged(debugMode)`

Hook appelé par ai.setVehicleDebugMode quand le mode debug change : vide les historiques de dessin (trajectoire, route) qui ne correspondent plus au mode choisi.

- `debugMode` (*string*) : Nouveau ai.debugMode ('off', 'target', 'route', 'speeds', 'trajectory', 'rays', 'all').

#### `aiDebugDraw.setContextBinder(fn)`

Enregistre la fonction qui construira le contexte (ego, twt, accès route/carte/scriptai, castRay…) au premier enable().

- `fn` (*function*) : Fonction sans argument qui appelle aiDebugDraw.init(context).

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawText`
- `obj:` `getObjectFrontPosition`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/aiDebugDraw.lua`.*
