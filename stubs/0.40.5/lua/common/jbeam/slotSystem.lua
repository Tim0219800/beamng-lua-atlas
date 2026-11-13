---@meta
-- tim19Atlas stub generated from lua/common/jbeam/slotSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système de slots du jbeam : à partir de la configuration du véhicule (pièces choisies), il parcourt récursivement les slots (sections slots / slots2) de la pièce principale, choisit pour chaque slot la pièce de l'utilisateur, sinon la pièce par défaut du slot, vérifie la compatibilité de type (slotType) et construit l'arbre des pièces choisies, les tables d'état et un 'journal' des fusions. unifyPartJournal rejoue ce journal pour fusionner toutes les pièces en un seul véhicule (unifyParts). Utilisé par le chargeur jbeam ; un moddeur ne l'appelle normalement pas, mais ses règles décrivent comment les pièces s'emboîtent.
--- Accès : `require("jbeam/slotSystem")`
---@class jbeam_slotSystem
local jbeam_slotSystem = {}

--- Choisit récursivement les pièces de tous les slots à partir de la pièce principale vehicleConfig.mainPartName. Renvoie la pièce racine, le journal de fusion (pièces dans l'ordre enfant-avant-parent), le journal de fusion 'C' (ordre parent-avant-enfant), l'arbre des pièces choisies, la table slot->pièce, les données des pièces actives (copie profonde) et la table chemin de pièce -> nom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/slotSystem.lua:441
---@param ioCtx table contexte du module jbeam/io (accès aux pièces et slots)
---@param vehicleConfig table configuration du véhicule : mainPartName, mainPartPath, parts ou partsTree
---@return table|nil  rootPart (pièce principale)
---@return table  unifyJournal : liste {partParent, partEnfant, niveau, optionsDuSlot, cheminPièce, slotDef}
---@return table  unifyJournalC
---@return table  chosenPartsTree (arbre : id, path, suitablePartNames, unsuitablePartNames, chosenPartName, partPath, children, decisionMethod)
---@return table<string, string>  slotPartMap : chemin de slot -> nom de pièce ('' = vide)
---@return table<string, table>  activePartsData : nom de pièce -> données
---@return table<string, string>  activeParts : chemin de pièce -> nom
function jbeam_slotSystem.findParts(ioCtx, vehicleConfig) end

--- Détermine si une pièce peut aller dans un slot. Version 1 : compare part.slotType (chaîne ou tableau) à slot.type. Version 2 : slot.allowTypes (liste blanche) et slot.denyTypes (liste noire), part.slotType chaîne ou tableau. Renvoie un booléen et un message d'erreur éventuel.
---Source : lua/common/jbeam/slotSystem.lua:182
---@param part table pièce jbeam (champ slotType : chaîne ou liste de chaînes)
---@param slot table définition du slot (type pour la v1, allowTypes / denyTypes pour la v2)
---@return boolean  la pièce convient
---@return string|nil  motif du refus ('Part type does not match slot type', 'Part type not in allowed types', 'No matching allowed types found', 'Part type is in deny list', 'Invalid slot configuration')
function jbeam_slotSystem.partFitsSlot(part, slot) end

--- Rejoue le journal de fusion : pour chaque entrée appelle unifyParts(parent, enfant, niveau, optionsDuSlot, chemin) pour fusionner les sections de chaque pièce enfant dans sa pièce parente, jusqu'à obtenir une seule pièce racine. ioCtx n'est pas utilisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/slotSystem.lua:513
---@param ioCtx table contexte io (non utilisé)
---@param unifyJournal table[] journal renvoyé par findParts (second résultat)
---@return boolean  toujours true
function jbeam_slotSystem.unifyPartJournal(ioCtx, unifyJournal) end

return jbeam_slotSystem
