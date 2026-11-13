---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/bigMapPoiProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de données pour la grande carte : transforme les POI bruts (missions, garages, stations-service, concessionnaires, points de départ, drift, drag, crawl, véhicules du joueur, livraison…) en une structure prête pour l'interface (poiData), des groupes (groupData : rating_, type_, distance_, difficulty_, branch_, missionType_…) et des filtres prédéfinis (freeroam ou carrière). Gère aussi l'état de visibilité de chaque groupe et envoie le tout à l'interface par le hook UI BigmapMissionData. Un moddeur qui ajoute des POI les voit apparaître via gameplay_rawPois ; ce module décide dans quel groupe ils tombent.
--- Accès : extension `freeroam_bigMapPoiProvider` : `extensions.load("freeroam_bigMapPoiProvider")`, puis la globale `freeroam_bigMapPoiProvider`
---@class freeroam_bigMapPoiProvider
---@field dependencies string[] gameplay_missions_missions, freeroam_bigMapMode, gameplay_rawPois, gameplay_playmodeMarkers.
freeroam_bigMapPoiProvider = {}

--- Vide les marqueurs de missions de la minicarte (hook UI NavigationStaticMarkers avec la clé 'missions' et une liste vide) si un niveau est chargé.
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:158
function freeroam_bigMapPoiProvider.clearMissionsFromMinimap() end

--- Marque le drapeau sendToMinimap à true : le prochain onPreRender rappellera sendMissionLocationsToMinimap. Sert aussi de onClientStartMission et requestMissionLocationsForMinimap.
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:10
function freeroam_bigMapPoiProvider.forceSend() end

--- Convertit une mission en table pour l'interface : id, icône, nom, description, miniature, aperçus, difficulté, voyage rapide disponible/débloqué, progression, classement (rating), clé de classement, etc.
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:199
---@param elemData table Données du POI de mission (utilise missionId et idInCluster).
---@return table|nil  Table formatée, nil si la mission n'existe pas.
function freeroam_bigMapPoiProvider.formatMissionForBigmap(elemData) end

--- Convertit un POI non mission en table pour l'interface (id, icône issue de bigmapMarker.cardIcon ou du type, nom, description, miniature, aperçus, voyage rapide, canSetRoute, agrégats). Le voyage rapide n'est disponible qu'hors carrière ou pendant le tutoriel de carrière.
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:177
---@param poi table POI brut de gameplay_rawPois avec markerInfo.bigmapMarker.
---@return table  Table formatée pour la grande carte.
function freeroam_bigMapPoiProvider.formatPoiForBigmap(poi) end

--- Clés des groupes actuellement visibles (selon l'état mémorisé).
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:77
---@return string[]  Clés de groupes visibles.
function freeroam_bigMapPoiProvider.getActiveGroupIds() end

--- Ids des POI appartenant aux groupes visibles des filtres du cache (reconstruit si besoin). Un POI présent dans plusieurs groupes apparaît plusieurs fois.
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:96
---@return string[]  Ids de POI.
function freeroam_bigMapPoiProvider.getAllActiveGroupPoiIds() end

--- Clés de tous les groupes connus (visibles ou non).
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:88
---@return string[]  Clés de groupes.
function freeroam_bigMapPoiProvider.getAllGroupIds() end

--- Filtres de la grande carte (freeroam ou carrière), reconstruits si le cache est invalide.
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:143
---@return table[]  Liste de filtres {key, icon, title, groups}.
function freeroam_bigMapPoiProvider.getCachedFilters() end

--- Groupes indexés par clé (label, icon, elements, visible, groupKey), reconstruits si le cache est invalide.
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:127
---@return table<string, table>  Données des groupes.
function freeroam_bigMapPoiProvider.getCachedGroupData() end

--- Données formatées des POI indexées par id, chacune avec filterData (groupTags, sortingValues).
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:135
---@return table<string, table>  POI formatés.
function freeroam_bigMapPoiProvider.getCachedPoiData() end

--- Indique si un groupe est visible (vrai par défaut si inconnu).
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:63
---@param groupKey string Clé du groupe, par ex. 'type_garage'.
---@return boolean  true si visible.
function freeroam_bigMapPoiProvider.getGroupVisibility(groupKey) end

--- Efface le cache de groupes, POI et filtres ; il sera reconstruit à la prochaine demande.
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:45
function freeroam_bigMapPoiProvider.invalidateCache() end

--- Hook appelé au démarrage d'un niveau : équivaut à forceSend().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:10
function freeroam_bigMapPoiProvider.onClientStartMission() end

--- Hook appelé à chaque image : si l'état de jeu a des marqueurs de mode de jeu et qu'un niveau est chargé et que sendToMinimap est vrai, appelle sendMissionLocationsToMinimap (qui remet le drapeau à false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:702
---@param dtReal number Temps réel écoulé (s).
---@param dtSim number Temps de simulation écoulé (s).
function freeroam_bigMapPoiProvider.onPreRender(dtReal, dtSim) end

--- Demande un nouvel envoi des positions de missions à la minicarte (équivaut à forceSend).
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:10
function freeroam_bigMapPoiProvider.requestMissionLocationsForMinimap() end

--- Remet tous les groupes connus à visible.
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:120
function freeroam_bigMapPoiProvider.resetAllGroupsToVisible() end

--- Reconstruit tout (groupes, POI, filtres), détermine gameMode et règles (canSetRoute), appelle freeroam_bigMapMode.setOnlyIdsVisible avec les POI des groupes visibles, puis envoie le tout à l'interface via guihooks.trigger('BigmapMissionData', data).
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:643
function freeroam_bigMapPoiProvider.sendCurrentLevelMissionsToBigmap() end

--- Remet le drapeau interne sendToMinimap à false ; n'envoie en réalité rien (corps réduit à ce drapeau).
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:153
function freeroam_bigMapPoiProvider.sendMissionLocationsToMinimap() end

--- Définit la visibilité d'un groupe ; l'effet n'apparaît qu'après un nouvel envoi à la grande carte.
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:58
---@param groupKey string Clé du groupe.
---@param isVisible boolean true pour afficher.
function freeroam_bigMapPoiProvider.setGroupVisibility(groupKey, isVisible) end

--- Inverse la visibilité d'un groupe (la mise à jour de la grande carte est commentée dans le code).
---Source : lua/ge/extensions/freeroam/bigMapPoiProvider.lua:68
---@param groupKey string Clé du groupe.
function freeroam_bigMapPoiProvider.toggleGroupVisibility(groupKey) end

