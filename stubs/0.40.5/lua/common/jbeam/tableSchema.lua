---@meta
-- tim19Atlas stub generated from lua/common/jbeam/tableSchema.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Interprète le format tabulaire du jbeam : une section est une liste dont la première ligne est l'en-tête des colonnes et les lignes suivantes sont les données (ex. ["id","posX","posY","posZ"], ["n1", 0, 0, 0]). Le module transforme chaque ligne en table {colonne = valeur}, en y fusionnant les options locales (dictionnaires insérés entre les lignes ou à la fin d'une ligne), les valeurs spéciales (FLT_MAX, |NORMAL|NM_ASPHALT…) et les lignes CSV incluses. process() applique cela à toutes les sections d'un véhicule.
--- Accès : `require("jbeam/tableSchema")`
---@class jbeam_tableSchema
local jbeam_tableSchema = {}

--- Traite un véhicule (ou fichier) jbeam entier : initialise vehicle.maxIDs, vehicle.validTables, vehicle.beams et vehicle.options, déplace les valeurs non-table de la racine dans options, puis remplace chaque section tabulaire (liste non vide) par sa version clé/valeur avec processTableWithSchemaDestructive.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/tableSchema.lua:225
---@param vehicle table données jbeam (modifiées en place)
---@param processSlotsTable boolean|nil traiter aussi les sections slots/slots2 (faux = laissées au module io)
---@param omitWarnings boolean|nil supprimer les avertissements
---@return boolean  false si un nom de section est invalide, sinon true
function jbeam_tableSchema.process(vehicle, processSlotsTable, omitWarnings) end

--- Traite une section tabulaire jbeam : retire l'en-tête (première ligne), convertit chaque ligne en table clé/valeur et la range dans newList. Renvoie le nombre de lignes créées, ou -1 si l'en-tête est invalide (absent, ou dictionnaire au lieu d'une liste).
---Source : lua/common/jbeam/tableSchema.lua:184
---@param jbeamTable table section jbeam (liste) ; modifiée (en-tête retiré, cellules d'options retirées)
---@param newList table table de sortie remplie (clé = id de ligne ou indice, valeur = table de la ligne ; newList.__astNodeIdx = jbeamTable.__astNodeIdx)
---@param inputOptions table|nil options par défaut copiées dans chaque ligne (copie profonde, valeurs spéciales remplacées)
---@param omitWarnings boolean|nil supprime les avertissements d'en-tête/lignes invalides
---@return integer  nombre de lignes créées, ou -1 si en-tête invalide
function jbeam_tableSchema.processTableWithSchemaDestructive(jbeamTable, newList, inputOptions, omitWarnings) end

return jbeam_tableSchema
