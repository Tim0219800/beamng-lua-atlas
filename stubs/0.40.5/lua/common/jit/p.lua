---@meta
-- tim19Atlas stub generated from lua/common/jit/p.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module jit.p de LuaJIT (auteur Mike Pall, licence MIT, copyright 2005-2026) : interface simple au profileur à faible surcharge intégré à LuaJIT (jit.profile). Il échantillonne la pile d'appel et produit un rapport (fonctions, module:ligne, états de la VM, zones, annotations de source ou format brut pour flame graphs). Dans BeamNG la copie est adaptée (opérateurs != et += de la syntaxe étendue du jeu). L'option de mode est une chaîne de lettres : f/F/l (format de pile), nombre = profondeur, s (split), p (chemins), v (états VM), z (zones), r (compte brut), a/A (annotations), G (sortie pour graphes), m<n> (pourcentage minimal, 3 par défaut), i<n> (intervalle en ms, 10 par défaut).
--- Accès : `require("jit/p")`
---@class jit_p
local jit_p = {}

--- Démarre le profileur avec la chaîne de mode donnée. Prévu pour l'option -jp de la ligne de commande LuaJIT.
---Source : lua/common/jit/p.lua:294
---@param mode string|nil Chaîne de lettres/nombres (voir module) ; « f » par défaut.
---@param outfile string|nil Fichier de sortie ; défaut LUAJIT_PROFILEFILE ou stdout ; '-' = stdout.
function jit_p.start(mode, outfile) end

--- Arrête le profileur et écrit le résultat (« [No samples collected] » s'il n'y a aucun échantillon). Ferme le fichier de sortie s'il n'est pas stdout.
---Source : lua/common/jit/p.lua:224
function jit_p.stop() end

return jit_p
