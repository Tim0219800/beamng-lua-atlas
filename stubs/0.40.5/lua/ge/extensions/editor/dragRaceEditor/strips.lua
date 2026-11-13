---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/strips.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les strips (pistes de drag) dans l'éditeur de drag race. Un strip est un fichier <id>.strip.json du dossier dragstrips du niveau : id, name, description, endCamera, lanes (voies avec waypoints stage/endLine, boundary, zone) et stripZone. Le module charge, sélectionne, crée, supprime et sauvegarde les strips (avec renommage de fichier si l'id change), dessine les panneaux ImGui (liste, détails, éditeur de voie) et l'aperçu 3D (zones, frontières). Il contrôle aussi que les objets de scène attendus (BeamNGWaypoint, feux, afficheurs) existent avec les noms de la convention <stripId>_<type>_<n°voie> et peut renommer ceux qui portent d'anciens noms (Prestagelight_1, display_time_1_r, BlueLight…).
--- Accès : extension `editor_dragRaceEditor_strips` : `extensions.load("editor_dragRaceEditor_strips")`, puis la globale `editor_dragRaceEditor_strips`
---@class editor_dragRaceEditor_strips
editor_dragRaceEditor_strips = {}

--- Ajoute un strip par défaut « New Strip » avec deux voies, non sauvegardé, et le sélectionne.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:227
function editor_dragRaceEditor_strips.addStrip() end

--- Mémorise la transformation de départ de la boundary dans M.boundaryDragStart.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:945
---@param boundary table boundary
function editor_dragRaceEditor_strips.beginBoundaryDrag(boundary) end

--- Pendant le glisser : recopie position, rotation ou scale du gizmo dans la boundary selon le mode, et marque le strip modifié.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:953
---@param boundary table boundary
function editor_dragRaceEditor_strips.draggingBoundary(boundary) end

--- Dessine en debug une boîte pleine à partir d'un coin et de trois vecteurs d'arête.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:981
---@param corner vec3 coin
---@param x vec3 arête X
---@param y vec3 arête Y
---@param z vec3 arête Z
---@param clr ColorF couleur de remplissage
function editor_dragRaceEditor_strips.drawAxisBox(corner, x, y, z, clr) end

--- Dessine toutes les boundaries des voies du strip sélectionné (magenta si sélectionnée, sinon couleur de la voie).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:1031
function editor_dragRaceEditor_strips.drawBoundariesInWorld() end

--- Dessine l'éditeur de la voie sélectionnée (infos, waypoints, boundary, zone ; bouton d'édition de zone dans la scène).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:659
function editor_dragRaceEditor_strips.drawLaneEditor() end

--- Dessine l'édition du strip sélectionné (id, nom, description, caméra de fin, zone, liste des voies, état des objets de scène attendus).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:434
function editor_dragRaceEditor_strips.drawStripDetails() end

--- Dessine la section ImGui « Strips » (Add, Remove, Save, Refresh, liste ; entrées modifiées en orange).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:372
function editor_dragRaceEditor_strips.drawStripsList() end

--- Dessine le nom du strip sélectionné à l'origine et ses zones.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:919
function editor_dragRaceEditor_strips.drawStripsPreview() end

--- Dessine en debug 3D (mode « faded ») la zone du strip et celles des voies, hors zone en cours d'édition, avec la couleur de la voie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:894
function editor_dragRaceEditor_strips.drawZonesInWorld() end

--- Sélectionne un strip et une voie par index et renvoie la voie.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:639
---@param stripIndex integer index du strip (base 1)
---@param laneIndex integer index de la voie (base 1)
---@return table|nil  voie, nil si index hors bornes
function editor_dragRaceEditor_strips.editLane(stripIndex, laneIndex) end

--- Place le gizmo d'axes de l'éditeur sur une boundary et branche les callbacks de glisser.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:927
---@param boundary table|nil boundary avec transform {position, rotation, scale}
function editor_dragRaceEditor_strips.enableBoundaryGizmo(boundary) end

--- Fin du glisser : efface M.boundaryDragStart.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:977
---@param boundary table boundary
function editor_dragRaceEditor_strips.endBoundaryDrag(boundary) end

--- Renvoie la liste des strips chargés.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:171
---@return table  tableau de strips
function editor_dragRaceEditor_strips.getAllStrips() end

--- Renvoie la voie sélectionnée du strip sélectionné.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:651
---@return table|nil  voie ou nil
function editor_dragRaceEditor_strips.getSelectedLane() end

--- Renvoie le strip sélectionné.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:192
---@return table|nil  strip ou nil
function editor_dragRaceEditor_strips.getSelectedStrip() end

--- Index (base 1) du strip sélectionné, -1 si aucun.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:184
---@return integer  index
function editor_dragRaceEditor_strips.getSelectedStripIndex() end

--- Indique si au moins un strip a un fichier sur disque et n'est pas modifié.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:175
---@return boolean  résultat
function editor_dragRaceEditor_strips.hasSavedStrips() end

--- Charge tous les strips du niveau via dragSaveSystem.getAllStrips(), remet _dirty à false et complète _filePath.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:157
function editor_dragRaceEditor_strips.loadAllStrips() end

--- Retire le strip sélectionné de la liste (fichier non supprimé) et ajuste la sélection.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:313
function editor_dragRaceEditor_strips.removeSelectedStrip() end

--- Sauve le strip dans <dossier dragstrips du niveau>/<id>.strip.json via dragSaveSystem.saveStrip. Crée le dossier si besoin et renomme l'ancien fichier si l'id a changé (échec si le nouveau nom existe).
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:327
---@param strip table strip à sauver
---@return boolean  succès
function editor_dragRaceEditor_strips.saveStrip(strip) end

--- Sélectionne un strip (voir notes : met à jour stripId des réglages courants, quitte l'édition de zone, désélectionne les réglages).
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:199
---@param index integer index base 1
function editor_dragRaceEditor_strips.selectStrip(index) end

--- Fixe l'index sélectionné sans effets de bord.
---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:188
---@param index integer index base 1 ou -1
function editor_dragRaceEditor_strips.setSelectedStripIndex(index) end

