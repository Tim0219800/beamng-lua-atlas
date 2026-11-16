# `flowgraph_modules_cameraModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/cameraModule.lua` · VM : Game Engine (GE) · 141 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/cameraModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder -500, donc l'un des premiers) qui gère les trajectoires de caméra (camPath) pendant un projet. Il charge un fichier <nom>/<nom>.camPath.json relatif au projet via core_paths.loadPath, ou stocke un chemin fourni en mémoire, puis le joue avec core_paths.playPath. Il suit le chemin actif, le nombre de fins de parcours (completions) et le mode boucle.

## Remarques

- Les chemins sont identifiés par un id entier local au module (getFreeId) et indexés par nom dans pathIds.
- Bug (copier-coller) : getCmd renvoie une commande qui appelle le module 'button' (buttonClicked) ; inutilisable pour la caméra.
- afterTrigger contient un bloc scheduleAction vide.
- isPathComplete provoque une erreur si activePathId == id mais completions est nil (ne devrait pas arriver après startPath).
- getPathDuration lit le temps du dernier marqueur ; erreur si le chemin n'a aucun marqueur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_cameraModule.addCustomPath(name, path, force)` | Enregistre un chemin déjà construit sous un nom. Sans force, renvoie l'id existant si le nom est déjà connu. (assignée dynamiquement) | dyn |
| `flowgraph_modules_cameraModule.afterTrigger()` | Appelé après le tick du graphe : finalise les variables. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_cameraModule.cancelPathCam()` | Arrête le chemin de caméra en cours (core_paths.stopCurrentPath). (assignée dynamiquement) | dyn |
| `flowgraph_modules_cameraModule.clear()` | Réinitialise le chemin actif, les complétions et les tables de chemins stockés. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_cameraModule.endActivePath(id)` | Arrête le chemin actif (si id est nil ou égal à l'actif) et efface l'état. (assignée dynamiquement) | dyn |
| `flowgraph_modules_cameraModule.executionStopped()` | Appelé à l'arrêt du projet : arrête la caméra de chemin si active puis appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_cameraModule.findPath(name)` | Renvoie l'id du chemin de ce nom, en le chargeant si besoin depuis <nom>/<nom>.camPath.json (résolu par mgr:getRelativeAbsolutePath). Journalise une erreur si le fichier est introuvable. (assignée dynamiquement) | dyn |
| `flowgraph_modules_cameraModule.finishedPath()` | Callback appelé par core_paths en fin de parcours : sans boucle, arrête la caméra ; dans tous les cas incrémente completions. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_cameraModule.getCmd(id)` | Construit une commande Lua pour le module 'button' (voir notes : copier-coller probable). (assignée dynamiquement) | dyn |
| `flowgraph_modules_cameraModule.getFreeId()` | Incrémente et renvoie un id. (assignée dynamiquement) | dyn |
| `flowgraph_modules_cameraModule.getPath(id)` | Renvoie la table du chemin stocké. (assignée dynamiquement) | dyn |
| `flowgraph_modules_cameraModule.getPathDuration(id)` | Durée du chemin = temps du dernier marqueur, 0 si le chemin est inconnu. (assignée dynamiquement) | dyn |
| `flowgraph_modules_cameraModule.getUniqueName(prefix)` | Renvoie prefix..'-'..id unique. (assignée dynamiquement) | dyn |
| `flowgraph_modules_cameraModule.init()` | Crée le variableStorage et appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_cameraModule.isPathComplete(id)` | Vrai si ce chemin est le chemin actif et a été terminé au moins une fois. (assignée dynamiquement) | dyn |
| `flowgraph_modules_cameraModule.restartActivePath(id)` | Relance le chemin actif avec le même réglage de boucle (si id est nil ou égal à l'actif). (assignée dynamiquement) | dyn |
| `flowgraph_modules_cameraModule.startPath(id, loop)` | Passe en caméra de jeu si la caméra libre est active, puis joue le chemin avec core_paths.playPath (useDtReal = true) et mémorise l'id, la boucle et complétions = 0. Ne fait rien si l'id est inconnu. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_cameraModule.addCustomPath(name, path, force)`

Enregistre un chemin déjà construit sous un nom. Sans force, renvoie l'id existant si le nom est déjà connu. (assignée dynamiquement)

- `name` (*string*) : nom
- `path` (*table*) : chemin de caméra (avec markers)
- `force` (*boolean|nil*) : remplacer le nom existant
- **renvoie** : integer id du chemin

#### `flowgraph_modules_cameraModule.endActivePath(id)`

Arrête le chemin actif (si id est nil ou égal à l'actif) et efface l'état. (assignée dynamiquement)

- `id` (*integer|nil*) : id attendu

#### `flowgraph_modules_cameraModule.findPath(name)`

Renvoie l'id du chemin de ce nom, en le chargeant si besoin depuis <nom>/<nom>.camPath.json (résolu par mgr:getRelativeAbsolutePath). Journalise une erreur si le fichier est introuvable. (assignée dynamiquement)

- `name` (*string*) : nom du chemin / dossier
- **renvoie** : integer id du chemin

#### `flowgraph_modules_cameraModule.getCmd(id)`

Construit une commande Lua pour le module 'button' (voir notes : copier-coller probable). (assignée dynamiquement)

- `id` (*integer*) : id
- **renvoie** : string code Lua

#### `flowgraph_modules_cameraModule.getFreeId()`

Incrémente et renvoie un id. (assignée dynamiquement)

- **renvoie** : integer id

#### `flowgraph_modules_cameraModule.getPath(id)`

Renvoie la table du chemin stocké. (assignée dynamiquement)

- `id` (*integer*) : id du chemin
- **renvoie** : table|nil chemin

#### `flowgraph_modules_cameraModule.getPathDuration(id)`

Durée du chemin = temps du dernier marqueur, 0 si le chemin est inconnu. (assignée dynamiquement)

- `id` (*integer*) : id du chemin
- **renvoie** : number durée (s)

#### `flowgraph_modules_cameraModule.getUniqueName(prefix)`

Renvoie prefix..'-'..id unique. (assignée dynamiquement)

- `prefix` (*string*) : préfixe
- **renvoie** : string nom unique

#### `flowgraph_modules_cameraModule.isPathComplete(id)`

Vrai si ce chemin est le chemin actif et a été terminé au moins une fois. (assignée dynamiquement)

- `id` (*integer*) : id du chemin
- **renvoie** : boolean terminé

#### `flowgraph_modules_cameraModule.restartActivePath(id)`

Relance le chemin actif avec le même réglage de boucle (si id est nil ou égal à l'actif). (assignée dynamiquement)

- `id` (*integer|nil*) : id attendu

#### `flowgraph_modules_cameraModule.startPath(id, loop)`

Passe en caméra de jeu si la caméra libre est active, puis joue le chemin avec core_paths.playPath (useDtReal = true) et mémorise l'id, la boucle et complétions = 0. Ne fait rien si l'id est inconnu. (assignée dynamiquement)

- `id` (*integer*) : id du chemin
- `loop` (*boolean|nil*) : rejouer en boucle

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:addCustomPath(name, path, force)` |  | 48 |
| `C:afterTrigger()` |  | 127 |
| `C:cancelPathCam()` |  | 92 |
| `C:clear()` |  | 25 |
| `C:endActivePath(id)` |  | 104 |
| `C:executionStopped()` |  | 134 |
| `C:findPath(name)` |  | 34 |
| `C:finishedPath()` |  | 96 |
| `C:getCmd(id)` |  | 122 |
| `C:getFreeId()` |  | 11 |
| `C:getPath(id)` |  | 57 |
| `C:getPathDuration(id)` |  | 61 |
| `C:getUniqueName(prefix)` |  | 16 |
| `C:init()` |  | 20 |
| `C:isPathComplete(id)` |  | 65 |
| `C:restartActivePath(id)` |  | 114 |
| `C:startPath(id, loop)` |  | 69 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/cameraModule.lua`.*
