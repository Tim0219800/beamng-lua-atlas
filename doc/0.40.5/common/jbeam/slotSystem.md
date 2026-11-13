# `jbeam_slotSystem`

*Fichier : `lua/common/jbeam/slotSystem.lua` · VM : Commun (GE + véhicule) · 527 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/slotSystem")`

Système de slots du jbeam : à partir de la configuration du véhicule (pièces choisies), il parcourt récursivement les slots (sections slots / slots2) de la pièce principale, choisit pour chaque slot la pièce de l'utilisateur, sinon la pièce par défaut du slot, vérifie la compatibilité de type (slotType) et construit l'arbre des pièces choisies, les tables d'état et un 'journal' des fusions. unifyPartJournal rejoue ce journal pour fusionner toutes les pièces en un seul véhicule (unifyParts). Utilisé par le chargeur jbeam ; un moddeur ne l'appelle normalement pas, mais ses règles décrivent comment les pièces s'emboîtent.

## Exemple

```lua
local slotSystem = require('jbeam/slotSystem')
local rootPart, unifyJournal, unifyJournalC, chosenPartsTree, slotPartMap, activePartsData, activeParts = slotSystem.findParts(ioCtx, vehicleConfig)
slotSystem.unifyPartJournal(ioCtx, unifyJournal)
```

## Remarques

