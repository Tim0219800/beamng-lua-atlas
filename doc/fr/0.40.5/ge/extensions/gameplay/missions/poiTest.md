# `gameplay_missions_poiTest`

*Fichier : `lua/ge/extensions/gameplay/missions/poiTest.lua` · VM : Game Engine (GE) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_poiTest` : `extensions.load("gameplay_missions_poiTest")`, puis la globale `gameplay_missions_poiTest`

Extension de test du système de points d'intérêt (POI). Elle ajoute un POI factice « poiTest » sur chaque place de parking définie dans le fichier gameplay/parkingSpotTests.sites.json, et un bouton « Do the Test » dans la fenêtre de détail du POI qui affiche seulement « Test Successfull! » dans le log. Elle ne sert qu'aux développeurs du jeu pour tester gameplay_markerInteraction / rawPois ; un moddeur peut s'en inspirer comme exemple minimal de fournisseur de POI.

## Exemple

```lua
-- Exemple minimal d'un fournisseur de POI (même structure que poiTest)
local function onGetRawPoiListForLevel(levelIdentifier, elements)
  table.insert(elements, {id='monPoi', pos=vec3(0,0,0), rot=quat(0,0,0,1), scl=vec3(1,1,1), radius=3, visibleInPlayMode=true, interactableInPlayMode=true, clusterType='parkingMarker', data={type='monPoi', id='monPoi', name='Mon POI'}})
end
```

## Remarques

- Le fichier de sites gameplay/parkingSpotTests.sites.json est chargé via gameplay_sites_sitesManager.loadSites à chaque appel de onGetRawPoiListForLevel ; s'il n'existe pas, l'accès à .parkingSpots.sorted peut lever une erreur (déduit du code).
- Chaque POI créé a pour id « Test-PS-<id de la place> », un rayon de 3 et clusterType « parkingMarker ».
- À son chargement, onExtensionLoaded vide le cache de gameplay_markerInteraction pour forcer la reconstruction de la liste des POI.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_poiTest.onExtensionLoaded()` | Appelé au chargement de l'extension : vide le cache de gameplay_markerInteraction (clearCache) pour que les POI de test apparaissent. *(interne)* *(hook)* | 50 |
| `gameplay_missions_poiTest.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook appelé par le système de POI (gameplay_rawPois) quand il reconstruit la liste des POI d'un niveau. Ajoute dans `elements` un POI de type « poiTest » par place de parking du fichier de test (champs id, pos, rot, scl, radius=3, visibleInPlayMode, interactableInPlayMode, clusterType, data). *(interne)* *(hook)* | 7 |
| `gameplay_missions_poiTest.onPoiDetailPromptOpening(elemData, promptData)` | Hook appelé à l'ouverture de la fenêtre de détail d'un POI. Si un des éléments est de type « poiTest », ajoute dans `promptData` un bouton « Do the Test » dont l'action écrit « Test Successfull! » dans la console. *(interne)* *(hook)* | 31 |

### Détail des paramètres

#### `gameplay_missions_poiTest.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook appelé par le système de POI (gameplay_rawPois) quand il reconstruit la liste des POI d'un niveau. Ajoute dans `elements` un POI de type « poiTest » par place de parking du fichier de test (champs id, pos, rot, scl, radius=3, visibleInPlayMode, interactableInPlayMode, clusterType, data).

- `levelIdentifier` (*string*) : Identifiant du niveau (non utilisé par cette fonction).
- `elements` (*table*) : Liste de POI à compléter (table.insert).

#### `gameplay_missions_poiTest.onPoiDetailPromptOpening(elemData, promptData)`

Hook appelé à l'ouverture de la fenêtre de détail d'un POI. Si un des éléments est de type « poiTest », ajoute dans `promptData` un bouton « Do the Test » dont l'action écrit « Test Successfull! » dans la console.

- `elemData` (*table*) : Liste des données (`data`) des POI sous le curseur / dans le cluster.
- `promptData` (*table*) : Liste des boutons à compléter ({label, buttonText, buttonFun}).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/poiTest.lua`.*
