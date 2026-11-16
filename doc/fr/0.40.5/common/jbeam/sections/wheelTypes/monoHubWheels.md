# `jbeam_sections_wheelTypes_monoHubWheels`

*Fichier : `lua/common/jbeam/sections/wheelTypes/monoHubWheels.lua` · VM : Commun (GE + véhicule) · 206 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/wheelTypes/monoHubWheels")`

Gestionnaire du type de roue 'monoHubWheels' : roue à moyeu simple. Anneau de pneu (2 x numRays nœuds) relié aux deux nœuds d'axe par des côtés et des poutres de soutien, plus UN seul anneau de numRays nœuds de moyeu placé au milieu de l'axe et relié à node1, node2 et au pneu par des poutres anisotropes de renfort. Appelé par jbeam/sections/wheels.lua pendant le chargement du véhicule.

## Exemple

```lua
-- appelé par le répartiteur : process(vehicle, wheelKey, wheel)
```

## Remarques

- Paramètres lus : node1, node2 (obligatoires), radius (0.5), hubRadius (0.65*radius), numRays (10), tireWidth, wheelOffset, wheelSideBeam*, wheelTreadBeam*, wheelPeripheryBeam*, wheelReinforcementBeam*, hubBeam*, hubNodeWeight, hubCollision, hubNodeMaterial, hubFrictionCoef. Les nœuds du moyeu sont décalés d'un demi-pas angulaire (rotation initiale 2*pi/(4*numRays)).
- Poutres de soutien BEAM_SUPPORT (7) entre node1/node2 et le pneu avec beamPrecompression = 0.75*hubRadius/radius + 0.25 (toujours créées, contrairement aux types hubWheels*).
- Résultat : wheel.nodes = nœuds du moyeu (numRays nœuds). wheel.collision forcé à true. Constantes C : NORMALTYPE 0, BEAM_ANISOTROPIC 1, BEAM_SUPPORT 7.
- Les nœuds du pneu sont créés avant ceux du moyeu : leurs identifiants commencent à maxIDs.nodes avant création.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_wheelTypes_monoHubWheels.process(vehicle, wheelKey, wheel)` | Crée nœuds et poutres d'une roue monoHubWheels (alias de addMonoHubWheel). Avertissement 'invalid monohub wheel' et sortie si node1 ou node2 manque. *(interne)* | 19 |

### Détail des paramètres

#### `jbeam_sections_wheelTypes_monoHubWheels.process(vehicle, wheelKey, wheel)`

Crée nœuds et poutres d'une roue monoHubWheels (alias de addMonoHubWheel). Avertissement 'invalid monohub wheel' et sortie si node1 ou node2 manque.

- `vehicle` (*table*) : véhicule en construction
- `wheelKey` (*integer*) : indice de la roue dans sa section
- `wheel` (*table*) : définition jbeam de la roue (modifiée : collision, radius, hubRadius, numRays, nodes)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/wheelTypes/monoHubWheels.lua`.*
