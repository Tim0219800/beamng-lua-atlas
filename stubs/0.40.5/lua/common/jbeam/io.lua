---@meta
-- tim19Atlas stub generated from lua/common/jbeam/io.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lecture et mise en cache des fichiers .jbeam des véhicules. Pour chaque dossier demandé, parse chaque *.jbeam (JSON), normalise les sections slots/slots2 vers le format slots2 (name, allowTypes, denyTypes, default, description), stocke chaque pièce encodée dans un cache et construit des index (pièce -> fichier, slotType -> pièces, pièce -> description). Permet ensuite de récupérer une pièce (getPart), de lister les pièces disponibles et celles compatibles avec un emplacement. Un moddeur s'en sert pour interroger les pièces/slots d'un véhicule depuis une extension GE.
--- Accès : `require("jbeam/io")`
---@class jbeam_io
local jbeam_io = {}

--- Ne fait rien (le corps est commenté) ; existe pour symétrie avec startLoading.
---Source : lua/common/jbeam/io.lua:297
function jbeam_io.finishLoading() end

--- Liste les noms de pièces dont le slotType est slotType (ne gère pas slots2).
---Source : lua/common/jbeam/io.lua:351
---@param ioCtx table Contexte renvoyé par startLoading.
---@param slotType string Type d'emplacement.
---@return string[]  Noms de pièces ({} si aucune).
function jbeam_io.getAvailablePartNamesForSlot(ioCtx, slotType) end

--- Liste toutes les pièces des dossiers du contexte avec leur description (description, authors, isAuxiliary, slotInfoUi, modName éventuel). Recharge si les index manquent ; journalise une erreur en cas de noms en double.
---Source : lua/common/jbeam/io.lua:301
---@param ioCtx table Contexte renvoyé par startLoading.
---@return table<string, table>|nil  Table nomDePièce -> description ; nil si le contexte est invalide.
function jbeam_io.getAvailableParts(ioCtx) end

--- Obsolète. Renvoie pour chaque slotType la liste des pièces qui s'y adaptent (selon le slotType de la pièce).
---Source : lua/common/jbeam/io.lua:324
---@param ioCtx table Contexte renvoyé par startLoading.
---@return table<string, string[]>|nil  slotType -> noms de pièces ; nil si contexte invalide.
function jbeam_io.getAvailableSlotNameMap(ioCtx) end

--- Pièces compatibles avec un emplacement. Pour un slot v1 (champ type) renvoie les pièces du type. Pour un slot v2, garde les pièces dont un slotType est dans allowTypes sans qu'aucun de leurs types ne soit dans denyTypes ; les autres sont renvoyées avec la raison 'Part type is in deny list'.
---Source : lua/common/jbeam/io.lua:361
---@param ioCtx table Contexte renvoyé par startLoading.
---@param slotDef table Définition de slot (élément de part.slots2 ou part.slots).
---@param slotMap table|nil Résultat de getAvailableSlotNameMap, à fournir si on appelle plusieurs fois (optimisation).
---@return string[]  Noms de pièces compatibles.
---@return table[]  Pièces refusées : {partName, reason}.
function jbeam_io.getCompatiblePartNamesForSlot(ioCtx, slotDef, slotMap) end

--- Statistiques du dernier startLoading : nombre total de fichiers et nombre servis par le cache.
---Source : lua/common/jbeam/io.lua:480
---@return table  {total = integer, cachedHits = integer}.
function jbeam_io.getLastStartLoadingStats() end

--- Nom de la première pièce déclarée avec le slotType 'main' dans les dossiers du contexte.
---Source : lua/common/jbeam/io.lua:288
---@param ioCtx table Contexte renvoyé par startLoading.
---@return string|nil  Nom de la pièce principale.
function jbeam_io.getMainPartName(ioCtx) end

--- Renvoie la définition complète d'une pièce (table jbeam décodée, avec partName) et le fichier d'origine.
---Source : lua/common/jbeam/io.lua:267
---@param ioCtx table Contexte renvoyé par startLoading.
---@param partName string|nil Nom de la pièce.
---@return table|nil  Pièce décodée ; nil si introuvable ou nom nil.
---@return string|nil  Nom du fichier .jbeam.
function jbeam_io.getPart(ioCtx, partName) end

--- Hook appelé au chargement de l'extension : récupère extensions.core_modmanager pour associer les pièces à leur mod.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/io.lua:484
function jbeam_io.onExtensionLoaded() end

--- Hook appelé quand un fichier change sur le disque : pour un .jbeam, supprime son cache et force un nouveau scan des dossiers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/io.lua:466
---@param filename string Fichier modifié.
---@param type string Type de changement (utilisé dans le journal).
function jbeam_io.onFileChanged(filename, type) end

--- Parse (ou récupère du cache) tous les *.jbeam des dossiers donnés, reconstruit les index globaux si un fichier a changé et mémorise des statistiques (total/cachedHits).
---Source : lua/common/jbeam/io.lua:230
---@param directories string[] Liste de dossiers jbeam (ex. '/vehicles/pickup/').
---@return table  Contexte ioCtx {preloadedDirs = directories}.
function jbeam_io.startLoading(directories) end

return jbeam_io
