# `jbeam_sectionMerger`

*Fichier : `lua/common/jbeam/sectionMerger.lua` · VM : Commun (GE + véhicule) · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sectionMerger")`

Fusionne des sections jbeam entre elles pour la rétrocompatibilité : la section triggers2 est versée dans triggers et rails2 dans rails. Les lignes fusionnées reçoivent originSection (nom de la section d'origine), la section source est supprimée pour ne pas être traitée plus loin, et sectionRenames est mis à jour (triggers2 -> triggers, rails2 -> rails).

## Remarques

- mergeNumberedSections existe dans le code mais est locale et jamais appelée (le commentaire du code dit « not tested, be careful »).
- Si une clé existe déjà dans la section cible, la ligne est écrasée avec un avertissement de journal (le message nomme deux fois la section cible).
- Pour rails, isTableCid vaut false : validTables n'est pas initialisé par la fonction avant l'accès vehicle.validTables[sectionNameSource] = nil ; ce n'est sans risque que si validTables a déjà été créé par l'étape précédente (triggers l'initialise juste avant).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sectionMerger.process(vehicle, sectionRenames)` | Fusionne triggers2 dans triggers et rails2 dans rails, et enregistre ces renommages dans sectionRenames. *(interne)* | 70 |

### Détail des paramètres

#### `jbeam_sectionMerger.process(vehicle, sectionRenames)`

Fusionne triggers2 dans triggers et rails2 dans rails, et enregistre ces renommages dans sectionRenames.

- `vehicle` (*table*) : Données jbeam du véhicule (modifiées en place).
- `sectionRenames` (*table<string, string>*) : Table ancien nom vers nouveau nom, complétée par la fonction.
- **renvoie** : boolean Toujours true.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sectionMerger.lua`.*
