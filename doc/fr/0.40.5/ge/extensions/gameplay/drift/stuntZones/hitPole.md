# `gameplay_drift_stuntZones_hitPole`

*Fichier : `lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/drift/stuntZones/hitPole")` (fichier sous extensions/ mais pas une extension classique)

Type de zone de cascade « hitPole » : un poteau (véhicule delineator, config vehicles/delineator/pole.pc) est spawné à pos, avec un marqueur de course au-dessus ; le joueur marque des points en le percutant pendant qu'il drifte. Le module renvoie un constructeur appelé par gameplay_drift_stuntZones.setStuntZones ; ce n'est pas une extension. Émet onAnyStuntZoneAccomplished avec le sous-hook onHitPoleAccomplished (angle, vitesse, points de base hitPole).

## Remarques

- La collision est lue dans map.objects[vehId].objectCollisions du véhicule du drift ; le point est donné à la frame où la collision apparaît (hitPole vrai et lastFrameHitPole faux) et seulement si le joueur drifte (detectStunt est appelé par le gestionnaire).
- Une fois réussi, le poteau n'est plus disponible (available = false) jusqu'à reset() ; le reset remet physiquement le poteau en place (requestReset, resetBrokenFlexMesh) et recrée le marqueur après 0.1 s.
- Si le poteau est détruit, la zone se retire elle-même via gameplay_drift_stuntZones.clearStuntZone.
- Valeurs de secours pour les tests UI : angle 50°, vitesse 30.

## Classe `C`

Zone hitPole. Champs : data = {id, zoneData = {pos}}, marker (marqueur de course), activeData = {veh (poteau), hitPole, lastFrameHitPole, available, resetFlag}.

Le module renvoie un constructeur : `local obj = require("gameplay_drift_stuntZones_hitPole")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:accomplish()` | Réussite : supprime le marqueur, rend la zone indisponible et émet onAnyStuntZoneAccomplished (sous-hook onHitPoleAccomplished). | 77 |
| `C:clear()` | Supprime le véhicule poteau et son marqueur. | 6 |
| `C:clearMarker()` | Supprime le marqueur de course s'il existe. | 13 |
| `C:createMarker()` | Crée un marqueur de course « overhead » (rayon 5) 2.5 m au-dessus du poteau. | 20 |
| `C:detectStunt()` | Appelé quand le joueur drifte : appelle accomplish si le poteau vient d'être touché. | 96 |
| `C:init(data)` | Constructeur interne : mémorise les données, spawne le poteau delineator (pole.pc) à zoneData.pos sans y faire entrer le joueur, crée le marqueur. | 62 |
| `C:isAvailable()` | Indique si le poteau peut encore rapporter des points. | 129 |
| `C:onUpdate(dtReal, dtSim)` | Appelé à chaque frame : met à jour le marqueur, mémorise l'état de collision précédent et détecte une collision entre le véhicule du drift et le poteau. | 102 |
| `C:onVehicleDestroyed(vehId)` | Si le véhicule détruit est le poteau, oublie le poteau et retire la zone du gestionnaire. | 122 |
| `C:reset()` | Remet le poteau en place (reset physique et mesh), réinitialise les données puis recrée le marqueur après 0.1 s via un job. | 41 |
| `C:resetData()` | Remet à zéro activeData (available = true, pas de collision), en perdant la référence au poteau. | 31 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAnyStuntZoneAccomplished` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua`.*
