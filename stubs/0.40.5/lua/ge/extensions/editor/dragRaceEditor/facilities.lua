---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/facilities.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les facilities (installations de drag) dans l'éditeur de drag race : liste chargée via gameplay_drag_saveSystem, sélection, création, suppression, sauvegarde en <id>.facility.json dans le dossier dragstrips du niveau (avec renommage du fichier si l'id change), et panneaux ImGui (liste, détails, ajout/retrait de strips). Une facility regroupe des chemins de fichiers strip (stripIds).
--- Accès : extension `editor_dragRaceEditor_facilities` : `extensions.load("editor_dragRaceEditor_facilities")`, puis la globale `editor_dragRaceEditor_facilities`
---@class editor_dragRaceEditor_facilities
editor_dragRaceEditor_facilities = {}

--- Crée une facility « New Facility » (id new_facility_N, stripIds vide, _dirty=true), l'ajoute et la sélectionne.
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:91
function editor_dragRaceEditor_facilities.addFacility() end

--- Dessine la liste ImGui avec boutons Add, Remove, Save, Refresh ; les entrées non sauvées sont en orange.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:197
function editor_dragRaceEditor_facilities.drawFacilitiesList() end

--- Dessine en debug 3D le nom de la facility sélectionnée à l'origine.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:386
function editor_dragRaceEditor_facilities.drawFacilitiesPreview() end

--- Dessine l'édition de la facility sélectionnée : id, nom, description, ajout (liste déroulante avec recherche) et retrait de strips.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:248
function editor_dragRaceEditor_facilities.drawFacilityDetails() end

--- Renvoie la liste des facilities.
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:32
---@return table  tableau de facilities
function editor_dragRaceEditor_facilities.getAllFacilities() end

--- Renvoie la facility sélectionnée.
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:53
---@return table|nil  facility ou nil
function editor_dragRaceEditor_facilities.getSelectedFacility() end

--- Index (base 1) de la facility sélectionnée, -1 si aucune.
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:45
---@return integer  index
function editor_dragRaceEditor_facilities.getSelectedFacilityIndex() end

--- Indique si au moins une facility a un fichier et n'est pas modifiée.
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:36
---@return boolean  résultat
function editor_dragRaceEditor_facilities.hasSavedFacilities() end

--- Charge toutes les facilities avec dragSaveSystem.getAllFacilities(), remet _dirty à false et complète _filePath depuis le dossier drag du niveau.
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:18
function editor_dragRaceEditor_facilities.loadAllFacilities() end

--- Retire de la liste la facility sélectionnée (le fichier sur disque n'est pas supprimé) et ajuste la sélection.
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:111
function editor_dragRaceEditor_facilities.removeSelectedFacility() end

--- Sauve toutes les facilities modifiées dans le dossier drag du niveau, qu'elle crée si besoin.
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:125
---@return boolean  false si aucun niveau ou dossier non créable, sinon true (même si une sauvegarde individuelle a échoué)
function editor_dragRaceEditor_facilities.saveAllFacilities() end

--- Sauve une facility dans <niveau>/<id>.facility.json. Si l'id a changé, renomme d'abord l'ancien fichier (échoue si le nouveau existe déjà).
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:154
---@param facility table facility à sauver
---@return boolean  succès
function editor_dragRaceEditor_facilities.saveFacility(facility) end

--- Sélectionne une facility : quitte l'édition de zone, désélectionne strip et réglages, met facilityId dans les réglages de drag courants et marque des changements non sauvés.
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:60
---@param index integer index base 1
function editor_dragRaceEditor_facilities.selectFacility(index) end

--- Fixe l'index sélectionné sans effets de bord.
---Source : lua/ge/extensions/editor/dragRaceEditor/facilities.lua:49
---@param index integer index base 1
function editor_dragRaceEditor_facilities.setSelectedFacilityIndex(index) end

