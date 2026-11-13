---@meta
-- tim19Atlas stub generated from lua/common/libs/resty/template/microbenchmark.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce lua-resty-template : micro-benchmark du moteur (temps d'analyse, de compilation et d'exécution d'un petit gabarit en boucle). Outil de développement de la bibliothèque, sans usage pour un moddeur.
--- Accès : `require("libs/resty/template/microbenchmark")`
---@class libs_resty_template_microbenchmark
local libs_resty_template_microbenchmark = {}

--- Exécute le benchmark : mesure `parse`, `compile` et l'exécution de gabarits sur `iterations` boucles et affiche les temps (os.clock).
---Source : lua/common/libs/resty/template/microbenchmark.lua:8
---@param iterations integer|nil Nombre d'itérations (défaut 1000).
function libs_resty_template_microbenchmark.run(iterations) end

return libs_resty_template_microbenchmark
