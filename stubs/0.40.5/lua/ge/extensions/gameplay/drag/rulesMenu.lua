---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/rulesMenu.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contexte de l'écran de règles de drag (interface Vue « mission.dragRules »). Il retrouve la piste associée à une installation (facility.id, avec suffixe « Rules » retiré), fournit à l'UI les options (dragType heads-up/bracket, arbre .400/.500, timers disponibles, valeurs par défaut et sauvegardées) et enregistre ou restaure les règles choisies pour une piste. Il pose aussi une laisse de 12 m autour de la porte de l'installation : le menu se ferme tout seul si le véhicule du joueur s'éloigne.
--- Accès : extension `gameplay_drag_rulesMenu` : `extensions.load("gameplay_drag_rulesMenu")`, puis la globale `gameplay_drag_rulesMenu`
---@class gameplay_drag_rulesMenu
---@field dependencies string[] Liste vide.
gameplay_drag_rulesMenu = {}

--- Renvoie les règles sauvegardées d'une piste pour que l'UI puisse les restaurer (bouton Restore).
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:192
---@param levelId string Identifiant de niveau.
---@param stripId string Identifiant de piste.
---@return table|nil  {dragType, treeType, importantTimerId} ou nil.
function gameplay_drag_rulesMenu.applyRulesRestore(levelId, stripId) end

--- Enregistre les règles d'une piste (bouton Save de l'UI). Ne fait rien si un argument manque.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:186
---@param levelId string Identifiant de niveau.
---@param stripId string Identifiant de piste.
---@param rules table {dragType, treeType, importantTimerId}.
function gameplay_drag_rulesMenu.applyRulesSave(levelId, stripId, rules) end

--- Ferme le contexte de règles : supprime la laisse, oublie l'installation et les données de piste.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:113
function gameplay_drag_rulesMenu.closeMenu() end

--- Installation ouverte via un POI d'installation.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:126
---@return table|nil  Installation ou nil.
function gameplay_drag_rulesMenu.getCurrentFacility() end

--- Données pour l'écran Vue des règles : levelId, stripId, stripName, location (titre du niveau), numLanes, timers (id, label, labelKey, shortLabel, type, distance), dragTypeOptions, treeTypeOptions, defaults (issus de la piste) et saved (préréglage sauvegardé ou créé).
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:136
---@param facilityIdOrStripId string Identifiant d'installation (par ex. 'alderStripRules') ou de piste.
---@return table|nil  Données, nil si la piste est introuvable dans le niveau courant.
function gameplay_drag_rulesMenu.getRulesScreenData(facilityIdOrStripId) end

--- Règles sauvegardées d'une piste (dragType, treeType, importantTimerId), utilisées par poi.applyUserRulesToData au démarrage depuis un POI.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:131
---@param levelId string Identifiant de niveau.
---@param stripId string Identifiant de piste.
---@return table|nil  Règles ou nil.
function gameplay_drag_rulesMenu.getSavedRulesForStrip(levelId, stripId) end

--- Vrai si le contexte de règles est actif.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:121
---@return boolean  Menu ouvert ou non.
function gameplay_drag_rulesMenu.isMenuOpen() end

--- Hook par frame : ferme le menu si le véhicule du joueur (joueur 0) sort de la laisse de 12 m (ou n'existe plus).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:197
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta brut (s).
function gameplay_drag_rulesMenu.onUpdate(dtReal, dtSim, dtRaw) end

--- Ouvre le contexte de règles pour une installation : charge les données de la piste correspondante et pose la laisse sur la porte la plus proche (freeroam_facilities).
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:104
---@param facility table Installation (champ id).
function gameplay_drag_rulesMenu.openMenu(facility) end

