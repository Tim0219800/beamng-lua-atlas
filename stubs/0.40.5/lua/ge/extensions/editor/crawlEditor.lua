---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de données de « crawl » (escalade/rock crawling) du World Editor, fenêtre « Crawl Data Editor » (menu Gameplay). Il charge, édite et sauvegarde quatre types d'objets via gameplay/crawl/saveSystem : trails (parcours reliant un chemin, une frontière et une position de départ), paths (nœuds), boundaries (zones) et starting positions. Il liste aussi les objets venant de missions (/gameplay/missions/<niveau>/crawl/<mission>/). Il délègue l'édition aux sous-modules crawlEditor/paths, boundaries, trails, startingPositions, input et missionPortTool, enregistre quatre modes d'édition (pathEditMode, boundaryEditMode, startingPositionEditMode, trailEditMode) et dessine en permanence les nœuds, frontières et positions de départ sélectionnés. Utile à un moddeur qui crée des parcours de crawl pour un niveau ou veut lire les données chargées depuis une autre extension.
--- Accès : extension `editor_crawlEditor` : `extensions.load("editor_crawlEditor")`, puis la globale `editor_crawlEditor`
---@class editor_crawlEditor
editor_crawlEditor = {}

--- Renvoie la liste des frontières de niveau.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1419
---@return table  Liste de frontières
function editor_crawlEditor.getAllBoundaries() end

--- Renvoie la liste des frontières issues des missions.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1420
---@return table  Liste de frontières de mission
function editor_crawlEditor.getAllMissionBoundaries() end

--- Renvoie la liste des chemins issus des missions.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1418
---@return table  Liste de chemins de mission
function editor_crawlEditor.getAllMissionPaths() end

--- Renvoie la liste des trails provenant des missions crawl du niveau courant.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1416
---@return table  Liste de trails de mission
function editor_crawlEditor.getAllMissionTrails() end

--- Renvoie la liste des chemins de niveau.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1417
---@return table  Liste de chemins
function editor_crawlEditor.getAllPaths() end

--- Renvoie la liste des positions de départ.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1421
---@return table  Liste de positions de départ
function editor_crawlEditor.getAllStartingPositions() end

--- Renvoie la liste des trails de niveau chargés.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1415
---@return table  Liste de trails (table interne)
function editor_crawlEditor.getAllTrails() end

--- Renvoie la frontière sélectionnée (de niveau ou de mission).
---Source : lua/ge/extensions/editor/crawlEditor.lua:280
---@return table|nil  Frontière ou nil
function editor_crawlEditor.getSelectedBoundary() end

--- Renvoie l'index de la frontière sélectionnée.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1424
---@return integer  Index
function editor_crawlEditor.getSelectedBoundaryIndex() end

--- Renvoie le chemin sélectionné (de niveau ou de mission).
---Source : lua/ge/extensions/editor/crawlEditor.lua:271
---@return table|nil  Chemin ou nil
function editor_crawlEditor.getSelectedPath() end

--- Renvoie l'index du chemin sélectionné.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1423
---@return integer  Index
function editor_crawlEditor.getSelectedPathIndex() end

--- Renvoie la position de départ sélectionnée.
---Source : lua/ge/extensions/editor/crawlEditor.lua:289
---@return table|nil  Position de départ ou nil
function editor_crawlEditor.getSelectedStartingPosition() end

--- Renvoie l'index de la position de départ sélectionnée.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1425
---@return integer  Index
function editor_crawlEditor.getSelectedStartingPositionIndex() end

--- Renvoie le trail sélectionné (de niveau ou de mission).
---Source : lua/ge/extensions/editor/crawlEditor.lua:262
---@return table|nil  Trail ou nil
function editor_crawlEditor.getSelectedTrail() end

--- Renvoie l'index du trail sélectionné.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1422
---@return integer  Index (> 0 si sélectionné)
function editor_crawlEditor.getSelectedTrailIndex() end

--- Recharge depuis le disque trails, paths, boundaries et starting positions (via saveSystem.getAll...Files / get...ById), ainsi que ceux des missions crawl du niveau courant. Vide d'abord les listes en mémoire.
---Source : lua/ge/extensions/editor/crawlEditor.lua:167
function editor_crawlEditor.loadAllObjects() end

--- Marque un objet comme modifié (non sauvegardé).
---Source : lua/ge/extensions/editor/crawlEditor.lua:304
---@param objectType string « trail », « path », « boundary » ou « startingPosition »
---@param index integer Index global (objets de mission inclus sauf pour startingPosition)
function editor_crawlEditor.markAsDirty(objectType, index) end

--- Déplace un trail de mission vers /levels/<niveau>/crawls/ : réécrit pathId et boundaryId vers ce dossier, sauve le trail, supprime l'ancien fichier, puis recharge tout. Échoue si le trail n'est pas de mission, si aucun niveau n'est chargé ou si le fichier existe déjà.
---Source : lua/ge/extensions/editor/crawlEditor.lua:456
---@param trail table Trail avec _isFromMission = true
---@return boolean  true si déplacé
function editor_crawlEditor.moveTrailToLevel(trail) end

--- Restaure l'état renvoyé par onSerialize (index à -1 par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor.lua:860
---@param data table|nil Données de onSerialize
function editor_crawlEditor.onDeserialized(data) end

--- Appelé à chaque frame : met à jour la souris (crawlEditor/input), dessine les surcouches permanentes (nœuds, frontières, positions de départ), la fenêtre (menu File avec Save All, listes à gauche, détails à droite, boutons Save/Delete) et la fenêtre de portage de missions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor.lua:873
function editor_crawlEditor.onEditorGui() end

--- Enregistre la fenêtre « Crawl Data Editor » (1800x900), l'entrée de menu (groupe Gameplay) et les quatre modes d'édition avec leurs raccourcis auxiliaires. Appelé une fois à l'initialisation de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor.lua:781
function editor_crawlEditor.onEditorInitialized() end

--- Hook de sérialisation avant rechargement Lua : renvoie dossier/nom de fichier courants, crawlData, onglet courant et index de sélection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor.lua:846
---@return table  Données à restaurer
function editor_crawlEditor.onSerialize() end

--- Renomme le fichier d'un objet crawl et met à jour les références des trails.
---Source : lua/ge/extensions/editor/crawlEditor.lua:74
---@param oldFilePath string Ancien chemin
---@param newFilePath string Nouveau chemin (ne doit pas exister)
---@param objectType string « trail », « path », « boundary » ou « startingPosition »
---@return boolean  true si renommé ; false si chemins identiques/nil, cible existante ou échec
function editor_crawlEditor.renameObjectFile(oldFilePath, newFilePath, objectType) end

--- Définit l'index de la frontière sélectionnée.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1428
---@param index integer Index
function editor_crawlEditor.setSelectedBoundaryIndex(index) end

--- Définit l'index du chemin sélectionné.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1427
---@param index integer Index
function editor_crawlEditor.setSelectedPathIndex(index) end

--- Définit l'index de la position de départ sélectionnée.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1429
---@param index integer Index
function editor_crawlEditor.setSelectedStartingPositionIndex(index) end

--- Définit l'index du trail sélectionné sans toucher aux autres sélections.
---Source : lua/ge/extensions/editor/crawlEditor.lua:1426
---@param index integer Index (1 = premier)
function editor_crawlEditor.setSelectedTrailIndex(index) end

