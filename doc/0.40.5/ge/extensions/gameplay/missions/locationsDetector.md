# `gameplay_missions_locationsDetector`

*Fichier : `lua/ge/extensions/gameplay/missions/locationsDetector.lua` · VM : Game Engine (GE) · 58 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_locationsDetector` : `extensions.load("gameplay_missions_locationsDetector")`, puis la globale `gameplay_missions_locationsDetector`

Détecte les missions dont le cluster de marqueurs contient la position donnée du joueur. getNearbyLocations parcourt les clusters de gameplay_missions_clustering (avec le rayon de fusion de la grande carte si elle est active) et renvoie, pour chaque mission trouvée, son type, l'objet mission, le cluster et l'id. La partie « missions d'arrière-plan » est commentée dans le fichier.

## Remarques

- Le test de proximité est defaultLocationCheck : cluster.pos et cluster.radius doivent exister et distance(playerPosition, cluster.pos) <= cluster.radius.
- Le tableau renvoyé est réutilisé à chaque appel (vidé par table.clear) : ne pas le conserver entre deux appels.
- Incohérence : M.onPoiTriggered et M.isEnabled sont assignés à des variables locales jamais définies : ces champs valent nil.
- missionsChanged est toujours false : getMissionsAtLocation renvoie la variable changed qui n'est jamais modifiée (le code qui la mettait à jour est commenté).
- Le paramètre accessible de getNearbyLocations vient d'une variable non définie (nil) et est de toute façon forcé à true dans getMissionsAtLocation ; la variable p (profileur) y est testée comme globale, nil si non définie.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_locationsDetector.getNearbyLocations(level, playerPosition)` | Renvoie les missions dont un cluster contient la position du joueur. | 43 |

### Détail des paramètres

#### `gameplay_missions_locationsDetector.getNearbyLocations(level, playerPosition)`

Renvoie les missions dont un cluster contient la position du joueur.

- `level` (*string*) : Identifiant du niveau (transmis à la fonction de test, non utilisé).
- `playerPosition` (*vec3*) : Position du joueur.
- **renvoie** : table {missions = {{type, mission, location, id}, ...}, missionsChanged = false}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `isEnabled` | nil | Toujours nil : référence à une variable locale non définie. ⚠ référence `isEnabled` non définie dans le fichier (vaut probablement nil) |
| `onPoiTriggered` | nil | Toujours nil : référence à une variable locale non définie. ⚠ référence `onPoiTriggered` non définie dans le fichier (vaut probablement nil) |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/locationsDetector.lua`.*
