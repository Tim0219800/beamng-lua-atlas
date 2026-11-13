# `gameplay_drift_stuntZones`

*Fichier : `lua/ge/extensions/gameplay/drift/stuntZones.lua` · VM : Game Engine (GE) · 394 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_stuntZones` : `extensions.load("gameplay_drift_stuntZones")`, puis la globale `gameplay_drift_stuntZones`

Gestionnaire des zones de cascade (stunt zones) du mode drift/Gymkhana. setStuntZones(zones) crée un objet par zone en chargeant le sous-module du type demandé (donut, driftThrough, hitPole, nearPole, dans gameplay/drift/stuntZones/<type>) ; ensuite, à chaque frame, tant que le joueur drifte, il appelle detectStunt() des zones disponibles où il se trouve. Quand une zone est réussie, elle émet onAnyStuntZoneAccomplished, que ce module relaie vers le stallingSystem et vers un sous-hook (onDonutDriftAccomplished, onDriftThroughAccomplished, onHitPoleAccomplished, onNearPoleAccomplished) pris en charge par gameplay_drift_scoring. Chargé par gameplay_drift_general en contexte inChallenge ; les zones viennent de gameplay_drift_saveLoad.loadDriftData.

## Exemple

```lua
gameplay_drift_stuntZones.setStuntZones({
  {type = "donut", cooldown = 8, pos = vec3(0, 0, 0), scl = 10},
  {type = "hitPole", pos = vec3(-10, 0, 0)}
})
```

## Remarques

- Format d'une zone : {type, pos = vec3, scl, rot = quat, cooldown, score?}. donut : scl = rayon en m (nombre) ; driftThrough : scl = vec3 de demi-dimensions et rot = quat ; hitPole/nearPole : seulement pos (un poteau « delineator » est spawné).
- Distance « near » pour le hook onNearStuntZoneFirst(stuntZone) : scl + 6 si scl est un nombre, max(scl.x, y, z) + 4 si c'est un vec3, 6 sinon ; émis une seule fois par type de zone (aide à l'écran).
- Si la zone n'a pas de champ score, il est rempli avec scoreOptions.defaultPoints[type] ; mais le score réellement attribué vient de gameplay_drift_scoring.getStuntZoneBasePoints(type) (les sous-modules n'utilisent pas zoneData.score).
- Les zones ne sont évaluées que si le drift n'est ni en pause ni gelé, et si le joueur a un véhicule (doesPlHaveVeh).
- onSerialize appelle clear() : les poteaux spawnés sont supprimés avant un rechargement Lua. onExtensionUnloaded fait de même.
- Quand le joueur arrête de drifter, le compteur d'angle des donuts est remis à zéro (onDriftStatusChanged).
- increaseDecalPool utilise une variable globale decals qui n'est pas déclarée dans ce fichier : à n'appeler que si elle existe ailleurs (elle n'est pas appelée dans ce fichier).
- getDecalColor contient des conditions du type ((t * 100) or (100 - t * 100)) toujours vraies sur le premier opérande : la seconde branche n'est jamais utilisée.

**Dépendances (chargées avant) :** `gameplay_drift_general`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_stuntZones.clear()` | Supprime toutes les zones (poteaux et marqueurs inclus) et oublie les types de zones déjà approchés. | 215 |
| `gameplay_drift_stuntZones.clearStuntZone(id)` | INTERNE : supprime une zone par id (appelle son clear s'il existe, puis la retire de la liste). Utilisé par les poteaux détruits. *(interne)* | 299 |
| `gameplay_drift_stuntZones.getDecalColor(cooldownPerc, filledPerc, t)` | Choisit la couleur d'un segment du cercle d'un donut : bleu (portion remplie), vert (prête), rouge/blanc (pendant le cooldown). | 63 |
| `gameplay_drift_stuntZones.getDrawLines()` | TEST : indique si le tracé des zones est activé (case imgui « Draw lines », vrai par défaut). | 333 |
| `gameplay_drift_stuntZones.getDriftDebugInfo()` | Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift. | 349 |
| `gameplay_drift_stuntZones.getGreenColor()` | Couleur verte (zone prête). | 337 |
| `gameplay_drift_stuntZones.getLineThickness(linePos)` | Épaisseur de ligne de debug en fonction de la distance à la caméra (250 / distance). | 353 |
| `gameplay_drift_stuntZones.getRedColor()` | Couleur rouge (cooldown). | 345 |
| `gameplay_drift_stuntZones.getStuntZones()` | Renvoie la liste des objets de zone instanciés (chaque objet a data = {id, zoneData, nearDist, drawData}, activeData et les méthodes du type). | 312 |
| `gameplay_drift_stuntZones.getWhiteColor()` | Couleur blanche (cooldown). | 341 |
| `gameplay_drift_stuntZones.increaseDecalPool(max)` | Agrandit le pool global de decals jusqu'à max éléments (flèche rouge, fade 100 à 150). Dépend d'une variable globale decals non définie ici. | 48 |
| `gameplay_drift_stuntZones.onAnyStuntZoneAccomplished(data)` | Hook : une zone est réussie ; informe le stallingSystem (processStuntZone) puis relaie le sous-hook demandé avec ses données. *(interne)* *(hook)* | 361 |
| `gameplay_drift_stuntZones.onDriftDebugChanged()` | Hook : réactive le dessin des zones quand le debug change. *(interne)* *(hook)* | 357 |
| `gameplay_drift_stuntZones.onDriftStatusChanged(isDrifting)` | Hook : quand le drift s'arrête, remet à zéro l'angle cumulé des zones donut. *(interne)* *(hook)* | 289 |
| `gameplay_drift_stuntZones.onExtensionUnloaded()` | Hook : supprime toutes les zones au déchargement. *(interne)* *(hook)* | 316 |
| `gameplay_drift_stuntZones.onSerialize()` | Hook : supprime toutes les zones avant un rechargement Lua (ne renvoie aucune donnée). *(interne)* *(hook)* | 320 |
| `gameplay_drift_stuntZones.onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame : fenêtre de debug, puis (hors pause/gel) pour chaque zone disponible détecte l'approche (onNearStuntZoneFirst), appelle detectStunt() si le joueur drifte dans la zone, puis onUpdate de la zone et gestion du cooldown. *(interne)* *(hook)* | 167 |
| `gameplay_drift_stuntZones.onVehicleDestroyed(vehId)` | Hook : relaie la destruction d'un véhicule aux zones (les poteaux détruits se retirent). *(interne)* *(hook)* | 325 |
| `gameplay_drift_stuntZones.reset()` | Appelle reset() sur chaque zone (cooldowns, compteurs, poteaux remis en place). | 209 |
| `gameplay_drift_stuntZones.setStuntZones(zones)` | Remplace toutes les zones par la liste donnée : vide les zones existantes (clear), calcule la distance « near », le score par défaut et les données de dessin, puis instancie chaque zone via require("gameplay/drift/stuntZones/<type>"). Les ids sont attribués de 1 à n. | 224 |

### Détail des paramètres

#### `gameplay_drift_stuntZones.clearStuntZone(id)`

INTERNE : supprime une zone par id (appelle son clear s'il existe, puis la retire de la liste). Utilisé par les poteaux détruits.

- `id` (*integer*) : Id de la zone.

#### `gameplay_drift_stuntZones.getDecalColor(cooldownPerc, filledPerc, t)`

Choisit la couleur d'un segment du cercle d'un donut : bleu (portion remplie), vert (prête), rouge/blanc (pendant le cooldown).

- `cooldownPerc` (*number|nil*) : Pourcentage de cooldown écoulé (100 = prêt).
- `filledPerc` (*number|nil*) : Pourcentage du tour déjà effectué.
- `t` (*number*) : Position du segment sur le cercle, de 0 à 1.
- **renvoie** : ColorF Couleur du segment.

#### `gameplay_drift_stuntZones.getDrawLines()`

TEST : indique si le tracé des zones est activé (case imgui « Draw lines », vrai par défaut).

- **renvoie** : boolean true si on dessine.

#### `gameplay_drift_stuntZones.getDriftDebugInfo()`

Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift.

- **renvoie** : table {default = true, canBeChanged = true}

#### `gameplay_drift_stuntZones.getGreenColor()`

Couleur verte (zone prête).

- **renvoie** : ColorF Vert.

#### `gameplay_drift_stuntZones.getLineThickness(linePos)`

Épaisseur de ligne de debug en fonction de la distance à la caméra (250 / distance).

- `linePos` (*vec3*) : Position du point de la ligne.
- **renvoie** : number Épaisseur.

#### `gameplay_drift_stuntZones.getRedColor()`

Couleur rouge (cooldown).

- **renvoie** : ColorF Rouge.

#### `gameplay_drift_stuntZones.getStuntZones()`

Renvoie la liste des objets de zone instanciés (chaque objet a data = {id, zoneData, nearDist, drawData}, activeData et les méthodes du type).

- **renvoie** : table[] Zones actives.

#### `gameplay_drift_stuntZones.getWhiteColor()`

Couleur blanche (cooldown).

- **renvoie** : ColorF Blanc.

#### `gameplay_drift_stuntZones.increaseDecalPool(max)`

Agrandit le pool global de decals jusqu'à max éléments (flèche rouge, fade 100 à 150). Dépend d'une variable globale decals non définie ici.

- `max` (*integer*) : Taille minimale voulue du pool.

#### `gameplay_drift_stuntZones.onAnyStuntZoneAccomplished(data)`

Hook : une zone est réussie ; informe le stallingSystem (processStuntZone) puis relaie le sous-hook demandé avec ses données.

- `data` (*table*) : {stuntZoneId, subHookName, subHookData}.

#### `gameplay_drift_stuntZones.onDriftStatusChanged(isDrifting)`

Hook : quand le drift s'arrête, remet à zéro l'angle cumulé des zones donut.

- `isDrifting` (*boolean*) : Nouvel état de drift.

#### `gameplay_drift_stuntZones.onUpdate(dtReal, dtSim, dtRaw)`

Appelé à chaque frame : fenêtre de debug, puis (hors pause/gel) pour chaque zone disponible détecte l'approche (onNearStuntZoneFirst), appelle detectStunt() si le joueur drifte dans la zone, puis onUpdate de la zone et gestion du cooldown.

- `dtReal` (*number*) : Delta temps réel.
- `dtSim` (*number*) : Delta temps simulé (cooldowns).
- `dtRaw` (*number*) : Delta temps brut (inutilisé).

#### `gameplay_drift_stuntZones.onVehicleDestroyed(vehId)`

Hook : relaie la destruction d'un véhicule aux zones (les poteaux détruits se retirent).

- `vehId` (*integer*) : Véhicule détruit.

#### `gameplay_drift_stuntZones.setStuntZones(zones)`

Remplace toutes les zones par la liste donnée : vide les zones existantes (clear), calcule la distance « near », le score par défaut et les données de dessin, puis instancie chaque zone via require("gameplay/drift/stuntZones/<type>"). Les ids sont attribués de 1 à n.

- `zones` (*table[]*) : Liste de {type, pos, scl, rot, cooldown, score}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, chargé avant. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onNearStuntZoneFirst`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/stuntZones.lua`.*
