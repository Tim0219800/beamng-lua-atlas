# `editor_util_zoneSelectorUtil`

*Fichier : `lua/ge/extensions/editor/util/zoneSelectorUtil.lua` · VM : Game Engine (GE) · 304 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/zoneSelectorUtil")` (fichier sous extensions/ mais pas une extension classique)

Élément d'interface de l'éditeur de missions (via editorElementHelper) pour choisir des zones de garage : « Initial Zones » (où le joueur peut apparaître) et « Destination Zones » (où il peut obtenir des destinations). Les noms de zones sont lus dans `<globalInfoFolder>/garages.sites.json` via gameplay_sites_sitesManager.loadSites. Le module renvoie un constructeur : `require('editor/util/zoneSelectorUtil')(element)`.

## Remarques

- L'`element` est une table de configuration partagée (champs lus : fieldName, globalInfoFolderFieldName, _id ; champs écrits : initialZones, destinationZones, loadedZones, sitesFile, zonesLoaded, caches).
- Les listes choisies sont écrites dans le conteneur de données ctd sous les clés `<fieldName>_initialZones` et `<fieldName>_destinationZones`.
- Si le dossier est vide, le fichier garages.sites.json absent ou sitesManager indisponible, la liste de zones reste vide et un message jaune s'affiche.
- Le fichier de sites est toujours nommé garages.sites.json ; les zones sont triées alphabétiquement.
- Les ensembles de recherche rapide sont mis en cache et reconstruits seulement quand la taille du tableau change.

## Classe `C`

Instance liée à un `element` d'éditeur.

Le module renvoie un constructeur : `local obj = require("editor_util_zoneSelectorUtil")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw(ctd, container, labelFn)` | Dessine l'interface : combos d'ajout, boutons Select All / Remove All, listes avec bouton Remove, résumé. Écrit les listes dans ctd. | 93 |
| `C:init(element)` | Constructeur : mémorise l'élément. | 11 |
| `C:loadZonesFromSitesFile(ctd)` | Charge les noms de zones depuis `<dossier global>/garages.sites.json` (une seule fois par fichier) dans element.loadedZones. | 15 |
| `C:setContainer(ctd)` | Lit initialZones/destinationZones depuis ctd et réinitialise l'état de chargement pour forcer un rechargement. | 82 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/zoneSelectorUtil.lua`.*
