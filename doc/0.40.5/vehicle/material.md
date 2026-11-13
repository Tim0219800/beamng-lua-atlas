# `material`

*Fichier : `lua/vehicle/material.lua` · VM : Véhicule · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `material`

Gère le changement dynamique de matériaux du véhicule (feux, phares, cadrans lumineux, carrosserie cassée). Le jbeam compile à l'init une table v.data._materials (mv, triggerList, triggers, deformMeshes). À chaque frame, material.updateGFX relit les valeurs electrics.values listées dans triggerList ; si l'une a changé il réévalue la fonction (evalFunctionString) de chaque déclencheur et bascule le matériau du mesh (obj:switchMaterial) ou le réinitialise (obj:resetMaterials), avec éventuellement une échelle d'émissivité. Gère aussi les matériaux « cassés » liés aux groupes de déformation.

## Remarques

- Ne fait rien si v.data._materials n'existe pas (init retourne tôt).
- Chaque déclencheur (trigger) a : msc (id du mesh/matériau), evalFunctionString (code Lua évalué dans l'environnement `mv` qui contient les valeurs electrics suivies, les booléens étant convertis en 1/0), on, on_intense (matériaux), materialEmissiveScaling {on_max, on_intense_max}. La valeur évaluée > 0.0001 active `on` ; > 0.5 et si on_intense défini, `on_intense`. Si la fonction renvoie nil, le déclencheur est abandonné (marqué brisé) et updateGFX s'arrête pour cette frame.
- Échelle d'émissivité : si définie, setMaterialEmissiveFactor reçoit un gris proportionnel (0..255) à la valeur divisée par on_max / on_intense_max.
- Incohérence : dans updateGFX, `return` immédiat quand une fonction renvoie nil sort de toute la mise à jour (les changements déjà calculés pour les autres déclencheurs ne sont pas appliqués cette frame).
- En cas d'erreur de compilation de la fonction d'évaluation, un log d'erreur est écrit et evalFunction devient nop (renvoie nil, donc le déclencheur sera marqué brisé à la première évaluation).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `material.forceReset()` | Réinitialise immédiatement et sans condition tous les matériaux modifiés (état à faux + obj:resetMaterials), efface les valeurs mémorisées et les matériaux cassés. | 123 |
| `material.init()` | Charge v.data._materials : compile la chaîne d'évaluation de chaque déclencheur dans l'environnement mv, convertit materialEmissiveScaling en scaleEmissiveMaterial*, réinitialise l'état des matériaux cassés. Appelée par main.lua (initSystems) au début. *(interne)* | 141 |
| `material.reset()` | Au reset du véhicule : réinitialise (obj:resetMaterials) tous les matériaux modifiés, efface les matériaux cassés et les dernières valeurs. *(interne)* | 133 |
| `material.switchBrokenMaterial(beam)` | Applique les matériaux de dégâts (dmgMat) des meshs liés à une poutre qui casse (beam.deformSwitches) : désactive les props du groupe de déformation, joue le son de déformation du mesh (une seule fois par mesh) et ajoute 500 de dégâts à beamstate. Appelée par beamstate. *(interne)* | 33 |
| `material.updateGFX()` | Appelée à chaque frame par main.lua (après props.updateGFX) : détecte les changements des valeurs electrics suivies et met à jour matériaux et émissivité. *(interne)* | 51 |

### Détail des paramètres

#### `material.switchBrokenMaterial(beam)`

Applique les matériaux de dégâts (dmgMat) des meshs liés à une poutre qui casse (beam.deformSwitches) : désactive les props du groupe de déformation, joue le son de déformation du mesh (une seule fois par mesh) et ajoute 500 de dégâts à beamstate. Appelée par beamstate.

- `beam` (*table*) : Poutre cassée, avec deformSwitches {msc -> {deformGroup, dmgMat}} et id1.

## Appels vers le moteur (C++)

- `obj:` `resetMaterials`, `setMaterialEmissiveFactor`, `switchMaterial`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/material.lua`.*
