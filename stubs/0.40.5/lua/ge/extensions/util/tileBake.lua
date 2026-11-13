---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/tileBake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil réservé au développement : produit des proxys de tuiles pour la ville lointaine. Il répartit chaque mesh statique (TSStatic) et chaque gros objet de forêt du niveau en tuiles de 200 m, fusionne chaque tuile en un mesh, le cuit sur GPU dans un atlas partagé et écrit un glTF par tuile (via la fonction C++ bakeTileToGltf). Les sorties servent ensuite à l'outil DevTools/instalod pour fabriquer des LOD simplifiés. Sortie : /temp/tileBake/<niveau>/tile_<tx>_<ty>/ (PNG d'atlas, tile_<tx>_<ty>.gltf et tile.json).
--- Accès : extension `util_tileBake` : `extensions.load("util_tileBake")`, puis la globale `util_tileBake`
---@class util_tileBake
util_tileBake = {}

--- Hook appelé à la fin du chargement d'un niveau ; réarme le baking (même fonction que onExtensionLoaded).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/tileBake.lua:136
function util_tileBake.onClientPostStartMission() end

--- Armement du baking quand l'extension est chargée alors qu'un niveau est déjà en place : active le mode pending, attente de 60 frames, remise à zéro des compteurs. Même fonction que onClientPostStartMission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/tileBake.lua:136
function util_tileBake.onExtensionLoaded() end

--- Hook appelé à chaque frame. Une fois armé : attend la fin du warmup, collecte les instances par tuile, puis cuit une tuile par appel et logue la progression et le bilan final (OK/échecs).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/tileBake.lua:144
function util_tileBake.onUpdate() end

