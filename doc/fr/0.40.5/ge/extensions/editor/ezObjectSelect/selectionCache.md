# `editor_ezObjectSelect_selectionCache`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua` · VM : Game Engine (GE) · 110 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_selectionCache` : `extensions.load("editor_ezObjectSelect_selectionCache")`, puis la globale `editor_ezObjectSelect_selectionCache`

Cache de sélection de l'outil Easy Select. Il ne reconstruit les données de sélection (liste de « proxies » projetés) qu'une fois la caméra immobile depuis 0,12 s, ou après une invalidation ou un changement de configuration. États possibles : waiting, moving, building, ready.

## Remarques

- La caméra est comparée à la précédente (position, rangeOrigin, forward, up, halfTan, largeur/hauteur) ; le moindre changement remet l'état à « moving » et supprime les données.
- Les temps sont mesurés avec hptimer ; buildTime est la valeur retournée par timer:stopAndReset() (secondes ou ms selon hptimer, non précisé ici).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_selectionCache.activate()` | Réinitialise complètement l'état du cache (statut waiting). | 45 |
| `editor_ezObjectSelect_selectionCache.getStatus()` | Renvoie un instantané de l'état du cache pour le debug. | 97 |
| `editor_ezObjectSelect_selectionCache.invalidate(reason)` | Supprime les données en cache et relance le délai de stabilisation. | 49 |
| `editor_ezObjectSelect_selectionCache.setClassificationTime(milliseconds)` | Enregistre la durée de classification pour l'affichage de debug. | 93 |
| `editor_ezObjectSelect_selectionCache.update(camera, configKey, build)` | À appeler à chaque frame. Renvoie nil tant que la caméra bouge, que la configuration vient de changer ou que le délai de 0,12 s n'est pas écoulé ; ensuite appelle build() une seule fois et renvoie ses données, puis les renvoie telles quelles. | 56 |

### Détail des paramètres

#### `editor_ezObjectSelect_selectionCache.getStatus()`

Renvoie un instantané de l'état du cache pour le debug.

- **renvoie** : table {status, reason, targetCount (nombre de proxies), buildTime, classificationTime}

#### `editor_ezObjectSelect_selectionCache.invalidate(reason)`

Supprime les données en cache et relance le délai de stabilisation.

- `reason` (*string|nil*) : Raison, stockée pour le debug (défaut « invalidated »)

#### `editor_ezObjectSelect_selectionCache.setClassificationTime(milliseconds)`

Enregistre la durée de classification pour l'affichage de debug.

- `milliseconds` (*number|nil*) : Durée en ms (0 si nil)

#### `editor_ezObjectSelect_selectionCache.update(camera, configKey, build)`

À appeler à chaque frame. Renvoie nil tant que la caméra bouge, que la configuration vient de changer ou que le délai de 0,12 s n'est pas écoulé ; ensuite appelle build() une seule fois et renvoie ses données, puis les renvoie telles quelles.

- `camera` (*table*) : Contexte caméra (pos, rangeOrigin, forward, up, halfTan, width, height)
- `configKey` (*any*) : Clé de configuration ; si elle change, le cache est invalidé (raison « settings »)
- `build` (*function*) : Fonction sans argument qui construit les données (attend une table pouvant contenir proxies)
- **renvoie** : table|nil Données construites ou nil si non prêtes

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua`.*
