# `jbeam_sections_wheelTypes_hubWheelsTSV`

*Fichier : `lua/common/jbeam/sections/wheelTypes/hubWheelsTSV.lua` · VM : Commun (GE + véhicule) · 219 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/wheelTypes/hubWheelsTSV")`

Gestionnaire du type de roue 'hubWheelsTSV' : roue à moyeu séparé SANS pression d'air simulée : le pneu est relié au moyeu par des poutres anisotropes de côté et de renfort (au lieu de poutres pressurisées). Appelé par jbeam/sections/wheels.lua pendant le chargement du véhicule.

## Exemple

```lua
-- appelé par le répartiteur : process(vehicle, wheelKey, wheel)
```

## Remarques

- Par rayon, le code crée : bande de roulement (BEAM_ANISOTROPIC), périphérie (NORMALTYPE), poutres de moyeu (bande, périphérie, axe vers node1/node2), 2 renforts anisotropes hub-pneu (wheelReinforcementBeam*), 4 poutres de côté anisotropes (wheelSideBeam*), et des poutres de soutien BEAM_SUPPORT (7) si enableTireSideSupportBeams.
- L'ordre de création des nœuds est inversé par rapport à hubWheelsTSI (intérieur puis extérieur pour le moyeu) : les nœuds 'outhub' et 'inhub' sont échangés dans les indices.
- Résultat : wheel.nodes (nœuds du moyeu), wheel.reinforcementBeams, wheel.sideBeams, wheel.treadBeams. Valeurs par défaut : radius 0.5, hubRadius 0.65*radius, numRays 10. wheel.collision est forcé à true.
- Dans ce gestionnaire, hubWidth/tireWidth ne sont pas écrits dans la roue (contrairement à TSI).
- Constantes C : NORMALTYPE 0, BEAM_ANISOTROPIC 1, BEAM_SUPPORT 7 ; pas de BEAM_PRESSURED.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_wheelTypes_hubWheelsTSV.process(vehicle, wheelKey, wheel)` | Crée nœuds et poutres d'une roue hubWheelsTSV (alias de addHubWheelTSV). Avertissement 'invalid hubWheel' et sortie si node1 ou node2 manque. *(interne)* | 19 |

### Détail des paramètres

#### `jbeam_sections_wheelTypes_hubWheelsTSV.process(vehicle, wheelKey, wheel)`

Crée nœuds et poutres d'une roue hubWheelsTSV (alias de addHubWheelTSV). Avertissement 'invalid hubWheel' et sortie si node1 ou node2 manque.

- `vehicle` (*table*) : véhicule en construction
- `wheelKey` (*integer*) : indice de la roue dans sa section
- `wheel` (*table*) : définition jbeam de la roue (modifiée : collision, radius, hubRadius, numRays, nodes, reinforcementBeams, sideBeams, treadBeams)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/wheelTypes/hubWheelsTSV.lua`.*
