---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/simplex3.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bruit simplex 3D (grille simpliciale de Ken Perlin, d'après la référence de Stefan Gustavson). Déterministe, continu avec dérivée première continue. Les indices de gradient (perm % 12 + 1) sont précalculés pour accélérer les appels massifs.
--- Accès : extension `editor_toolUtilities_simplex3` : `extensions.load("editor_toolUtilities_simplex3")`, puis la globale `editor_toolUtilities_simplex3`
---@class editor_toolUtilities_simplex3
editor_toolUtilities_simplex3 = {}

--- Bruit simplex 3D au point (xin, yin, zin).
---Source : lua/ge/extensions/editor/toolUtilities/simplex3.lua:55
---@param xin number Coordonnée x.
---@param yin number Coordonnée y.
---@param zin number Coordonnée z.
---@return number  Valeur de bruit, environ [-1, 1].
function editor_toolUtilities_simplex3.noise(xin, yin, zin) end

---@type number
i = nil
