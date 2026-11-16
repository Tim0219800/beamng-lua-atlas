# `jbeam_partpacks`

*Fichier : `lua/common/jbeam/partpacks.lua` · VM : Commun (GE + véhicule) · 432 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/partpacks")`

Gestion des « part packs » : ensembles de pièces prédéfinis décrits dans des fichiers *.partpacks.json des dossiers du véhicule (tableau d'objets {path, filters, ...}). Le module les collecte (avec cache par liste de dossiers), relève ce qui est installé dans l'arbre de pièces (slots, slots vides, noms de pièces, chemins) et ne garde que les packs dont les filtres correspondent au véhicule courant. Sert à l'interface de personnalisation pour proposer uniquement les packs pertinents.

## Exemple

```lua
local pp = require('jbeam/partpacks')
local visible = pp.process({'/vehicles/wl40/', '/vehicles/common/'}, config.partsTree, 'wl40')
-- visible[path] = définition du pack (sans le champ path)
```

## Remarques

- Format d'un fichier .partpacks.json : tableau d'objets, chacun avec path (chaîne obligatoire, clé du catalogue) et éventuellement filters. Le champ path est retiré de l'objet une fois utilisé comme clé ; un path en double produit un avertissement et écrase l'entrée précédente.
- Filtres (tous facultatifs, tables) : slotWhitelist/slotBlacklist (table nomDeSlot -> true|'present'|'empty'|'nonempty'), vehicleWhitelist/vehicleBlacklist (liste de noms de véhicule), partNameWhitelist/partNameBlacklist (noms de pièces choisies), pathWhitelist/pathBlacklist (valeurs de part.path). Le joker '*' est permis dans les clés/entrées (converti en motif Lua).
- Règles : whitelist = toutes les entrées doivent correspondre ; blacklist = une seule correspondance cache le pack. Un format de filtre invalide masque le pack (compté comme invalid) et est consigné.
- États de slot : 'present' (ou true) = le slot existe dans l'arbre ; 'empty' = existe sans pièce choisie ; 'nonempty' = existe avec une pièce.
- Le catalogue est mis en cache par concaténation des dossiers ; invalidateCollectCache() est nécessaire si les fichiers changent.
- process journalise les temps (collect, collectInstalled, filter) et les compteurs en niveau 'I'.
- Utilise FS:findFiles et jsonReadFile : disponible côté GE.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_partpacks.collectAllPartPacks(vehicleDirectories)` | Lit tous les *.partpacks.json (recherche récursive) des dossiers donnés et renvoie le catalogue path -> définition. Résultat mis en cache par liste de dossiers. | 48 |
| `jbeam_partpacks.collectInstalled(partsTree)` | Parcourt récursivement l'arbre de pièces (id, chosenPartName, path, children) et relève ce qui est installé. | 146 |
| `jbeam_partpacks.filter(partPacksCatalog, installedData, vehicleModel)` | Applique les filtres de chaque pack du catalogue aux données installées et au modèle de véhicule. | 324 |
| `jbeam_partpacks.invalidateCollectCache()` | Vide le cache du catalogue de packs. | 44 |
| `jbeam_partpacks.process(vehicleDirectories, partsTree, vehicleModel)` | Enchaîne collectAllPartPacks, collectInstalled et filter, avec journalisation des temps. | 410 |

### Détail des paramètres

#### `jbeam_partpacks.collectAllPartPacks(vehicleDirectories)`

Lit tous les *.partpacks.json (recherche récursive) des dossiers donnés et renvoie le catalogue path -> définition. Résultat mis en cache par liste de dossiers.

- `vehicleDirectories` (*string[]|nil*) : Dossiers du véhicule (ex. {'/vehicles/pickup/', '/vehicles/common/'}).
- **renvoie** : table<string, table> Catalogue des packs par path.

#### `jbeam_partpacks.collectInstalled(partsTree)`

Parcourt récursivement l'arbre de pièces (id, chosenPartName, path, children) et relève ce qui est installé.

- `partsTree` (*table*) : Arbre de pièces du config du véhicule (config.partsTree).
- **renvoie** : table {slots, emptySlots, partNames, partNamesList, paths, pathsList} : ensembles (nom=true) et listes ordonnées.

#### `jbeam_partpacks.filter(partPacksCatalog, installedData, vehicleModel)`

Applique les filtres de chaque pack du catalogue aux données installées et au modèle de véhicule.

- `partPacksCatalog` (*table<string, table>*) : Catalogue renvoyé par collectAllPartPacks.
- `installedData` (*table*) : Données renvoyées par collectInstalled.
- `vehicleModel` (*string|nil*) : Nom du modèle de véhicule (pour vehicleWhitelist/Blacklist).
- **renvoie** : table<string, table> Packs visibles.
- **renvoie** : table Statistiques {total, shown, hidden, invalid}.

#### `jbeam_partpacks.process(vehicleDirectories, partsTree, vehicleModel)`

Enchaîne collectAllPartPacks, collectInstalled et filter, avec journalisation des temps.

- `vehicleDirectories` (*string[]*) : Dossiers du véhicule.
- `partsTree` (*table*) : Arbre de pièces installé.
- `vehicleModel` (*string|nil*) : Nom du modèle.
- **renvoie** : table<string, table> Packs visibles.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/partpacks.lua`.*
