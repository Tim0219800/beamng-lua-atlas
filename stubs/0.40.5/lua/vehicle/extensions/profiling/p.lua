---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/profiling/p.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce : profileur LuaJIT (jit.p) de Mike Pall, copyright 2005-2016, licence MIT. C'est une interface simple au profileur à faible surcharge intégré à LuaJIT (module jit.profile). Elle échantillonne la pile d'appels à intervalle régulier et affiche un résumé (fonctions, lignes de module, états de la VM, zones) dans un fichier ou sur la sortie standard. Un moddeur peut l'utiliser dans la VM véhicule pour trouver les fonctions Lua les plus coûteuses.
--- Accès : extension `profiling_p` : `extensions.load (VM véhicule)("profiling_p")`, puis la globale `profiling_p`
---@class profiling_p
profiling_p = {}

--- Démarre le profilage avec le mode donné et choisit la destination de sortie (fichier ouvert en écriture, ou sortie standard).
---Source : lua/vehicle/extensions/profiling/p.lua:304
---@param mode string|nil chaîne de mode (voir notes), « f » par défaut
---@param outfile string|nil fichier de sortie, '-' pour la sortie standard ; nil = LUAJIT_PROFILEFILE ou sortie standard
function profiling_p.start(mode, outfile) end

--- Arrête le profileur et, si doOutput est vrai, écrit le résultat (affichage des meilleures entrées ou annotation de source). Écrit « [No samples collected] » si aucun échantillon n'a été pris.
---Source : lua/vehicle/extensions/profiling/p.lua:231
---@param doOutput boolean|nil vrai pour écrire le résultat
function profiling_p.stop(doOutput) end

