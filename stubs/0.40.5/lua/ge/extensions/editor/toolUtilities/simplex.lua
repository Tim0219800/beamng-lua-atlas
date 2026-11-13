---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/simplex.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bruit simplex 2D (grille simpliciale de Perlin) avec table de permutation fixe, donc déterministe. Optimisé pour des millions d'échantillons (facteurs de déformation précalculés, gradients dans deux tableaux plats, indices de gradient précalculés). Utilisé par les outils de l'éditeur pour des variations pseudo-aléatoires reproductibles.
--- Accès : extension `editor_toolUtilities_simplex` : `extensions.load("editor_toolUtilities_simplex")`, puis la globale `editor_toolUtilities_simplex`
---@class editor_toolUtilities_simplex
editor_toolUtilities_simplex = {}

--- Bruit simplex 2D au point (xin, yin).
---Source : lua/ge/extensions/editor/toolUtilities/simplex.lua:54
---@param xin number Coordonnée x.
---@param yin number Coordonnée y.
---@return number  Valeur de bruit, environ [-1, 1].
function editor_toolUtilities_simplex.noise(xin, yin) end

---@type number
i = nil
