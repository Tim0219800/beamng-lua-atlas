---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre d'outils de la boucle de rallye. Champs principaux : missionDropdownItems, selectedMissionIndex, selectedMissionId, selectedMissionDir, drawRoute, drawLabels, drawZOnTop, drawSignboards, drawVehBB, drawLeadingPoint, showDebugInfo (BoolPtr imgui), signboards, syncedManager.
---@class gameplay_rally_tools_loopToolbox
local gameplay_rally_tools_loopToolbox = {}

--- Transmet l'option showDebugInfo au manager de boucle (setDrawFlag) et retient ce manager comme synchronisé.
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:102
---@param manager table|nil RallyLoopManager.
function gameplay_rally_tools_loopToolbox:applyManagerDrawFlags(manager) end

--- Dessine tout le contenu de la fenêtre (à appeler entre im.Begin et im.End).
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:384
---@param manager table|nil RallyLoopManager actif ; sans manager, seule la partie chargement est affichée.
function gameplay_rally_tools_loopToolbox:draw(manager) end

--- Dessin 3D de debug : délègue à gameplay_rallyLoop.drawDebug avec les options zOnTop, route et étiquettes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:1076
function gameplay_rally_tools_loopToolbox:drawDebug() end

--- Dessine le nom court de chaque panneau trouvé au-dessus de sa position (debugDrawer:drawTextAdvanced).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:1081
function gameplay_rally_tools_loopToolbox:drawSignboardsDebug() end

--- Affiche les problèmes de validation du planning (bloquants en rouge, autres en orange) ou « Validation: OK ».
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:356
---@param manager table RallyLoopManager.
---@return boolean  true s'il existe un problème bloquant ou si le planning est invalide.
function gameplay_rally_tools_loopToolbox:drawValidation(manager) end

--- Cherche dans la scène les panneaux de rallye et les mémorise dans self.signboards, avec leur position, shapeName et champ dynamique `flag`.
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:150
---@return integer  Nombre de panneaux trouvés.
function gameplay_rally_tools_loopToolbox:findSignboards() end

--- Formate une durée en [h:]mm:ss (ou avec dixièmes).
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:332
---@param seconds number|nil Durée en secondes.
---@param showSubseconds boolean|nil true pour afficher les dixièmes.
---@return string  Texte, 'N/A' si nil.
function gameplay_rally_tools_loopToolbox:formatDuration(seconds, showSubseconds) end

--- Id de la mission choisie dans le menu (extrait de « Nom (id) »).
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:139
---@return string|nil  Id, nil si « <none> ».
function gameplay_rally_tools_loopToolbox:getSelectedMissionId() end

--- Constructeur : initialise les options, charge les réglages sauvegardés et la liste des missions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:21
function gameplay_rally_tools_loopToolbox:init() end

--- Relit ce fichier et applique les options ; si le fichier est absent, crée des réglages par défaut tout à faux. Recherche les panneaux si leur affichage était activé.
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:62
function gameplay_rally_tools_loopToolbox:loadSettings() end

--- Remplit le menu déroulant avec les missions de type rallyLoop du niveau courant (« Nom (id) ») et sélectionne la mission sauvegardée si elle existe.
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:108
function gameplay_rally_tools_loopToolbox:refreshMissionList() end

--- Écrit la mission choisie et les options de dessin dans /settings/rally/loopToolbox.json.
---Source : lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:48
function gameplay_rally_tools_loopToolbox:saveSettings() end

