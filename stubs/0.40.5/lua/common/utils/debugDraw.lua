---@meta
-- tim19Atlas stub generated from lua/common/utils/debugDraw.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Enveloppe rapide (FFI) autour du dessin de debug du moteur (BNG_DBG_DRAW_*). Dans le GE les appels se font dans onPreRender(), côté véhicule dans onDebugDraw(). Se charge avec require('utils/debugDraw'). Les couleurs sont des entiers 'packed' (voir la globale color() de utils.lua) et non des ColorF/ColorI. Les champs M.Sphere, M.Line, etc. sont les fonctions FFI brutes (coordonnées séparées x,y,z) ; les M.drawXxx acceptent des vec3.
--- Accès : `require("utils/debugDraw")`
---@class utils_debugDraw
---@field Cylinder function BNG_DBG_DRAW_Cylinder, FFI brut (signature non visible ici).
---@field Line function BNG_DBG_DRAW_Line, FFI brut (signature non visible ici).
---@field LineInstance_MinArg function BNG_DBG_DRAW_LineInstance_MinArg(ax,ay,az,bx,by,bz,w,packedCol), FFI brut.
---@field LineInstance_MinArgBatch function Version par lots de LineInstance_MinArg (FFI brut).
---@field Sphere function BNG_DBG_DRAW_Sphere(x, y, z, r, packedCol, useZ), FFI brut.
---@field SquarePrism function BNG_DBG_DRAW_SquarePrism(...), FFI brut.
---@field Text function BNG_DBG_DRAW_Text, FFI brut (signature non visible ici).
---@field TextAdvanced function BNG_DBG_DRAW_TextAdvanced(x,y,z,txt,packedCol,useAdvancedText,twod,bgColorPacked,shadow,useZ), FFI brut.
---@field TriSolid function BNG_DBG_DRAW_TriSolid(...), FFI brut.
---@field TriSolidBatch function Version par lots de TriSolid (FFI brut).
local utils_debugDraw = {}

--- Dessine une ligne (version instanciée, arguments minimaux).
---Source : lua/common/utils/debugDraw.lua:37
---@param posA vec3 Début
---@param posB vec3 Fin
---@param w number Épaisseur
---@param packedCol integer Couleur RGBA packed
function utils_debugDraw.drawLineInstance_MinArg(posA, posB, w, packedCol) end

--- Dessine une sphère de debug. Seule différence avec debugDrawer : la couleur est un entier packed.
---Source : lua/common/utils/debugDraw.lua:33
---@param pos vec3 Centre (m)
---@param r number Rayon (m)
---@param packedCol integer Couleur RGBA packed (color())
---@param useZ boolean|nil Test de profondeur, true par défaut
function utils_debugDraw.drawSphere(pos, r, packedCol, useZ) end

--- Dessine un prisme à base carrée/rectangulaire entre deux points.
---Source : lua/common/utils/debugDraw.lua:40
---@param base vec3 Centre de la base
---@param tip vec3 Centre de l'extrémité
---@param baseSize vec3 Dimensions (x,y) de la base
---@param tipSize vec3 Dimensions (x,y) de l'extrémité
---@param packedCol integer Couleur RGBA packed
---@param useZ boolean|nil Test de profondeur, true par défaut
function utils_debugDraw.drawSquarePrism(base, tip, baseSize, tipSize, packedCol, useZ) end

--- Dessine un texte à une position 3D ou 2D. Valeurs par défaut : texte blanc, useAdvancedText=false, twod=false, shadow=false, useZ=true.
---Source : lua/common/utils/debugDraw.lua:44
---@param pos vec3 Position
---@param txt string Texte
---@param packedCol integer|nil Couleur du texte (blanc par défaut)
---@param useAdvancedText boolean|nil Texte avancé, false par défaut
---@param twod boolean|nil Position 2D écran, false par défaut
---@param bgColorPacked integer|nil Couleur de fond (voir notes : bug, nil par défaut)
---@param shadow boolean|nil Ombre, false par défaut
---@param useZ boolean|nil Test de profondeur, true par défaut
function utils_debugDraw.drawTextAdvanced(pos, txt, packedCol, useAdvancedText, twod, bgColorPacked, shadow, useZ) end

--- Dessine un triangle plein.
---Source : lua/common/utils/debugDraw.lua:53
---@param posA vec3 Sommet A
---@param posB vec3 Sommet B
---@param posC vec3 Sommet C
---@param packedCol integer Couleur RGBA packed
---@param useZ boolean|nil Test de profondeur, true par défaut
function utils_debugDraw.drawTriSolid(posA, posB, posC, packedCol, useZ) end

return utils_debugDraw
