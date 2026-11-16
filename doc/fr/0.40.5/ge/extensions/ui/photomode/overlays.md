# `ui_photomode_overlays`

*Fichier : `lua/ge/extensions/ui/photomode/overlays.lua` · VM : Game Engine (GE) · 553 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_overlays` : `extensions.load("ui_photomode_overlays")`, puis la globale `ui_photomode_overlays`

Gestion des « overlays » du mode photo : des superpositions d'images (cadres, filigranes, applis UI) décrites par un dossier contenant overlay.json, une vignette overlay.png facultative et des images. Le module découvre les overlays sous /ui/ui-vue/src/modules/pause/views/photomode/overlays, les met en cache, permet de les créer, cloner, renommer, enregistrer et supprimer (seulement ceux du dossier utilisateur) et diffuse l'évènement UI PhotomodeOverlaysChanged à chaque changement. Il fournit aussi la liste des applis UI et des textures de livrée utilisables comme calques.

## Exemple

```lua
local res = ui_photomode_overlays.createOverlay("mon_cadre", {name = "Mon cadre", author = "moi", layers = {}})
if not res.ok then log('W', 'x', res.reason) end
```

## Remarques

- Les fonctions d'écriture renvoient toujours une table {ok = boolean, reason = string, id = string}. Raisons possibles : invalid_id, invalid_payload, invalid_source_id, invalid_dest_id, dest_id_exists, not_found, source_not_found, not_editable, write_failed, copy_overlay_json_failed, copy_asset_failed:<image>, clone_failed, rename_failed.
- Un identifiant d'overlay valide ne contient que des lettres, chiffres, tiret et underscore (^[%w%-_]+$) : il devient le nom du dossier.
- Un overlay est éditable (editable = true) seulement s'il ne vient pas d'une archive (zip) et si son chemin réel est dans le dossier utilisateur ; les overlays fournis par le jeu ne sont donc ni modifiables ni supprimables, mais clonables.
- overlay.json doit contenir un version numérique et un name non vide, sinon l'overlay est ignoré avec un warning ; layers devient {} s'il est absent. name est passé à _tr à la lecture.
- Le cache est invalidé par onFilesChanged dès qu'un fichier sous le dossier des overlays change. Chaque entrée porte un champ ts (horodatage de cache) et hasThumbnail ajoutés à la lecture.
- saveOverlay retire de la charge utile id, images, editable et folderPath avant d'écrire, mais pas hasThumbnail ni ts : si l'UI renvoie une entrée complète, ces deux champs sont écrits dans overlay.json (renameOverlay, lui, les retire).
- renameOverlay avec un nouvel identifiant copie le dossier, réécrit overlay.json puis supprime l'ancien dossier ; si l'identifiant est inchangé, seul le nom est réécrit.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_overlays.cloneOverlay(sourceId, destId)` | Copie un overlay (overlay.json, vignette et images) vers un nouveau dossier. Fonctionne aussi pour les overlays non éditables. | 288 |
| `ui_photomode_overlays.createOverlay(destId, payload)` | Crée un nouveau dossier d'overlay avec un overlay.json (version 1, name = destId, author vide, layers vides par défaut, surchargés par version, name, author et layers de la charge utile). | 251 |
| `ui_photomode_overlays.deleteOverlay(id)` | Supprime le dossier d'un overlay éditable (overlay.json, vignette, images) puis invalide le cache et diffuse PhotomodeOverlaysChanged. | 494 |
| `ui_photomode_overlays.discover()` | Force une nouvelle découverte des overlays (recherche récursive de overlay.json), remplace le cache et renvoie la liste triée par nom. Chaque entrée contient les champs de overlay.json plus id, images, editable, folderPath, hasThumbnail, ts. | 206 |
| `ui_photomode_overlays.getOverlays()` | Renvoie les overlays en cache, en lançant la découverte si le cache est vide. | 211 |
| `ui_photomode_overlays.listLiveryGraphics()` | Parcourt /art/dynamicDecals/textures (png, jpg, jpeg) et regroupe les images par tags lus dans le fichier compagnon <image>.dynDecalTexture.json. Les images sans tag vont dans la catégorie « others ». Catégories et images sont triées sans tenir compte de la casse. | 443 |
| `ui_photomode_overlays.listUiApps()` | Liste les applis UI disponibles comme calques via ui_apps.getUIAppsData() : appName, displayName, description, category, première prévisualisation, photomode (booléen) et css (left, top, width, height en chaînes, valeurs par défaut 0px, 0px, 320px, 48px). Les applis compatibles mode photo viennent en premier, puis tri par nom. Renvoie une liste vide si ui_apps est indisponible. | 401 |
| `ui_photomode_overlays.onExtensionLoaded()` | Hook appelé au chargement de l'extension : vide le cache et réarme la découverte initiale. *(interne)* *(hook)* | 536 |
| `ui_photomode_overlays.onExtensionUnloaded()` | Hook appelé au déchargement : vide le cache. *(interne)* *(hook)* | 541 |
| `ui_photomode_overlays.onFilesChanged(files)` | Hook appelé par le moteur quand des fichiers changent. Si l'un des chemins est sous le dossier des overlays, invalide le cache et diffuse PhotomodeOverlaysChanged. *(interne)* *(hook)* | 525 |
| `ui_photomode_overlays.onUiReady()` | Hook appelé quand l'UI est prête : lance une seule fois la découverte des overlays pour préremplir le cache. *(interne)* *(hook)* | 545 |
| `ui_photomode_overlays.renameOverlay(sourceId, destId, newName)` | Renomme un overlay éditable : change son nom affiché et/ou son identifiant (donc son dossier). Avec un nouvel identifiant, copie les fichiers, met à jour name dans le nouvel overlay.json et supprime l'ancien dossier. | 316 |
| `ui_photomode_overlays.saveOverlay(id, payload)` | Écrit la charge utile dans overlay.json d'un overlay existant et éditable, puis invalide le cache et diffuse PhotomodeOverlaysChanged. | 215 |

