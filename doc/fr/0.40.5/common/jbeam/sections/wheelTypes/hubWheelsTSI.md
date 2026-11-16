# `jbeam_sections_wheelTypes_hubWheelsTSI`

*Fichier : `lua/common/jbeam/sections/wheelTypes/hubWheelsTSI.lua` · VM : Commun (GE + véhicule) · 264 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/wheelTypes/hubWheelsTSI")`

Gestionnaire du type de roue 'hubWheelsTSI' : variante de hubWheels sans enjoliveur. Anneau de nœuds de pneu + anneau de nœuds de moyeu, poutres de bande de roulement, de périphérie, de moyeu et d'axe, et six poutres pressurisées par rayon entre moyeu et pneu (la pression d'air est simulée). Appelé par jbeam/sections/wheels.lua pendant le chargement du véhicule.

## Exemple

```lua
-- appelé par le répartiteur : process(vehicle, wheelKey, wheel)
```

## Remarques

- Différences avec hubWheels : pas d'enjoliveur, pas de poutres en V ni de renforts de bande ; si tireWidth ou hubWidth ne sont pas fournis, ils sont fixés à la distance node1-node2 dans la table de la roue (wheel.tireWidth, wheel.hubWidth). Les options de moyeu hub* sont appliquées uniquement si elles sont définies (pas de 'or').
- Poutres pressurisées de type BEAM_PRESSURED (3) basées sur les options de renfort (wheelReinforcementBeam*) avec pressurePSI (défaut 30), volumeCoef = 1/(numRays*6), surface calculée à partir de radius, hubRadius, tireWidth, hubWidth ; reinforcementPressure* (PSI, Spring, Damp) pour les renforts.
- Les nœuds de pneu sont reliés par pairedNode (intérieur -> extérieur -> intérieur suivant). Poutres de soutien BEAM_SUPPORT (7) si enableTireSideSupportBeams.
- Résultat : wheel.nodes = nœuds du moyeu, wheel.pressuredBeams = poutres pressurisées. Paramètres par défaut : radius 0.5, hubRadius 0.65*radius, numRays 10, treadCoef 1. wheel.collision forcé à true. Constantes C : NORMALTYPE 0, BEAM_ANISOTROPIC 1, BEAM_PRESSURED 3, BEAM_SUPPORT 7.
- TSI/TSV : acronymes non expliqués dans le code (déduit : variantes 'pressure' et 'vertical' de la même construction ; à confirmer côté éditeur).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_wheelTypes_hubWheelsTSI.process(vehicle, wheelKey, wheel)` | Crée nœuds et poutres d'une roue hubWheelsTSI (alias de addHubWheelTSI). Avertissement 'invalid hubWheel' et sortie sans rien créer si node1 ou node2 est introuvable. *(interne)* | 20 |

### Détail des paramètres

#### `jbeam_sections_wheelTypes_hubWheelsTSI.process(vehicle, wheelKey, wheel)`

Crée nœuds et poutres d'une roue hubWheelsTSI (alias de addHubWheelTSI). Avertissement 'invalid hubWheel' et sortie sans rien créer si node1 ou node2 est introuvable.

- `vehicle` (*table*) : véhicule en construction
- `wheelKey` (*integer*) : indice de la roue dans sa section
- `wheel` (*table*) : définition jbeam de la roue (modifiée : collision, radius, hubRadius, numRays, tireWidth, hubWidth, nodes, pressuredBeams)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/wheelTypes/hubWheelsTSI.lua`.*
