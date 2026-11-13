---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/skeleton.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Modèle minimal d'extension véhicule, et extension réellement utilisée : main.lua la charge toujours (extensions.load("skeleton")) à la fin de l'initialisation du véhicule. Cycle de vie : le gestionnaire d'extensions la charge, appelle onExtensionLoaded(), et si celle-ci renvoie false l'extension est déchargée immédiatement (ses hooks ne seront jamais appelés) ; sinon elle reste active et reçoit les hooks globaux (ici onDebugDraw, appelé à chaque frame de debug par main.lua). Convention : une extension expose ses hooks dans la table M (onExtensionLoaded, onInit, onReset, updateGFX, onDebugDraw, onExtensionUnloaded…) et renvoie M.
--- Celle-ci dessine les poutres et nœuds du véhicule pour aider à démarrer en jbeam quand il n'y a aucun flexbody.
--- Accès : extension `skeleton` : `extensions.load (VM véhicule)("skeleton")`, puis la globale `skeleton`
---@class skeleton
skeleton = {}

--- Hook appelé à chaque frame par main.lua (extensions.hook('onDebugDraw', focusPos)). Dessine toutes les poutres (drawBeam3d), tous les nœuds (drawNodeSphere) et les triangles de collision, sauf si le debug beam (bdebug) est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/skeleton.lua:24
---@param focusPos vec3 Position du focus caméra (non utilisée).
function skeleton.onDebugDraw(focusPos) end

--- Hook appelé juste après le chargement de l'extension. Renvoie false pour se décharger (pas de beams/nodes, showSkeleton faux, ou flexbodies présents), true sinon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/skeleton.lua:11
---@return boolean  false = décharger l'extension, true = la garder.
function skeleton.onExtensionLoaded() end