### Détail des paramètres

#### `ui_photomode_overlays.cloneOverlay(sourceId, destId)`

Copie un overlay (overlay.json, vignette et images) vers un nouveau dossier. Fonctionne aussi pour les overlays non éditables.

- `sourceId` (*string*) : Identifiant de l'overlay à copier
- `destId` (*string*) : Identifiant de la copie (valide et inexistant)
- **renvoie** : table {ok = true, id = destId} ou {ok = false, reason = ...}

#### `ui_photomode_overlays.createOverlay(destId, payload)`

Crée un nouveau dossier d'overlay avec un overlay.json (version 1, name = destId, author vide, layers vides par défaut, surchargés par version, name, author et layers de la charge utile).

- `destId` (*string*) : Identifiant du nouvel overlay (doit être valide et inexistant)
- `payload` (*table|nil*) : Valeurs initiales facultatives
- **renvoie** : table {ok = true, id = destId} ou {ok = false, reason = ...}

#### `ui_photomode_overlays.deleteOverlay(id)`

Supprime le dossier d'un overlay éditable (overlay.json, vignette, images) puis invalide le cache et diffuse PhotomodeOverlaysChanged.

- `id` (*string*) : Identifiant de l'overlay
- **renvoie** : table {ok = true} ou {ok = false, reason = ...}

#### `ui_photomode_overlays.discover()`

Force une nouvelle découverte des overlays (recherche récursive de overlay.json), remplace le cache et renvoie la liste triée par nom. Chaque entrée contient les champs de overlay.json plus id, images, editable, folderPath, hasThumbnail, ts.

- **renvoie** : table[] Liste d'overlays

#### `ui_photomode_overlays.getOverlays()`

Renvoie les overlays en cache, en lançant la découverte si le cache est vide.

- **renvoie** : table[] Liste d'overlays

#### `ui_photomode_overlays.listLiveryGraphics()`

Parcourt /art/dynamicDecals/textures (png, jpg, jpeg) et regroupe les images par tags lus dans le fichier compagnon <image>.dynDecalTexture.json. Les images sans tag vont dans la catégorie « others ». Catégories et images sont triées sans tenir compte de la casse.

- **renvoie** : table[] Catégories {value, label, items = {{name, label, path}}}

#### `ui_photomode_overlays.listUiApps()`

Liste les applis UI disponibles comme calques via ui_apps.getUIAppsData() : appName, displayName, description, category, première prévisualisation, photomode (booléen) et css (left, top, width, height en chaînes, valeurs par défaut 0px, 0px, 320px, 48px). Les applis compatibles mode photo viennent en premier, puis tri par nom. Renvoie une liste vide si ui_apps est indisponible.

- **renvoie** : table[] Applis triées

#### `ui_photomode_overlays.onFilesChanged(files)`

Hook appelé par le moteur quand des fichiers changent. Si l'un des chemins est sous le dossier des overlays, invalide le cache et diffuse PhotomodeOverlaysChanged.

- `files` (*table*) : Liste d'éléments {filename = ...}

#### `ui_photomode_overlays.renameOverlay(sourceId, destId, newName)`

Renomme un overlay éditable : change son nom affiché et/ou son identifiant (donc son dossier). Avec un nouvel identifiant, copie les fichiers, met à jour name dans le nouvel overlay.json et supprime l'ancien dossier.

- `sourceId` (*string*) : Identifiant actuel
- `destId` (*string*) : Nouvel identifiant (peut être identique à sourceId)
- `newName` (*string|nil*) : Nouveau nom affiché ; ignoré si vide, l'ancien nom est alors conservé
- **renvoie** : table {ok = true, id = ...} ou {ok = false, reason = ...}

#### `ui_photomode_overlays.saveOverlay(id, payload)`

Écrit la charge utile dans overlay.json d'un overlay existant et éditable, puis invalide le cache et diffuse PhotomodeOverlaysChanged.

- `id` (*string*) : Identifiant (nom de dossier) de l'overlay
- `payload` (*table*) : Nouveau contenu de overlay.json (version, name, author, layers…)
- **renvoie** : table {ok = true} ou {ok = false, reason = ...}

**Évènements UI (guihooks.trigger) :** `PhotomodeOverlaysChanged`

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `directoryCreate`, `directoryRemove`, `fileExists`, `findFiles`, `getFileRealPath`, `getOriginArchivePathRelative`, `getUserPath`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/overlays.lua`.*
