# `editor_ezObjectSelect_selectionModel`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua` · VM : Game Engine (GE) · 355 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_selectionModel` : `extensions.load("editor_ezObjectSelect_selectionModel")`, puis la globale `editor_ezObjectSelect_selectionModel`

Modèle de sélection de l'outil « Easy Object Select » de l'éditeur. À chaque frame il interroge selectionQuery.gather, regroupe les candidats sous le curseur en pile (empilement d'objets), choisit automatiquement le gagnant (avec hystérésis pour éviter le clignotement), et gère le cycle manuel à la molette ainsi que le « gel » du pick. Il produit un snapshot (camera, mouse, candidates, pick, activeIndex, cycleActive, stackCount…) lu par les modules de dessin et d'interaction.

## Remarques

- État temporel (cible automatique, cycle, pick gelé) conservé dans un upvalue local ; activate() et deactivate() le remettent à zéro.
- Le cycle de molette se réinitialise quand la souris sort de la zone morte (cycleDeadZone, 6 px par défaut) ou quand la caméra a bougé (cycleShouldReset).
- Si le premier candidat est plus loin que options.maxStackDistance, la pile est réduite à ce seul candidat (stackLimited = true) et le cycle est annulé.
- Le sens du cycle : wheelDelta > 0 recule d'un cran dans la pile, wheelDelta < 0 avance (modulo stackCount).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_selectionModel.activate()` | Réinitialise l'état temporel (cible automatique, cycle, pick gelé, snapshot) et active le cache de selectionQuery. À appeler à l'ouverture de l'outil. | 204 |
| `editor_ezObjectSelect_selectionModel.cycle(wheelDelta)` | Fait avancer le pick actif dans la pile de candidats suivant le sens de la molette. Sans effet s'il y a moins de 2 candidats ou si wheelDelta vaut 0. Mémorise l'ancre souris et la caméra pour détecter plus tard un mouvement. | 311 |
| `editor_ezObjectSelect_selectionModel.deactivate()` | Réinitialise l'état temporel (cible, cycle, pick gelé, snapshot) à la fermeture de l'outil. | 209 |
| `editor_ezObjectSelect_selectionModel.freezePick()` | Fige le pick actuel : tant qu'il est gelé, il reste la cible même si le curseur bouge (utile pendant un glisser). | 332 |
| `editor_ezObjectSelect_selectionModel.getSnapshot()` | Renvoie le dernier snapshot calculé par update. | 346 |
| `editor_ezObjectSelect_selectionModel.invalidateCache(reason)` | Invalide le cache de sélection de selectionQuery (le cache sera reconstruit à la prochaine requête). | 350 |
| `editor_ezObjectSelect_selectionModel.releasePick()` | Libère le pick gelé par freezePick. | 340 |
| `editor_ezObjectSelect_selectionModel.update(options)` | Calcule le snapshot de la frame : appelle selectionQuery.gather(options), groupe et trie les candidats, applique la limite de pile, gère la réinitialisation du cycle, le pick gelé et le gagnant automatique. Renvoie un snapshot vide si la requête échoue (pas de caméra). | 213 |

### Détail des paramètres

#### `editor_ezObjectSelect_selectionModel.cycle(wheelDelta)`

Fait avancer le pick actif dans la pile de candidats suivant le sens de la molette. Sans effet s'il y a moins de 2 candidats ou si wheelDelta vaut 0. Mémorise l'ancre souris et la caméra pour détecter plus tard un mouvement.

- `wheelDelta` (*number*) : Delta de molette ; > 0 recule dans la pile, < 0 avance.
- **renvoie** : table|nil Le snapshot courant (modifié en place), ou nil s'il n'y en a pas.

#### `editor_ezObjectSelect_selectionModel.freezePick()`

Fige le pick actuel : tant qu'il est gelé, il reste la cible même si le curseur bouge (utile pendant un glisser).

- **renvoie** : table|nil Le candidat gelé, ou nil s'il n'y a pas de pick.

#### `editor_ezObjectSelect_selectionModel.getSnapshot()`

Renvoie le dernier snapshot calculé par update.

- **renvoie** : table|nil Snapshot courant.

#### `editor_ezObjectSelect_selectionModel.invalidateCache(reason)`

Invalide le cache de sélection de selectionQuery (le cache sera reconstruit à la prochaine requête).

- `reason` (*string|nil*) : Raison de l'invalidation (diagnostic).

#### `editor_ezObjectSelect_selectionModel.update(options)`

Calcule le snapshot de la frame : appelle selectionQuery.gather(options), groupe et trie les candidats, applique la limite de pile, gère la réinitialisation du cycle, le pick gelé et le gagnant automatique. Renvoie un snapshot vide si la requête échoue (pas de caméra).

- `options` (*table|nil*) : Options transmises à gather (discoveryPixels, nearQueryDistance, maxDistance, maxVolume, namePattern, ignorePattern, collectFilteredLarge) plus preferUnselected (boolean : favoriser les objets non sélectionnés), maxStackDistance (number, m) et cycleDeadZone (number, px).
- **renvoie** : table Snapshot : camera, mouse, queryRadius, discoveryRadius, nearQueryDistance, candidates, discovery, filteredLarge, queryStats, rejected, sourceCount, stackCount, stackLimited, activeIndex, pick, cycleActive, cycleAnchor, cycleDeadZone, frozenTargetId.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua`.*
