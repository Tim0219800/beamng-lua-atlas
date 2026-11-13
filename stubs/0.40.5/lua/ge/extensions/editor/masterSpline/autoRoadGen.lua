---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/autoRoadGen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génération automatique de routes de l'outil Master Spline : entre chaque paire de nœuds consécutifs, une recherche de chemin sur grille (8 directions, file de priorité minheap) tient compte du terrain, de la pente maximale, du rayon minimal et de l'évitement de pente du preset de route. Le chemin est simplifié (RDP), élargi dans les virages serrés, ajusté en Z, interpolé (Catmull-Rom) puis affiché en aperçu avant d'être converti en spline.
--- Accès : extension `editor_masterSpline_autoRoadGen` : `extensions.load("editor_masterSpline_autoRoadGen")`, puis la globale `editor_masterSpline_autoRoadGen`
---@class editor_masterSpline_autoRoadGen
editor_masterSpline_autoRoadGen = {}

--- Efface l'aperçu courant (nœuds et largeurs).
---Source : lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:67
function editor_masterSpline_autoRoadGen.clearPreview() end

--- Convertit l'aperçu en géométrie de la spline (nodes, widths, nmls), la marque isDirty, active l'auto-dévers si bankingStrength > 0, puis efface l'aperçu. Si l'aperçu a moins de 2 nœuds, il est vidé sans rien créer.
---Source : lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:346
---@param spline table Spline à remplir.
---@param bankingStrength number Force du dévers automatique ; 0 ou moins désactive le dévers.
---@param autoBankFalloff number Atténuation du dévers automatique (copiée dans spline.autoBankFalloff).
function editor_masterSpline_autoRoadGen.createAutoRoad(spline, bankingStrength, autoBankFalloff) end

--- Génère l'aperçu d'une route automatique passant par les nœuds de la spline (au moins 2, sinon retourne sans rien faire). Chaque segment est calculé séparément, les doublons aux jonctions sont retirés, puis le chemin est simplifié, élargi dans les épingles, mis à la pente autorisée et au plus près du terrain, interpolé et re-simplifié.
---Source : lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:290
---@param spline table Master Spline dont les nodes servent de waypoints.
---@param autoParams table Paramètres de l'outil (baseWidth, slopeAvoidance, widthBlend).
---@param presetParams table Contraintes du preset de route (maxSlope, minRadius, maxWidthGradient).
function editor_masterSpline_autoRoadGen.generateAutoPreview(spline, autoParams, presetParams) end

--- Dessine le ruban d'aperçu (rSpline.renderPreviewRibbon). À appeler une fois par image ; ne fait rien si la spline est nil ou l'aperçu vide.
---Source : lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:375
---@param spline table|nil Spline courante.
function editor_masterSpline_autoRoadGen.handlePreview(spline) end

--- Indique si un aperçu de route existe (au moins un nœud de chemin).
---Source : lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:64
---@return boolean  true si un aperçu existe.
function editor_masterSpline_autoRoadGen.isPreview() end

