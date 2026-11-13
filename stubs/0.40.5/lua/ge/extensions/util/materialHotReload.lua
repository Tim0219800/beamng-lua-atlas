---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/materialHotReload.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rechargement à chaud des fichiers *.materials.json et *.material.json : quand l'un d'eux est modifié sur disque, l'extension le relit (loadJsonMaterialsFile, qui met à jour les objets Material en mémoire) puis appelle reload() sur chaque matériau de classe « Material » déclaré dans le fichier. Utile à un créateur de matériaux/textures pour voir ses changements sans relancer le niveau.
--- Accès : extension `util_materialHotReload` : `extensions.load("util_materialHotReload")`, puis la globale `util_materialHotReload`
---@class util_materialHotReload
util_materialHotReload = {}

--- Hook appelé quand un fichier surveillé change sur disque. Si c'est une modification d'un fichier de matériaux, recharge le fichier et les matériaux concernés puis logue le nombre de matériaux rechargés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/materialHotReload.lua:30
---@param filename string Chemin du fichier modifié
---@param type string Type de changement ; seul "modified" est traité
function util_materialHotReload.onFileChanged(filename, type) end

--- Appelé à l'initialisation de l'extension : demande qu'elle reste chargée lors des changements de niveau ou de mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/materialHotReload.lua:36
function util_materialHotReload.onInit() end

