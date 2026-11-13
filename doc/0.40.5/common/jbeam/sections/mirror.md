# `jbeam_sections_mirror`

*Fichier : `lua/common/jbeam/sections/mirror.lua` · VM : Commun (GE + véhicule) · 62 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/mirror")`

Traite la section jbeam « mirrors » (rétroviseurs). Pour chaque entrée ayant un champ mesh, enregistre le rétroviseur dans le moteur (addMirror avec mesh, idRef, id1, id2) et récupère l'id obtenu dans v.id, puis configure l'objet miroir : offset (refBaseTranslation ou offset), normal (déduite de baseRotationGlobal en degrés ou de normal) et offsetNormal (champs dépréciés). Les entrées sans mesh sont considérées comme de vieilles données.

## Remarques

- baseRotationGlobal est en degrés {x, y, z} ; la normale est obtenue en tournant le vecteur (0,1,0).
- Les champs offsetRotationGlobal et offsetNormal sont dépréciés : ils déclenchent un message d'erreur de migration dans le journal mais restent appliqués. Un normal fourni directement journalise aussi un message de migration.
- Si addMirror renvoie un id négatif, l'entrée est ignorée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_mirror.process(objID, vehicleObj, vehicle)` | Crée et configure les rétroviseurs déclarés dans vehicle.mirrors. *(interne)* | 11 |

### Détail des paramètres

#### `jbeam_sections_mirror.process(objID, vehicleObj, vehicle)`

Crée et configure les rétroviseurs déclarés dans vehicle.mirrors.

- `objID` (*integer*) : Identifiant du véhicule (non utilisé).
- `vehicleObj` (*userdata*) : Objet véhicule moteur (addMirror, getMirror).
- `vehicle` (*table*) : Données jbeam (section mirrors).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/mirror.lua`.*
