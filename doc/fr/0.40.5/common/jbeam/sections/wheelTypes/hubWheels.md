# `jbeam_sections_wheelTypes_hubWheels`

*Fichier : `lua/common/jbeam/sections/wheelTypes/hubWheels.lua` · VM : Commun (GE + véhicule) · 385 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/wheelTypes/hubWheels")`

Gestionnaire du type de roue 'hubWheels' : roue à moyeu séparé du pneu, avec pression d'air simulée par des poutres pressurisées entre le moyeu et le pneu. Il crée un anneau de nœuds de pneu, un anneau de nœuds de moyeu, éventuellement un enjoliveur (hubcap), puis les poutres de bande de roulement, de périphérie, de moyeu, d'axe, de pression, de renfort et de soutien. Appelé par jbeam/sections/wheels.lua pendant le chargement.

## Exemple

```lua
-- appelé par le répartiteur : process(vehicle, wheelKey, wheel)
```

## Remarques

- Paramètres lus : node1, node2 (obligatoires), radius (0.5), hubRadius (0.65*radius), numRays (10), tireWidth, hubWidth, wheelOffset, treadCoef (1), pressurePSI (30), pressureSpring/Damp/Strength/Deform, reinforcementPressure*, wheelSide*, wheelTread*, wheelPeriphery*, wheelTreadReinforcement*, hub*, hubcap* (enableHubcaps, hubcapRadius, hubcapWidth, hubcapOffset, hubcapCenterNodeWeight, hubcapBreakGroup, enableExtraHubcapBeams), enableTireSideVBeams, wheelSideDisplacement, enableTreadReinforcementBeams, enableTireSideSupportBeams.
- Les enjoliveurs ne sont créés que si enableHubcaps == true et numRays est pair. Si enableHubcaps est vrai et numRays impair, les nœuds/poutres d'enjoliveur sont ignorés.
- Les poutres hub-pneu sont de type BEAM_PRESSURED (3) ; volumeCoef vaut 1 ; surface calculée avec tireWidth, hubWidth, radius et hubRadius. Les poutres de soutien (BEAM_SUPPORT = 7) utilisent beamPrecompression = 0.75*hubRadius/radius + 0.25.
- Les nœuds de pneu sont reliés deux à deux par pairedNode (chaque nœud intérieur référence l'extérieur suivant). Résultat : wheel.nodes = nœuds du moyeu (vehicle.nodes[n]) et wheel.pressuredBeams = poutres pressurisées créées.
- Constantes C codées en dur : NORMALTYPE = 0, BEAM_ANISOTROPIC = 1, BEAM_PRESSURED = 3, BEAM_SUPPORT = 7. wheel.collision est forcé à true.
- Incohérence mineure : le code vérifie `i == 1` (au lieu de i == 0) pour ajouter les poutres d'axe de l'enjoliveur en mode enableExtraHubcapBeams ; elles ne sont donc ajoutées qu'au second rayon.
- hubcapOffset est nil quand wheel.hubcapOffset n'est pas défini, mais l'expression `node1_pos + rayVec - hubcapOffset` l'utilise : un enjoliveur sans hubcapOffset provoque donc une erreur Lua (opérande nil) dans ce gestionnaire.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_wheelTypes_hubWheels.process(vehicle, wheelKey, wheel)` | Crée tous les nœuds et poutres d'une roue hubWheels (alias de addHubWheel). Sort avec un avertissement 'invalid hubWheel' si node1 ou node2 n'existe pas. *(interne)* | 20 |

### Détail des paramètres

#### `jbeam_sections_wheelTypes_hubWheels.process(vehicle, wheelKey, wheel)`

Crée tous les nœuds et poutres d'une roue hubWheels (alias de addHubWheel). Sort avec un avertissement 'invalid hubWheel' si node1 ou node2 n'existe pas.

- `vehicle` (*table*) : véhicule en construction
- `wheelKey` (*integer*) : indice de la roue dans sa section
- `wheel` (*table*) : définition jbeam de la roue (modifiée : collision, treadCoef, radius, hubRadius, numRays, nodes, pressuredBeams)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/wheelTypes/hubWheels.lua`.*
