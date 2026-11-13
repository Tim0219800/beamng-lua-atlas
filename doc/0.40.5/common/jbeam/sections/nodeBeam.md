# `jbeam_sections_nodeBeam`

*Fichier : `lua/common/jbeam/sections/nodeBeam.lua` · VM : Commun (GE + véhicule) · 169 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/nodeBeam")`

Traite les sections jbeam de la structure physique : nodes (calcule la position finale pos en vec3 après rotation/déplacement du composant, puis supprime posX/posY/posZ), hydros (ajoute la poutre hydraulique et applique les valeurs par défaut de vitesse, limites, source d'entrée et facteur), ropes (cordes physiques : découpe en segments de nœuds et poutres anisotropes), quads (chaque quad devient deux triangles). Vérifie aussi que les nœuds de référence existent.

## Remarques

- Types de poutres utilisés (valeurs définies en C) : NORMALTYPE 0, BEAM_ANISOTROPIC 1, BEAM_HYDRO 6.
- Hydros : inRate défaut 2, outRate défaut inRate, autoCenterRate défaut inRate, inLimit 0, outLimit 2, inputSource 'steering', inputCenter 0, inputInLimit -1, inputOutLimit 1, inputFactor 1, analogue = false. inExtent/outExtent (en mètres) sont convertis en limites relatives à la longueur de la poutre ; factor (ou extentFactor en mètres) fixe inLimit = 1 - |factor|, outLimit = 1 + |factor| et inputFactor = signe du facteur.
- Ropes : segments (min 1, défaut 1), length (défaut 1, ou distance id1-id2 si id2 est donné), nodeWeight défaut 5, beamLongBound défaut infini. Crée rope.nodes et rope.beams ; le dernier segment se connecte à id2 s'il existe.
- Quads : chaque quad donne deux triangles (id1,id2,id3 puis id3,id4,id1) ajoutés à vehicle.triangles avec de nouveaux cid ; la section quads est ensuite supprimée.
- Si refNodes[0] est absent, une erreur est journalisée et des nœuds de référence factices {ref=0, back=1, left=2, up=0} sont installés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_nodeBeam.process(vehicle)` | Traite nodes, hydros, ropes, quads et garantit la présence de refNodes[0]. *(interne)* | 149 |

### Détail des paramètres

#### `jbeam_sections_nodeBeam.process(vehicle)`

Traite nodes, hydros, ropes, quads et garantit la présence de refNodes[0].

- `vehicle` (*table*) : Données jbeam du véhicule (modifiées en place).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/nodeBeam.lua`.*
