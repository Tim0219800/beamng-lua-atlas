---@meta
-- tim19Atlas stub generated from lua/ge/extensions/license.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Interroge l'état des licences BeamNG.tech (recherche) et commerciale via les objets C++ ResearchVerifier et CommercialVerifier, avec un cache par session. Sert à filtrer les fichiers d'input maps et d'actions réservés à BeamNG.tech (chemins contenant « _beamng.tech ») quand la licence n'est pas valide. Pour un moddeur, c'est surtout utile pour savoir si le jeu tourne en licence tech/commerciale.
--- Accès : extension `license` : `extensions.load("license")`, puis la globale `license`
---@class license
license = {}

--- Même règle pour les fichiers d'actions.
---Source : lua/ge/extensions/license.lua:40
---@param path string Chemin du fichier d'actions.
---@return boolean
function license.isAllowedActionsPath(path) end

--- Dit s'il est pertinent de charger cette input map : toujours vrai avec une licence tech valide, sinon faux si le chemin contient « _beamng.tech ».
---Source : lua/ge/extensions/license.lua:34
---@param path string Chemin du fichier d'input map.
---@return boolean
function license.isAllowedInputmapPath(path) end

--- Indique si la licence est commerciale (CommercialVerifier.isCommercialLicense).
---Source : lua/ge/extensions/license.lua:19
---@return boolean  false sans vérificateur ou sans licence.
function license.isCommercial() end

--- Indique si la licence BeamNG.tech est vérifiée (ResearchVerifier.isTechLicenseVerified).
---Source : lua/ge/extensions/license.lua:9
---@return boolean  false sans vérificateur ou sans licence.
function license.isValid() end

--- Envoie l'état de licence tech à l'interface via guihooks (TechLicenseState).
---Source : lua/ge/extensions/license.lua:29
function license.requestState() end

