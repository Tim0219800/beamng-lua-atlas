---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/versionUpdate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détecte au démarrage si le jeu vient d'être mis à jour vers une nouvelle version majeure (comparaison des deux premiers nombres de beamng_version avec le réglage lastVersion). Dans ce cas il lance FS:folderCleanup pour sauvegarder les dossiers utilisateur de l'ancienne version, puis enregistre la version courante dans les réglages. Un moddeur s'en sert rarement ; updatedFromVersion() indique de quelle version on vient.
--- Accès : extension `core_versionUpdate` : `extensions.load("core_versionUpdate")`, puis la globale `core_versionUpdate`
---@class core_versionUpdate
---@field lastVersion string|nil Version précédente du jeu si une mise à jour majeure a été détectée à ce lancement, sinon nil.
core_versionUpdate = {}

--- Hook appelé au chargement : compare version courante et dernière version enregistrée, lance éventuellement la sauvegarde/nettoyage des dossiers et mémorise lastVersion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/versionUpdate.lua:12
function core_versionUpdate.onExtensionLoaded() end

--- Hook appelé à chaque image, mais seulement jusqu'à la 2e fois : enregistre la version courante dans les réglages puis se supprime lui-même.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/versionUpdate.lua:41
function core_versionUpdate.onUpdate() end

--- Renvoie la version dont on vient de migrer.
---Source : lua/ge/extensions/core/versionUpdate.lua:51
---@return string|nil  Ancienne version, nil s'il n'y a pas eu de mise à jour majeure à ce lancement.
function core_versionUpdate.updatedFromVersion() end

