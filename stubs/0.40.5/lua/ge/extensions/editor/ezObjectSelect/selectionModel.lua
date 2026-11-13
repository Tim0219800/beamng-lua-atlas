---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Modèle de sélection de l'outil « Easy Object Select » de l'éditeur. À chaque frame il interroge selectionQuery.gather, regroupe les candidats sous le curseur en pile (empilement d'objets), choisit automatiquement le gagnant (avec hystérésis pour éviter le clignotement), et gère le cycle manuel à la molette ainsi que le « gel » du pick. Il produit un snapshot (camera, mouse, candidates, pick, activeIndex, cycleActive, stackCount…) lu par les modules de dessin et d'interaction.
--- Accès : extension `editor_ezObjectSelect_selectionModel` : `extensions.load("editor_ezObjectSelect_selectionModel")`, puis la globale `editor_ezObjectSelect_selectionModel`
---@class editor_ezObjectSelect_selectionModel
editor_ezObjectSelect_selectionModel = {}

--- Réinitialise l'état temporel (cible automatique, cycle, pick gelé, snapshot) et active le cache de selectionQuery. À appeler à l'ouverture de l'outil.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:204
function editor_ezObjectSelect_selectionModel.activate() end

--- Fait avancer le pick actif dans la pile de candidats suivant le sens de la molette. Sans effet s'il y a moins de 2 candidats ou si wheelDelta vaut 0. Mémorise l'ancre souris et la caméra pour détecter plus tard un mouvement.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:311
---@param wheelDelta number Delta de molette ; > 0 recule dans la pile, < 0 avance.
---@return table|nil  Le snapshot courant (modifié en place), ou nil s'il n'y en a pas.
function editor_ezObjectSelect_selectionModel.cycle(wheelDelta) end

--- Réinitialise l'état temporel (cible, cycle, pick gelé, snapshot) à la fermeture de l'outil.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:209
function editor_ezObjectSelect_selectionModel.deactivate() end

--- Fige le pick actuel : tant qu'il est gelé, il reste la cible même si le curseur bouge (utile pendant un glisser).
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:332
---@return table|nil  Le candidat gelé, ou nil s'il n'y a pas de pick.
function editor_ezObjectSelect_selectionModel.freezePick() end

--- Renvoie le dernier snapshot calculé par update.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:346
---@return table|nil  Snapshot courant.
function editor_ezObjectSelect_selectionModel.getSnapshot() end

--- Invalide le cache de sélection de selectionQuery (le cache sera reconstruit à la prochaine requête).
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:350
---@param reason string|nil Raison de l'invalidation (diagnostic).
function editor_ezObjectSelect_selectionModel.invalidateCache(reason) end

--- Libère le pick gelé par freezePick.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:340
function editor_ezObjectSelect_selectionModel.releasePick() end

--- Calcule le snapshot de la frame : appelle selectionQuery.gather(options), groupe et trie les candidats, applique la limite de pile, gère la réinitialisation du cycle, le pick gelé et le gagnant automatique. Renvoie un snapshot vide si la requête échoue (pas de caméra).
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:213
---@param options table|nil Options transmises à gather (discoveryPixels, nearQueryDistance, maxDistance, maxVolume, namePattern, ignorePattern, collectFilteredLarge) plus preferUnselected (boolean : favoriser les objets non sélectionnés), maxStackDistance (number, m) et cycleDeadZone (number, px).
---@return table  Snapshot : camera, mouse, queryRadius, discoveryRadius, nearQueryDistance, candidates, discovery, filteredLarge, queryStats, rejected, sourceCount, stackCount, stackLimited, activeIndex, pick, cycleActive, cycleAnchor, cycleDeadZone, frozenTargetId.
function editor_ezObjectSelect_selectionModel.update(options) end

