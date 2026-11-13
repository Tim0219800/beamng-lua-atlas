---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Requête de sélection de l'outil Easy Object Select. À partir de la position de la souris et de la caméra, il collecte les objets de la scène (StaticShape, StaticObject, véhicules) sous ou près du curseur, les résout vers leur prefab propriétaire, applique les filtres (classe, caché, verrouillé, bornes, motifs de nom, volume et distance max) et construit des « proxies » (géométrie écran) classés en relation « over » (curseur dessus) ou « discovery » (dans le rayon de découverte). Utilise le cache de selectionCache quand il est disponible, sinon un mode « broad » (rectangle écran + boîte autour de la caméra).
--- Accès : extension `editor_ezObjectSelect_selectionQuery` : `extensions.load("editor_ezObjectSelect_selectionQuery")`, puis la globale `editor_ezObjectSelect_selectionQuery`
---@class editor_ezObjectSelect_selectionQuery
editor_ezObjectSelect_selectionQuery = {}

--- Active le cache de sélection (selectionCache.activate). Appelé à l'ouverture de l'outil.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua:606
function editor_ezObjectSelect_selectionQuery.activate() end

--- Collecte les candidats de sélection pour la frame courante. Renvoie nil si le contexte caméra est indisponible. Remplit proxies (relation over), discoveryProxies (relation discovery), filteredLarge (gros objets filtrés si options.collectFilteredLarge), queryStats, rejected et sourceCount.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua:396
---@param options table|nil discoveryPixels (px, défaut 48), nearQueryDistance (m, défaut 40), maxDistance (m), maxVolume (m^3), namePattern, ignorePattern (listes de motifs Lua séparés par des virgules), collectFilteredLarge (boolean).
---@return table|nil  Table {camera, mouse, queryRadius, discoveryRadius, nearQueryDistance, proxies, discoveryProxies, filteredLarge, queryStats, rejected, sourceCount}.
function editor_ezObjectSelect_selectionQuery.gather(options) end

--- Renvoie l'état du cache de sélection (selectionCache.getStatus), utile pour l'affichage de debug.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua:614
---@return table  État du cache.
function editor_ezObjectSelect_selectionQuery.getCacheStatus() end

--- Invalide le cache de sélection.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua:610
---@param reason string|nil Raison de l'invalidation (diagnostic).
function editor_ezObjectSelect_selectionQuery.invalidateCache(reason) end

--- Vérifie qu'une liste de motifs Lua séparés par des virgules est valide (chaque entrée est testée avec pcall(string.find)).
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua:618
---@param value string|nil Liste de motifs, séparés par des virgules.
---@return boolean  true si tous les motifs sont valides.
---@return string|nil  Message d'erreur « entry N: … » si invalide.
function editor_ezObjectSelect_selectionQuery.validatePatternList(value) end

