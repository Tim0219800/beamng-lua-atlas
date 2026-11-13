---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/perlin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bruit de Perlin 2D classique (table de permutation fixe de 256 entrées, courbe fade de Perlin améliorée), déterministe. Sert aux outils de l'éditeur pour générer des variations pseudo-aléatoires reproductibles.
--- Accès : extension `editor_toolUtilities_perlin` : `extensions.load("editor_toolUtilities_perlin")`, puis la globale `editor_toolUtilities_perlin`
---@class editor_toolUtilities_perlin
editor_toolUtilities_perlin = {}

--- Renvoie le bruit de Perlin 2D au point (x, y). Valeur continue, nulle aux coordonnées entières, d'amplitude voisine de [-1, 1] environ.
---Source : lua/ge/extensions/editor/toolUtilities/perlin.lua:49
---@param x number Coordonnée x.
---@param y number Coordonnée y.
---@return number  Valeur de bruit.
function editor_toolUtilities_perlin.noise(x, y) end

---@type number
i = nil
