---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rawPois.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cache des points d'intérêt « bruts » (POI) par niveau. Il collecte les POI en émettant le hook `onGetRawPoiListForLevel(levelIdentifier, elements)` auprès de toutes les extensions, filtre la liste selon le contexte (carrière/tutoriel, essai routier, livraison, tutoriels de découverte, multi-siège) et met le résultat en cache avec un numéro de génération. Un moddeur qui ajoute des POI implémente le hook dans son extension et ajoute ses éléments à la table reçue.
--- Accès : extension `gameplay_rawPois` : `extensions.load("gameplay_rawPois")`, puis la globale `gameplay_rawPois`
---@class gameplay_rawPois
---@field onModManagerReady function Alias de clear : le cache est vidé quand le gestionnaire de mods est prêt.
---@field showMissionMarkersToggled function Alias de clear : le cache est vidé quand l'affichage des marqueurs de mission change.
gameplay_rawPois = {}

--- Vide le cache des POI de tous les niveaux et incrémente le numéro de génération (les consommateurs détectent ainsi qu'il faut recharger).
---Source : lua/ge/extensions/gameplay/rawPois.lua:11
function gameplay_rawPois.clear() end

--- Numéro de génération courant du cache (après synchronisation de l'état multi-siège).
---Source : lua/ge/extensions/gameplay/rawPois.lua:188
---@return integer  Génération.
function gameplay_rawPois.getRawPoiGeneration() end

--- Renvoie la liste filtrée des POI d'un niveau, en la construisant (hook onGetRawPoiListForLevel) si elle n'est pas en cache.
---Source : lua/ge/extensions/gameplay/rawPois.lua:75
---@param levelIdentifier string|nil Identifiant du niveau ; si nil, renvoie une liste vide.
---@return table[]  Liste d'éléments POI.
---@return integer  Numéro de génération.
function gameplay_rawPois.getRawPoiListByLevel(levelIdentifier) end

