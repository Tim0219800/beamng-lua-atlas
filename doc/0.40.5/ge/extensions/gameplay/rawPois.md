# `gameplay_rawPois`

*Fichier : `lua/ge/extensions/gameplay/rawPois.lua` · VM : Game Engine (GE) · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rawPois` : `extensions.load("gameplay_rawPois")`, puis la globale `gameplay_rawPois`

Cache des points d'intérêt « bruts » (POI) par niveau. Il collecte les POI en émettant le hook `onGetRawPoiListForLevel(levelIdentifier, elements)` auprès de toutes les extensions, filtre la liste selon le contexte (carrière/tutoriel, essai routier, livraison, tutoriels de découverte, multi-siège) et met le résultat en cache avec un numéro de génération. Un moddeur qui ajoute des POI implémente le hook dans son extension et ajoute ses éléments à la table reçue.

## Exemple

```lua
-- dans une extension
M.onGetRawPoiListForLevel = function(level, elements)
  table.insert(elements, {id = 'monPoi', data = {type = 'monType', id = 'monPoi'}, clusterType = 'x', markerInfo = {}})
end
```

## Remarques

- Un élément valide doit avoir `data` avec `id` ou `missionId`, un `clusterType`, et `markerInfo` ; la boucle de filtrage standard accède à e.markerInfo.bigmapMarker sans vérifier markerInfo, donc un élément sans markerInfo provoque une erreur.
- validateRawPoiElement est défini mais jamais appelé ; il ne passe pas valid à false quand clusterType manque (seul le log signale le problème).
- Avec le multi-siège actif, seuls les éléments dont un markerInfo[type].multiseat == true sont gardés. Un changement d'état multi-siège vide le cache.
- En carrière sur west_coast_usa : pendant le tutoriel, seul le hook onGetRawPoiListForTutorial est utilisé ; avant l'achat du véhicule de départ, seuls les POI de type dealership, inspectVehicle et computer sont renvoyés (non mis en cache).
- Le champ bigmapMarker.cluster vaut true par défaut quand il n'est pas défini.
- Si une liste blanche de types est active (test drive : testDriveEnd ; livraison : deliveryTargetArea, deliveryVehicle ; tutoriels de découverte : tutorialLesson, firstDriveDestination…), seuls ces types (ou ids de mission en liste blanche) sont conservés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rawPois.clear()` | Vide le cache des POI de tous les niveaux et incrémente le numéro de génération (les consommateurs détectent ainsi qu'il faut recharger). | 11 |
| `gameplay_rawPois.getRawPoiGeneration()` | Numéro de génération courant du cache (après synchronisation de l'état multi-siège). | 188 |
| `gameplay_rawPois.getRawPoiListByLevel(levelIdentifier)` | Renvoie la liste filtrée des POI d'un niveau, en la construisant (hook onGetRawPoiListForLevel) si elle n'est pas en cache. | 75 |

### Détail des paramètres

#### `gameplay_rawPois.getRawPoiGeneration()`

Numéro de génération courant du cache (après synchronisation de l'état multi-siège).

- **renvoie** : integer Génération.

#### `gameplay_rawPois.getRawPoiListByLevel(levelIdentifier)`

Renvoie la liste filtrée des POI d'un niveau, en la construisant (hook onGetRawPoiListForLevel) si elle n'est pas en cache.

- `levelIdentifier` (*string|nil*) : Identifiant du niveau ; si nil, renvoie une liste vide.
- **renvoie** : table[] Liste d'éléments POI.
- **renvoie** : integer Numéro de génération.

## Champs

| Champ | Type | Description |
|---|---|---|
| `onModManagerReady` | function | Alias de clear : le cache est vidé quand le gestionnaire de mods est prêt. |
| `showMissionMarkersToggled` | function | Alias de clear : le cache est vidé quand l'affichage des marqueurs de mission change. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGetRawPoiListForLevel` — écouté par 15 module(s)
- `onGetRawPoiListForTutorial` — écouté par 4 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rawPois.lua`.*
