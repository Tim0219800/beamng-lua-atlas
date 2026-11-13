---@meta
-- tim19Atlas stub generated from lua/common/jit/v.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module jit.v de LuaJIT (Mike Pall, licence MIT, 2005-2026) : mode verbeux du compilateur JIT. Il affiche une ligne par trace générée ([TRACE n fichier:ligne ...]) et par trace abandonnée, ce qui aide à voir quel code est compilé ou où le compilateur retombe sur l'interpréteur (NYI). Sortie par défaut sur stderr ; fichier via argument ou variable d'environnement LUAJIT_VERBOSEFILE.
--- Accès : `require("jit/v")`
---@class jit_v
local jit_v = {}

--- Détache le handler de traces et ferme le fichier (sauf stdout/stderr).
---Source : lua/common/jit/v.lua:146
function jit_v.off() end

--- Ouvre le fichier de sortie et attache le handler de traces (jit.attach 'trace').
---Source : lua/common/jit/v.lua:156
---@param outfile string|nil Fichier de sortie ; défaut LUAJIT_VERBOSEFILE sinon stderr ; '-' = stdout.
function jit_v.on(outfile) end

--- Alias de on, prévu pour l'option -jv de la ligne de commande.
---Source : lua/common/jit/v.lua:156
---@param outfile string|nil Fichier de sortie.
function jit_v.start(outfile) end

return jit_v
