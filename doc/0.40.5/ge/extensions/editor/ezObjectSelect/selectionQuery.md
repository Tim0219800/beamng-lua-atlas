# `editor_ezObjectSelect_selectionQuery`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua` · VM : Game Engine (GE) · 624 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_selectionQuery` : `extensions.load("editor_ezObjectSelect_selectionQuery")`, puis la globale `editor_ezObjectSelect_selectionQuery`

Requête de sélection de l'outil Easy Object Select. À partir de la position de la souris et de la caméra, il collecte les objets de la scène (StaticShape, StaticObject, véhicules) sous ou près du curseur, les résout vers leur prefab propriétaire, applique les filtres (classe, caché, verrouillé, bornes, motifs de nom, volume et distance max) et construit des « proxies » (géométrie écran) classés en relation « over » (curseur dessus) ou « discovery » (dans le rayon de découverte). Utilise le cache de selectionCache quand il est disponible, sinon un mode « broad » (rectangle écran + boîte autour de la caméra).

## Remarques

- Classes exclues d'office : TerrainBlock, WaterPlane, Forest ; l'objet nommé gameCamera est ignoré.
- Les motifs namePattern / ignorePattern sont des listes de motifs Lua (string.find) séparés par des virgules, testés sur le nom, le nom interne, le champ shapeName et le fichier modèle. Un motif invalide fait rejeter tous les objets (rejected.invalidPattern / invalidIgnorePattern).
- Rayon de requête large : max(discoveryPixels + 8, 128 * uiscale) ; distance proche par défaut 40 m (nearQueryDistance) ; discoveryPixels par défaut 48.
- Les raisons de rejet sont comptées dans la table rejected (unsupported, excludedClass, cameraObject, hidden, classDisabled, locked, selectionDisabled, invalidBounds, patternFilter, ignorePattern, outsideVolume, outsideRange, outsideDiscovery…).
- Fonction locale passesPatterns définie mais non utilisée dans ce fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_selectionQuery.activate()` | Active le cache de sélection (selectionCache.activate). Appelé à l'ouverture de l'outil. | 606 |
| `editor_ezObjectSelect_selectionQuery.gather(options)` | Collecte les candidats de sélection pour la frame courante. Renvoie nil si le contexte caméra est indisponible. Remplit proxies (relation over), discoveryProxies (relation discovery), filteredLarge (gros objets filtrés si options.collectFilteredLarge), queryStats, rejected et sourceCount. | 396 |
| `editor_ezObjectSelect_selectionQuery.getCacheStatus()` | Renvoie l'état du cache de sélection (selectionCache.getStatus), utile pour l'affichage de debug. | 614 |
| `editor_ezObjectSelect_selectionQuery.invalidateCache(reason)` | Invalide le cache de sélection. | 610 |
| `editor_ezObjectSelect_selectionQuery.validatePatternList(value)` | Vérifie qu'une liste de motifs Lua séparés par des virgules est valide (chaque entrée est testée avec pcall(string.find)). | 618 |

### Détail des paramètres

#### `editor_ezObjectSelect_selectionQuery.gather(options)`

Collecte les candidats de sélection pour la frame courante. Renvoie nil si le contexte caméra est indisponible. Remplit proxies (relation over), discoveryProxies (relation discovery), filteredLarge (gros objets filtrés si options.collectFilteredLarge), queryStats, rejected et sourceCount.

- `options` (*table|nil*) : discoveryPixels (px, défaut 48), nearQueryDistance (m, défaut 40), maxDistance (m), maxVolume (m^3), namePattern, ignorePattern (listes de motifs Lua séparés par des virgules), collectFilteredLarge (boolean).
- **renvoie** : table|nil Table {camera, mouse, queryRadius, discoveryRadius, nearQueryDistance, proxies, discoveryProxies, filteredLarge, queryStats, rejected, sourceCount}.

#### `editor_ezObjectSelect_selectionQuery.getCacheStatus()`

Renvoie l'état du cache de sélection (selectionCache.getStatus), utile pour l'affichage de debug.

- **renvoie** : table État du cache.

#### `editor_ezObjectSelect_selectionQuery.invalidateCache(reason)`

Invalide le cache de sélection.

- `reason` (*string|nil*) : Raison de l'invalidation (diagnostic).

#### `editor_ezObjectSelect_selectionQuery.validatePatternList(value)`

Vérifie qu'une liste de motifs Lua séparés par des virgules est valide (chaque entrée est testée avec pcall(string.find)).

- `value` (*string|nil*) : Liste de motifs, séparés par des virgules.
- **renvoie** : boolean true si tous les motifs sont valides.
- **renvoie** : string|nil Message d'erreur « entry N: … » si invalide.

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `obj:` `getClassName`, `getField`, `getID`, `getInternalName`, `getModelFile`, `getName`, `getObjBox`, `getWorldBox`, `isHidden`, `isLocked`
- `scenetree.` `findObjectById`
- `ui_imgui.` `GetMousePos`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua`.*
