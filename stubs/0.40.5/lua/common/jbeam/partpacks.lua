---@meta
-- tim19Atlas stub generated from lua/common/jbeam/partpacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des « part packs » : ensembles de pièces prédéfinis décrits dans des fichiers *.partpacks.json des dossiers du véhicule (tableau d'objets {path, filters, ...}). Le module les collecte (avec cache par liste de dossiers), relève ce qui est installé dans l'arbre de pièces (slots, slots vides, noms de pièces, chemins) et ne garde que les packs dont les filtres correspondent au véhicule courant. Sert à l'interface de personnalisation pour proposer uniquement les packs pertinents.
--- Accès : `require("jbeam/partpacks")`
---@class jbeam_partpacks
local jbeam_partpacks = {}

--- Lit tous les *.partpacks.json (recherche récursive) des dossiers donnés et renvoie le catalogue path -> définition. Résultat mis en cache par liste de dossiers.
---Source : lua/common/jbeam/partpacks.lua:48
---@param vehicleDirectories string[]|nil Dossiers du véhicule (ex. {'/vehicles/pickup/', '/vehicles/common/'}).
---@return table<string, table>  Catalogue des packs par path.
function jbeam_partpacks.collectAllPartPacks(vehicleDirectories) end

--- Parcourt récursivement l'arbre de pièces (id, chosenPartName, path, children) et relève ce qui est installé.
---Source : lua/common/jbeam/partpacks.lua:146
---@param partsTree table Arbre de pièces du config du véhicule (config.partsTree).
---@return table  {slots, emptySlots, partNames, partNamesList, paths, pathsList} : ensembles (nom=true) et listes ordonnées.
function jbeam_partpacks.collectInstalled(partsTree) end

--- Applique les filtres de chaque pack du catalogue aux données installées et au modèle de véhicule.
---Source : lua/common/jbeam/partpacks.lua:324
---@param partPacksCatalog table<string, table> Catalogue renvoyé par collectAllPartPacks.
---@param installedData table Données renvoyées par collectInstalled.
---@param vehicleModel string|nil Nom du modèle de véhicule (pour vehicleWhitelist/Blacklist).
---@return table<string, table>  Packs visibles.
---@return table  Statistiques {total, shown, hidden, invalid}.
function jbeam_partpacks.filter(partPacksCatalog, installedData, vehicleModel) end

--- Vide le cache du catalogue de packs.
---Source : lua/common/jbeam/partpacks.lua:44
function jbeam_partpacks.invalidateCollectCache() end

--- Enchaîne collectAllPartPacks, collectInstalled et filter, avec journalisation des temps.
---Source : lua/common/jbeam/partpacks.lua:410
---@param vehicleDirectories string[] Dossiers du véhicule.
---@param partsTree table Arbre de pièces installé.
---@param vehicleModel string|nil Nom du modèle.
---@return table<string, table>  Packs visibles.
function jbeam_partpacks.process(vehicleDirectories, partsTree, vehicleModel) end

return jbeam_partpacks
