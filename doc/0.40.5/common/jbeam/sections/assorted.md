# `jbeam_sections_assorted`

*Fichier : `lua/common/jbeam/sections/assorted.lua` · VM : Commun (GE + véhicule) · 35 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/assorted")`

Post-traitement de deux sections jbeam diverses. (1) Section engine : construit engine.waterDamage.nodes en concaténant les listes de nœuds issues des liens de groupe _group_nodes et _engineGroup_nodes de waterDamage (nœuds dont la noyade endommage le moteur). (2) Section soundscape : transforme la liste d'entrées en dictionnaire indexé par leur champ name. Appelé par le chargeur après la résolution des liens de groupe.

## Remarques

- Si vehicle.engine existe mais sans waterDamage, une table waterDamage vide est créée ; nodes devient une liste (possiblement vide).
- Pour soundscape, deux entrées de même name s'écrasent (la dernière itérée gagne) ; une entrée sans name est stockée sous la clé nil, ce qui lève une erreur Lua.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_assorted.process(vehicle)` | Applique les deux post-traitements (engine.waterDamage.nodes et soundscape) en place sur les données du véhicule. *(interne)* | 10 |

### Détail des paramètres

#### `jbeam_sections_assorted.process(vehicle)`

Applique les deux post-traitements (engine.waterDamage.nodes et soundscape) en place sur les données du véhicule.

- `vehicle` (*table*) : Données jbeam du véhicule.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/assorted.lua`.*
