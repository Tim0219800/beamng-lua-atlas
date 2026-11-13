---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rendu des amas de réparations (patchs d'asphalte) d'une route du Hero Road Editor. Chaque amas group.repairs[i] (créé dans l'onglet Features) devient une dispersion pseudo-aléatoire à graine fixe d'instances de décalques posées sur la chaussée via editor.addDecalInstanceWithTan, avec un DecalData partagé par matériau. C'est de la surface seule : aucun impact sur maillage, trottoirs ou collision. Le résultat est une fonction pure des paramètres de l'amas et de sa graine, donc identique après sauvegarde ou annulation.
--- Accès : extension `editor_heroRoadEditor_repairMgr` : `extensions.load("editor_heroRoadEditor_repairMgr")`, puis la globale `editor_heroRoadEditor_repairMgr`
---@class editor_heroRoadEditor_repairMgr
editor_heroRoadEditor_repairMgr = {}

--- Supprime les instances de décalques de réparation du groupe et leurs modèles DecalData, puis oublie son entrée du store. Appelé à chaque reconstruction et au démontage.
---Source : lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua:41
---@param group table|nil Groupe Hero Road.
function editor_heroRoadEditor_repairMgr.clearRepairs(group) end

--- Reconstruit la dispersion de décalques de chaque amas placé (appelle d'abord clearRepairs). Ne fait rien de plus si la route n'a pas de réparations, moins de 2 divPoints, pas de binormales, pas de dossier de scène ou une longueur nulle.
---Source : lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua:144
---@param group table|nil Groupe Hero Road (repairs, divPoints, binormals, divWidths, sceneTreeFolderId).
function editor_heroRoadEditor_repairMgr.updateRepairs(group) end

