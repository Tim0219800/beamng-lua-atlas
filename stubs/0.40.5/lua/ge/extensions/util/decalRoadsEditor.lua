---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/decalRoadsEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Visualisation de débogage, chargée dynamiquement par le moteur ou l'éditeur de monde : à chaque frame, elle dessine les objets AIPath de la scène (chemins de circulation) à proximité de la caméra : sphères rouges aux nœuds, prismes bleus entre nœuds, et des décalques de flèches par voie (cyan pour la voie gauche, rouge pour la droite, inversés si flipDirection). Seuls les AIPath avec drivability > 0 sont affichés.
--- Accès : extension `util_decalRoadsEditor` : `extensions.load("util_decalRoadsEditor")`, puis la globale `util_decalRoadsEditor`
---@class util_decalRoadsEditor
util_decalRoadsEditor = {}

--- Hook de chargement : log « module loaded ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/decalRoadsEditor.lua:109
function util_decalRoadsEditor.onExtensionLoaded() end

--- Hook de déchargement : log « module unloaded ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/decalRoadsEditor.lua:106
function util_decalRoadsEditor.onExtensionUnloaded() end

--- Hook appelé avant chaque rendu : dessine les AIPath proches de la caméra (nœuds, segments, flèches de voies).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/decalRoadsEditor.lua:9
---@param dt number Durée de la frame (s) ; non utilisée.
function util_decalRoadsEditor.onPreRender(dt) end