- Configuration de pièces utilisateur : soit vehicleConfig.parts (table plate slotId ou chemin de slot -> nom de pièce, 'none' = slot vide), soit vehicleConfig.partsTree (arbre {children = {slotId = {chosenPartName, children}}}). Valeur '' = slot volontairement vide (decisionMethod 'user-empty').
- Décision pour chaque slot (decisionMethod) : 'user' (pièce demandée, si elle existe et convient), 'default' (slot.default, 'default-empty' si default == ''), sinon slot laissé vide avec message d'erreur si une pièce demandée est introuvable. Une pièce de type incompatible est rejetée avec une erreur et remplacée par la valeur par défaut.
- Identifiant d'un slot : slotDef.name ou slotDef.type ; chemin de slot : '/<slot>/<sous-slot>/…' ; chemin de pièce : chemin du slot + nom de la pièce. slotDef.maxRecursion limite le nombre d'occurrences d'un même slotId dans la chaîne ; au-delà de 50 niveaux de récursion le code journalise une erreur (cycle probable).
- Les options du slot (tout sauf name, type, allowTypes, denyTypes, default, description, maxRecursion) sont héritées par les sections de la pièce enfant : unifyParts les insère comme ligne d'options (avec partOrigin = nom de la pièce, partPath) avant les lignes de la pièce, puis une ligne de remise à zéro (valeurs '') après. variables est retiré des options (traité par jbeam/variables) et coreSlot est effacé.
- Fusion (unifyParts, locale) : les sections slots, slots2 et information ne sont pas fusionnées ; les sections tabulaires s'ajoutent bout à bout ; pour les sections dictionnaires, une clé commençant par '$' suivie d'un opérateur et d'un nombre ('$+nom', '$*nom', '$<nom' = min, '$>nom' = max) combine la valeur numérique avec l'existante ; les autres valeurs écrasent (sauf slotType et partName).
- BUG probable (slots version 1) : dans partFitsSlot, quand part.slotType est une table, la condition est `not tableContains(part.slotType, slot.type)` : elle renvoie true si le type N'EST PAS contenu et tombe sur 'Part type does not match' sinon, c'est-à-dire inversée par rapport à l'intention.
- BUG probable (slots2) : quand part.slotType est une table et que slot.denyTypes est nil, tableContains(slot.denyTypes, …) est appelé avec nil (comportement dépend de tableContains).
- findParts renvoie sept valeurs ; sans pièce principale (vehicleConfig.mainPartName introuvable) ou sans table de slots disponibles, il journalise une erreur et renvoie nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_slotSystem.findParts(ioCtx, vehicleConfig)` | Choisit récursivement les pièces de tous les slots à partir de la pièce principale vehicleConfig.mainPartName. Renvoie la pièce racine, le journal de fusion (pièces dans l'ordre enfant-avant-parent), le journal de fusion 'C' (ordre parent-avant-enfant), l'arbre des pièces choisies, la table slot->pièce, les données des pièces actives (copie profonde) et la table chemin de pièce -> nom. *(interne)* | 441 |
| `jbeam_slotSystem.partFitsSlot(part, slot)` | Détermine si une pièce peut aller dans un slot. Version 1 : compare part.slotType (chaîne ou tableau) à slot.type. Version 2 : slot.allowTypes (liste blanche) et slot.denyTypes (liste noire), part.slotType chaîne ou tableau. Renvoie un booléen et un message d'erreur éventuel. | 182 |
| `jbeam_slotSystem.unifyPartJournal(ioCtx, unifyJournal)` | Rejoue le journal de fusion : pour chaque entrée appelle unifyParts(parent, enfant, niveau, optionsDuSlot, chemin) pour fusionner les sections de chaque pièce enfant dans sa pièce parente, jusqu'à obtenir une seule pièce racine. ioCtx n'est pas utilisé. *(interne)* | 513 |

### Détail des paramètres

#### `jbeam_slotSystem.findParts(ioCtx, vehicleConfig)`

Choisit récursivement les pièces de tous les slots à partir de la pièce principale vehicleConfig.mainPartName. Renvoie la pièce racine, le journal de fusion (pièces dans l'ordre enfant-avant-parent), le journal de fusion 'C' (ordre parent-avant-enfant), l'arbre des pièces choisies, la table slot->pièce, les données des pièces actives (copie profonde) et la table chemin de pièce -> nom.

- `ioCtx` (*table*) : contexte du module jbeam/io (accès aux pièces et slots)
- `vehicleConfig` (*table*) : configuration du véhicule : mainPartName, mainPartPath, parts ou partsTree
- **renvoie** : table|nil rootPart (pièce principale)
- **renvoie** : table unifyJournal : liste {partParent, partEnfant, niveau, optionsDuSlot, cheminPièce, slotDef}
- **renvoie** : table unifyJournalC
- **renvoie** : table chosenPartsTree (arbre : id, path, suitablePartNames, unsuitablePartNames, chosenPartName, partPath, children, decisionMethod)
- **renvoie** : table<string, string> slotPartMap : chemin de slot -> nom de pièce ('' = vide)
- **renvoie** : table<string, table> activePartsData : nom de pièce -> données
- **renvoie** : table<string, string> activeParts : chemin de pièce -> nom

#### `jbeam_slotSystem.partFitsSlot(part, slot)`

Détermine si une pièce peut aller dans un slot. Version 1 : compare part.slotType (chaîne ou tableau) à slot.type. Version 2 : slot.allowTypes (liste blanche) et slot.denyTypes (liste noire), part.slotType chaîne ou tableau. Renvoie un booléen et un message d'erreur éventuel.

- `part` (*table*) : pièce jbeam (champ slotType : chaîne ou liste de chaînes)
- `slot` (*table*) : définition du slot (type pour la v1, allowTypes / denyTypes pour la v2)
- **renvoie** : boolean la pièce convient
- **renvoie** : string|nil motif du refus ('Part type does not match slot type', 'Part type not in allowed types', 'No matching allowed types found', 'Part type is in deny list', 'Invalid slot configuration')

#### `jbeam_slotSystem.unifyPartJournal(ioCtx, unifyJournal)`

Rejoue le journal de fusion : pour chaque entrée appelle unifyParts(parent, enfant, niveau, optionsDuSlot, chemin) pour fusionner les sections de chaque pièce enfant dans sa pièce parente, jusqu'à obtenir une seule pièce racine. ioCtx n'est pas utilisé.

- `ioCtx` (*table*) : contexte io (non utilisé)
- `unifyJournal` (*table[]*) : journal renvoyé par findParts (second résultat)
- **renvoie** : boolean toujours true

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/slotSystem.lua`.*
