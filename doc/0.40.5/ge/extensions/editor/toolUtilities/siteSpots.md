# `editor_toolUtilities_siteSpots`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteSpots.lua` · VM : Game Engine (GE) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteSpots` : `extensions.load("editor_toolUtilities_siteSpots")`, puis la globale `editor_toolUtilities_siteSpots`

Places de stationnement telles qu'un site les porte et telles que le niveau les relit dans son fichier de sites. Une place n'est ni de la géométrie ni de la peinture : c'est une boîte que le jeu cherche quand il veut garer une voiture. Elle ne va donc pas dans une coque, mais dans city.sites.json du niveau (champ parkingSpots), seule sortie d'une cuisson de site qui n'est pas un fichier à elle. Elle attend la « gravure » : cuites en local et écrites à ce moment, les copies d'un parking ont chacune leurs places à leur endroit et à leur hauteur.

## Remarques

- Place cuite : { x, y, yaw, w (largeur d'une place), d (profondeur), n (nombre de places du run, absent pour une place seule), dir ('Left' si le run avance à gauche) }. Seule la position est recentrée ; le cap reste, place y ajoute celui du placement.
- Un run de places identiques côte à côte est écrit comme UNE multi-place (isMultiSpot, spotAmount = n, spotOffset = 0 car les places sont jointes bord à bord, spotDirection 'Right' par défaut) comme le font les places de villes faites à la main.
- SPOT_H = 3 : hauteur de la boîte ; la position est au sol et la boîte s'étend d'une demi-hauteur de chaque côté.
- Le fichier est <dossier du niveau>/city.sites.json (getMissionFilename). Si absent ou illisible, un fichier de sites vide est créé en mémoire { name = 'sites', description, locations, zones, parkingSpots }.
- write ajoute au lieu de remplacer : noms prefix + numéro (en sautant ceux déjà pris) et oldId au-delà du plus grand existant, pour que deux gravures et une place faite à la main cohabitent.
- write renvoie nil sans place à écrire ou sans niveau chargé (sitesPath nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteSpots.localise(list, ox, oy)` | Les places calculées par le solveur d'un site, locales à l'origine de cuisson. Chaque place entre sous la forme { x, y, yaw, w, d, n, dir } et sort arrondie au millimètre, n et dir omis pour une place simple droite. Renvoie nil si la liste est vide. | 38 |
| `editor_toolUtilities_siteSpots.place(rec, px, py, yaw, ox, oy, groundZ)` | L'inverse : les places du manifeste comme enregistrements parkingSpot (pos, rot, scl = {largeur, profondeur, SPOT_H}, isMultiSpot, spotAmount, spotOffset, spotDirection, spotRotation, color, customFields), posées là où se trouve un placement et tournées sur son cap. (ox, oy) est le pivot du site (milieu de son empreinte). groundZ(x, y) donne la hauteur du sol, car une place repose sur le sol où elle est et non sur le repère du placement. Aucun nom ici : ils doivent être uniques dans tout le fichier du niveau et sont attribués par write. | 62 |
| `editor_toolUtilities_siteSpots.restore(undo)` | Annule un write : remet le tableau parkingSpots exactement comme il était. | 145 |
| `editor_toolUtilities_siteSpots.write(spots, prefix)` | Ajoute des places au fichier de sites du niveau, sous des noms commençant par prefix, en conservant l'existant. Écrit le fichier avec jsonWriteFile. | 108 |

### Détail des paramètres

#### `editor_toolUtilities_siteSpots.localise(list, ox, oy)`

Les places calculées par le solveur d'un site, locales à l'origine de cuisson. Chaque place entre sous la forme { x, y, yaw, w, d, n, dir } et sort arrondie au millimètre, n et dir omis pour une place simple droite. Renvoie nil si la liste est vide.

- `list` (*table|nil*) : Liste de places { x, y, yaw, w, d, n, dir }.
- `ox` (*number|nil*) : x de l'origine (défaut 0).
- `oy` (*number|nil*) : y de l'origine (défaut 0).
- **renvoie** : table|nil Liste de places locales.

#### `editor_toolUtilities_siteSpots.place(rec, px, py, yaw, ox, oy, groundZ)`

L'inverse : les places du manifeste comme enregistrements parkingSpot (pos, rot, scl = {largeur, profondeur, SPOT_H}, isMultiSpot, spotAmount, spotOffset, spotDirection, spotRotation, color, customFields), posées là où se trouve un placement et tournées sur son cap. (ox, oy) est le pivot du site (milieu de son empreinte). groundZ(x, y) donne la hauteur du sol, car une place repose sur le sol où elle est et non sur le repère du placement. Aucun nom ici : ils doivent être uniques dans tout le fichier du niveau et sont attribués par write.

- `rec` (*table|nil*) : Places du manifeste.
- `px` (*number*) : x du placement.
- `py` (*number*) : y du placement.
- `yaw` (*number|nil*) : Cap en radians (défaut 0).
- `ox` (*number|nil*) : x du pivot (défaut 0).
- `oy` (*number|nil*) : y du pivot (défaut 0).
- `groundZ` (*function|nil*) : groundZ(x, y) renvoie la hauteur du sol (0 si absent).
- **renvoie** : table|nil Liste d'enregistrements parkingSpot, nil si vide.

#### `editor_toolUtilities_siteSpots.restore(undo)`

Annule un write : remet le tableau parkingSpots exactement comme il était.

- `undo` (*table|nil*) : Table renvoyée par write.

#### `editor_toolUtilities_siteSpots.write(spots, prefix)`

Ajoute des places au fichier de sites du niveau, sous des noms commençant par prefix, en conservant l'existant. Écrit le fichier avec jsonWriteFile.

- `spots` (*table|nil*) : Enregistrements parkingSpot renvoyés par place ; leur name et oldId sont renseignés par cet appel.
- `prefix` (*string*) : Préfixe des noms de places.
- **renvoie** : table|nil { path, prev } : ce qu'il faut pour annuler (le tableau tel qu'il était), ou nil s'il n'y avait rien à ajouter.

## Champs

| Champ | Type | Description |
|---|---|---|
| `SPOT_H` | number | Hauteur de la boîte d'une place, en mètres (3). |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteSpots.lua`.*
