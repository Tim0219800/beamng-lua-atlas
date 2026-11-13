# `gameplay_drift_stuntZones_nearPole`

*Fichier : `lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua` · VM : Game Engine (GE) · 171 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/drift/stuntZones/nearPole")` (fichier sous extensions/ mais pas une extension classique)

Type de zone de cascade « nearPole » : un poteau rayé (delineator, config vehicles/delineator/stripes.pc) est spawné à pos ; le joueur marque des points en le frôlant en drift sans le toucher. Le module renvoie un constructeur appelé par gameplay_drift_stuntZones.setStuntZones ; ce n'est pas une extension. Émet onAnyStuntZoneAccomplished avec le sous-hook onNearPoleAccomplished (angle, closeness et points de base nearPole).

## Remarques

- Un coin du véhicule doit passer à moins de maxDist = 4 m du poteau ; le score est donné quand le véhicule s'éloigne (distance centre-poteau supérieure à celle de la frame précédente) et que le poteau n'a pas été touché.
- closeness = 1 - (minCornerDist / 4), avec minCornerDist la distance minimale d'un coin du véhicule au poteau ; plus c'est proche, plus le score est élevé (score = angle * closeness / 90 * points, dans scoring).
- Toucher le poteau (collision lue dans objectCollisions) met hitPole à vrai et supprime le marqueur : la zone ne peut alors plus être validée.
- Comme hitPole, reset() remet le poteau en place et recrée le marqueur après 0.1 s.

## Classe `C`

Zone nearPole. Champs : data = {id, zoneData = {pos}}, marker, activeData = {veh, hitPole, lastFrameHitPole, available, resetFlag, lastFramePlDist, minCornerDist}.

Le module renvoie un constructeur : `local obj = require("gameplay_drift_stuntZones_nearPole")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:accomplish()` | Réussite : supprime le marqueur, rend la zone indisponible et émet onAnyStuntZoneAccomplished (sous-hook onNearPoleAccomplished avec currDegAngle, closeness, points). | 82 |
| `C:clear()` | Supprime le véhicule poteau et son marqueur. | 8 |
| `C:clearMarker()` | Supprime le marqueur de course s'il existe. | 15 |
| `C:createMarker()` | Crée un marqueur de course « overhead » (rayon 5) 2.5 m au-dessus du poteau. | 22 |
| `C:detectStunt()` | Parcourt les 4 coins du véhicule (getVehCorners), mémorise la distance minimale et marque la zone comme réussie quand le véhicule s'éloigne du poteau sans l'avoir touché. | 104 |
| `C:init(data)` | Constructeur interne : mémorise les données, spawne le poteau rayé à zoneData.pos, crée le marqueur. | 67 |
| `C:isAvailable()` | Indique si le poteau peut encore rapporter des points. | 159 |
| `C:onUpdate(dtReal, dtSim)` | Appelé à chaque frame : met à jour le marqueur et détecte une collision entre le véhicule du drift et le poteau. | 132 |
| `C:onVehicleDestroyed(vehId)` | Si le véhicule détruit est le poteau, oublie le poteau et retire la zone du gestionnaire. | 152 |
| `C:reset()` | Remet le poteau en place (reset physique et mesh), réinitialise les données puis recrée le marqueur après 0.1 s via un job. | 46 |
| `C:resetData()` | Remet à zéro activeData (available = true, distances à l'infini). | 33 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAnyStuntZoneAccomplished` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua`.*
