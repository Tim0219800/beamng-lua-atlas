---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/poiTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de test du système de points d'intérêt (POI). Elle ajoute un POI factice « poiTest » sur chaque place de parking définie dans le fichier gameplay/parkingSpotTests.sites.json, et un bouton « Do the Test » dans la fenêtre de détail du POI qui affiche seulement « Test Successfull! » dans le log. Elle ne sert qu'aux développeurs du jeu pour tester gameplay_markerInteraction / rawPois ; un moddeur peut s'en inspirer comme exemple minimal de fournisseur de POI.
--- Accès : extension `gameplay_missions_poiTest` : `extensions.load("gameplay_missions_poiTest")`, puis la globale `gameplay_missions_poiTest`
---@class gameplay_missions_poiTest
gameplay_missions_poiTest = {}

--- Appelé au chargement de l'extension : vide le cache de gameplay_markerInteraction (clearCache) pour que les POI de test apparaissent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/poiTest.lua:50
function gameplay_missions_poiTest.onExtensionLoaded() end

--- Hook appelé par le système de POI (gameplay_rawPois) quand il reconstruit la liste des POI d'un niveau. Ajoute dans `elements` un POI de type « poiTest » par place de parking du fichier de test (champs id, pos, rot, scl, radius=3, visibleInPlayMode, interactableInPlayMode, clusterType, data).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/poiTest.lua:7
---@param levelIdentifier string Identifiant du niveau (non utilisé par cette fonction).
---@param elements table Liste de POI à compléter (table.insert).
function gameplay_missions_poiTest.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook appelé à l'ouverture de la fenêtre de détail d'un POI. Si un des éléments est de type « poiTest », ajoute dans `promptData` un bouton « Do the Test » dont l'action écrit « Test Successfull! » dans la console.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/poiTest.lua:31
---@param elemData table Liste des données (`data`) des POI sous le curseur / dans le cluster.
---@param promptData table Liste des boutons à compléter ({label, buttonText, buttonFun}).
function gameplay_missions_poiTest.onPoiDetailPromptOpening(elemData, promptData) end

