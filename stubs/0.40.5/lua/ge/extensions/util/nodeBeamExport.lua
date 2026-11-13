---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/nodeBeamExport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exporteur minimal du véhicule du joueur : écrit dans un fichier JSON (.nbexport.json) la liste des nœuds (position et nom éventuel) et des poutres (identifiants de nœuds) du véhicule actif, sous forme d'un graphe point/arête. Utile pour visualiser ou analyser la structure physique d'un véhicule dans un outil externe. Les noms de fichier sont numérotés automatiquement (export_<N>.nbexport.json) dans le dossier du véhicule.
--- Accès : extension `util_nodeBeamExport` : `extensions.load("util_nodeBeamExport")`, puis la globale `util_nodeBeamExport`
---@class util_nodeBeamExport
util_nodeBeamExport = {}

--- Construit le graphe du véhicule actif et l'écrit en JSON. Sans nom de fichier, utilise suggestFilename(). Crée le dossier de destination si nécessaire et logue le résultat.
---Source : lua/ge/extensions/util/nodeBeamExport.lua:97
---@param filename string|nil Chemin du fichier de sortie (défaut : export_<N>.nbexport.json dans le dossier du véhicule)
---@return boolean  true si l'écriture a réussi, false sinon
function util_nodeBeamExport.exportFile(filename) end

--- Propose le prochain nom libre export_<N>.nbexport.json dans le dossier du véhicule actif (cherche les fichiers existants pour incrémenter N) ; crée le dossier au besoin.
---Source : lua/ge/extensions/util/nodeBeamExport.lua:70
---@return string|nil  Chemin proposé, ou nil (erreur loguée) si aucun dossier de véhicule n'est disponible
function util_nodeBeamExport.suggestFilename() end

