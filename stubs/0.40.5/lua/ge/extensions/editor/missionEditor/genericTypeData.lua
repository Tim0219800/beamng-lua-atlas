---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/genericTypeData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du panneau « Mission Type Data ». Champs principaux : missionEditor, mission, missionTypes (liste triée), missionTypeEditors (éditeur par type), rawEditPerMission, oldMissionTypeData, mtdIssues.
---@class editor_missionEditor_genericTypeData
local editor_missionEditor_genericTypeData = {}

--- Change le type de la mission : sauvegarde les données du type actuel, crée (ou restaure) celles du nouveau type, puis rappelle setMission.
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:77
---@param newType string Nouveau type de mission.
---@param force boolean|nil Si vrai, efface l'historique des anciennes données de cette mission avant de sauvegarder.
function editor_missionEditor_genericTypeData:changeMissionType(newType, force) end

--- Dessine le panneau : combo du type de mission, case « Raw », bouton « Auto fix N issues », puis l'éditeur du type ou l'éditeur JSON brut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:244
function editor_missionEditor_genericTypeData:draw() end

--- Pour chaque type dont l'éditeur définit toolsFunctions, crée un sous-menu et appelle cette fonction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:340
function editor_missionEditor_genericTypeData:drawTools() end

--- Appelle drawViews(liste des missions) sur chaque éditeur de type qui le définit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:364
function editor_missionEditor_genericTypeData:drawViews() end

--- Pour chaque type dont l'éditeur définit viewFunctions, crée un sous-menu et appelle cette fonction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:352
function editor_missionEditor_genericTypeData:drawViewsMenu() end

--- Remplace mission.missionTypeData par les données neuves fournies par l'éditeur du type de la mission (getNewData), ou {} s'il n'y en a pas.
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:72
---@param mission table Mission à remplir.
function editor_missionEditor_genericTypeData:fillGeneric(mission) end

--- Renvoie l'éditeur du type de la mission courante.
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:372
---@return table|nil  Éditeur (editorHelper) du type courant.
function editor_missionEditor_genericTypeData:getCurrentEditorHelper() end

--- Renvoie la liste des problèmes d'une mission : résultat de checkContainer de l'éditeur de son type, plus ceux de calculateMissionIssues du type s'il existe (appelé en pcall).
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:375
---@param m table Mission à vérifier.
---@return table[]  Liste d'éléments {label, severity}.
function editor_missionEditor_genericTypeData:getMissionIssues(m) end

--- Constructeur appelé par la fonction renvoyée par le module. Récupère la liste triée des types de mission et l'éditeur de chaque type.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:25
---@param missionEditor table Module principal editor_missionEditor.
function editor_missionEditor_genericTypeData:init(missionEditor) end

--- Cherche /gameplay/missionTypes/<missionType>/editor.lua et l'instancie avec missionEditor. Si le fichier n'existe pas ou ne se charge pas, crée un éditeur générique via gameplay_missions_missions.editorHelper.
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:41
---@param missionType string Nom du type de mission.
function editor_missionEditor_genericTypeData:loadEditor(missionType) end

--- Ouvre le popup imgui « missionFGVariables » (aide aux variables Flowgraph).
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:99
function editor_missionEditor_genericTypeData:openPopup() end

--- Définit la mission courante, transmet le conteneur à l'éditeur de son type (setContainer) et recalcule les problèmes (checkContainer) dans self.mtdIssues.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:60
---@param mission table Données de la mission (id, missionType, missionTypeData…).
function editor_missionEditor_genericTypeData:setMission(mission) end

--- Dessine le popup qui classe les champs du type de mission en variables manquantes, de type différent, correctes, et variables présentes seulement dans le Flowgraph. Les boutons ajoutent les variables manquantes (valeur par défaut du type) ou corrigent leur type dans le projet Flowgraph courant (editor_flowgraphEditor.getManager()). À appeler à chaque frame.
---Source : lua/ge/extensions/editor/missionEditor/genericTypeData.lua:103
function editor_missionEditor_genericTypeData:variablesHelperPopup() end

