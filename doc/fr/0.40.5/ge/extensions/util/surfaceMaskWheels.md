# `util_surfaceMaskWheels`

*Fichier : `lua/ge/extensions/util/surfaceMaskWheels.lua` · VM : Game Engine (GE) · 559 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_surfaceMaskWheels` : `extensions.load("util_surfaceMaskWheels")`, puis la globale `util_surfaceMaskWheels`

Fait laisser aux roues du véhicule du joueur une trace dans le « surface mask » (SurfaceMaskClipmap, objet C++ qui garde un masque dynamique de la surface du terrain, par exemple l'herbe aplatie). Toutes les 0,05 s, pour chaque roue, il convertit la position (nœud d'axe de roue) en monde et appelle maskCircleWorld (premier contact) ou maskLineWorld (segment depuis la dernière position) avec une largeur de 1,8 m (3,2 m en mode tondeuse). Il possède aussi le cycle de vie du clipmap : stockage des tuiles sous /temp/levels/<niveau>/dynamicTiles, recentrage sur le véhicule, effacement. Il offre un mode tondeuse (particules d'herbe coupée) et des outils de débogage (ligne de console, fenêtre ImGui « SurfaceMask Pages », contours 3D des pages de 16 m). D'autres extensions (par exemple util_lawnMower) s'en servent comme service via isReady, setCenter, maskCircleWorld et maskLineWorld.

## Exemple

```lua
extensions.load('util_surfaceMaskWheels') -- actif dès le chargement (onExtensionLoaded appelle setEnabled(true))
util_surfaceMaskWheels.setMowingEnabled(true)
util_surfaceMaskWheels.setDebugMode(1) -- ligne de statistiques dans la console toutes les secondes
```

## Remarques

- Seul le véhicule du joueur 0 est traité ; les données (décalages des roues, positions précédentes) sont gardées par identifiant de véhicule et supprimées à onVehicleDestroyed et onVehicleResetted (reconstruction après reset ou changement de pièces).
- Paramètres internes (non exposés mais sérialisés) : maskInterval 0,05 s, maskWidth 1,8 m, mowerWidth 3,2 m, flattenStrength 1, markStrength 0,75, mowerMarkStrength 1, seuils de déplacement par intervalle minMoveSq 0,04 (0,2 m) et maxMoveSq 100 (10 m ; au-delà la roue est considérée comme téléportée et ignorée), pageWorldSize 16 m.
- Le mode tondeuse envoie à chaque tronçon marqué la commande obj:addParticleByNodesRelative (type de particule 21, 3 particules) au véhicule.
- Modes de débogage : 0 aucun, 1 ligne de console (tag surfaceMask) throttlée à 1 Hz, 2 fenêtre ImGui complète plus contours 3D des pages autour du véhicule. setDebugMode active la collecte de statistiques côté C++ seulement quand le mode est > 0.
- M.enabled vaut false à la déclaration mais onExtensionLoaded le met à true aussitôt ; onSerialize/onDeserialized conservent l'état entre rechargements (wheelMaskEnabled, interrupteur interne de test, n'est pas sérialisé).
- Toutes les fonctions qui touchent SurfaceMaskClipmap ne font rien si ce global n'existe pas (build sans clipmap) ; isReady() le vérifie.

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_surfaceMaskWheels.clear()` | Efface tout le surface mask (SurfaceMaskClipmap:clear()). | 448 |
| `util_surfaceMaskWheels.cycleDebug()` | Passe au mode de débogage suivant (0, 1, 2, puis retour à 0). | 538 |
| `util_surfaceMaskWheels.getPerformanceStats()` | Renvoie une copie des statistiques de performance côté Lua. | 512 |
| `util_surfaceMaskWheels.isReady()` | Indique si l'objet SurfaceMaskClipmap existe. Permet aux modules consommateurs de sauter leur travail. | 455 |
| `util_surfaceMaskWheels.maskCircleWorld(x, y, radius, flatten, mark)` | Estampille un disque dans le masque. | 463 |
| `util_surfaceMaskWheels.maskLineWorld(x1, y1, x2, y2, width, flatten, mark)` | Estampille un segment épais dans le masque. | 467 |
| `util_surfaceMaskWheels.onClientStartMission()` | Hook appelé au démarrage d'un niveau : repointe le stockage des tuiles du clipmap vers le niveau courant. *(interne)* *(hook)* | 427 |
| `util_surfaceMaskWheels.onDeserialized(data)` | Hook appelé après rechargement avec l'état sérialisé ; restaure les paramètres (taille de tuile de débogage limitée à 36). *(interne)* *(hook)* | 492 |
| `util_surfaceMaskWheels.onExtensionLoaded()` | Hook appelé au chargement de l'extension : active le module, coupe le débogage et initialise le stockage des tuiles. *(interne)* *(hook)* | 421 |
| `util_surfaceMaskWheels.onPreRender(dtReal, dtSim)` | Hook appelé à chaque frame avant le rendu : accumule le temps simulé, exécute le marquage des roues du véhicule du joueur à chaque maskInterval, puis le débogage éventuel. *(interne)* *(hook)* | 391 |
| `util_surfaceMaskWheels.onSerialize()` | Hook de sérialisation avant rechargement des extensions : renvoie l'état et les paramètres (enabled, largeurs, forces, seuils, mode de débogage, tondeuse, particules). *(interne)* *(hook)* | 471 |
| `util_surfaceMaskWheels.onVehicleDestroyed(vehId)` | Hook appelé quand un véhicule est détruit : supprime ses données de roues. *(interne)* *(hook)* | 431 |
| `util_surfaceMaskWheels.onVehicleResetted(vehId)` | Hook appelé après un reset de véhicule : supprime ses données de roues pour les reconstruire. *(interne)* *(hook)* | 435 |
| `util_surfaceMaskWheels.setCenter(x, y)` | Recentre le clipmap : le C++ sauvegarde les tuiles modifiées qui sortent et charge celles qui entrent. | 459 |
| `util_surfaceMaskWheels.setDebug(enabled)` | Compatibilité : true active le mode 2, false le mode 0. | 534 |
| `util_surfaceMaskWheels.setDebugMode(mode)` | Choisit le mode de débogage (0 aucun, 1 console, 2 fenêtre + 3D) ; la valeur est bornée à 0..2 et la première ligne de console est émise tout de suite. | 527 |
| `util_surfaceMaskWheels.setDebugPageRadius(radius)` | Fixe le rayon (en pages) de la grille de débogage affichée autour du véhicule (0 = page courante seulement). | 554 |
| `util_surfaceMaskWheels.setEnabled(enabled)` | Active ou désactive le marquage par les roues et remet à zéro le minuteur. | 439 |
| `util_surfaceMaskWheels.setMowerWidth(width)` | Fixe la largeur de coupe de la tondeuse. | 550 |
| `util_surfaceMaskWheels.setMowingEnabled(enabled)` | Active ou désactive le mode tondeuse (largeur 3,2 m, marquage 1, particules d'herbe). | 542 |
| `util_surfaceMaskWheels.toggle()` | Inverse l'état d'activation. | 444 |
| `util_surfaceMaskWheels.toggleMowing()` | Inverse le mode tondeuse. | 546 |

### Détail des paramètres

#### `util_surfaceMaskWheels.getPerformanceStats()`

Renvoie une copie des statistiques de performance côté Lua.

- **renvoie** : table {maskTicks, lastLuaFrameMs, avgLuaFrameMs, lastLuaMaskMs, avgLuaMaskMs, lastWheelCount, lastMovedWheels, lastSkippedWheels, lastMaskCalls, lastParticleCalls}.

#### `util_surfaceMaskWheels.isReady()`

Indique si l'objet SurfaceMaskClipmap existe. Permet aux modules consommateurs de sauter leur travail.

- **renvoie** : boolean true si SurfaceMaskClipmap est disponible.

#### `util_surfaceMaskWheels.maskCircleWorld(x, y, radius, flatten, mark)`

Estampille un disque dans le masque.

- `x` (*number*) : X monde du centre (m).
- `y` (*number*) : Y monde du centre (m).
- `radius` (*number*) : Rayon (m).
- `flatten` (*number*) : Force d'aplatissement de l'herbe (0 à 1 d'après les valeurs utilisées).
- `mark` (*number*) : Force de marquage (0 à 1 d'après les valeurs utilisées).

#### `util_surfaceMaskWheels.maskLineWorld(x1, y1, x2, y2, width, flatten, mark)`

Estampille un segment épais dans le masque.

- `x1` (*number*) : X monde du début (m).
- `y1` (*number*) : Y monde du début (m).
- `x2` (*number*) : X monde de la fin (m).
- `y2` (*number*) : Y monde de la fin (m).
- `width` (*number*) : Largeur du trait (m).
- `flatten` (*number*) : Force d'aplatissement.
- `mark` (*number*) : Force de marquage.

#### `util_surfaceMaskWheels.onDeserialized(data)`

Hook appelé après rechargement avec l'état sérialisé ; restaure les paramètres (taille de tuile de débogage limitée à 36).

- `data` (*table|nil*) : État sérialisé.

#### `util_surfaceMaskWheels.onPreRender(dtReal, dtSim)`

Hook appelé à chaque frame avant le rendu : accumule le temps simulé, exécute le marquage des roues du véhicule du joueur à chaque maskInterval, puis le débogage éventuel.

- `dtReal` (*number*) : Durée réelle de la frame (s).
- `dtSim` (*number*) : Durée simulée (s), prioritaire sur dtReal.

#### `util_surfaceMaskWheels.onSerialize()`

Hook de sérialisation avant rechargement des extensions : renvoie l'état et les paramètres (enabled, largeurs, forces, seuils, mode de débogage, tondeuse, particules).

- **renvoie** : table État à restaurer.

#### `util_surfaceMaskWheels.onVehicleDestroyed(vehId)`

Hook appelé quand un véhicule est détruit : supprime ses données de roues.

- `vehId` (*integer*) : Identifiant du véhicule.

#### `util_surfaceMaskWheels.onVehicleResetted(vehId)`

Hook appelé après un reset de véhicule : supprime ses données de roues pour les reconstruire.

- `vehId` (*integer*) : Identifiant du véhicule.

#### `util_surfaceMaskWheels.setCenter(x, y)`

Recentre le clipmap : le C++ sauvegarde les tuiles modifiées qui sortent et charge celles qui entrent.

- `x` (*number*) : Coordonnée X monde (m).
- `y` (*number*) : Coordonnée Y monde (m).

#### `util_surfaceMaskWheels.setDebug(enabled)`

Compatibilité : true active le mode 2, false le mode 0.

- `enabled` (*boolean*) : Activer le débogage complet.

#### `util_surfaceMaskWheels.setDebugMode(mode)`

Choisit le mode de débogage (0 aucun, 1 console, 2 fenêtre + 3D) ; la valeur est bornée à 0..2 et la première ligne de console est émise tout de suite.

- `mode` (*integer|nil*) : Mode de débogage.

#### `util_surfaceMaskWheels.setDebugPageRadius(radius)`

Fixe le rayon (en pages) de la grille de débogage affichée autour du véhicule (0 = page courante seulement).

- `radius` (*integer|nil*) : Rayon en pages, minimum 0.

#### `util_surfaceMaskWheels.setEnabled(enabled)`

Active ou désactive le marquage par les roues et remet à zéro le minuteur.

- `enabled` (*boolean*) : true pour activer.

#### `util_surfaceMaskWheels.setMowerWidth(width)`

Fixe la largeur de coupe de la tondeuse.

- `width` (*number|nil*) : Largeur en mètres ; nil conserve la valeur actuelle.

#### `util_surfaceMaskWheels.setMowingEnabled(enabled)`

Active ou désactive le mode tondeuse (largeur 3,2 m, marquage 1, particules d'herbe).

- `enabled` (*boolean*) : true pour activer.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extension chargée avant : ui_imgui. |
| `enabled` | boolean | true quand le marquage par les roues est actif (modifié par setEnabled/toggle). |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`
- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/surfaceMaskWheels.lua`.*
