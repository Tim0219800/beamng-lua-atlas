---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module utilitaire de la télémétrie matérielle (chargé par require) : transforme les informations des contrôleurs de jeu en données de télémétrie. Pour tous les périphériques : type, productName, vidpid, forceFeedback. Pour les volants (type 'wheel') s'ajoutent le nom anglais officiel, GUID, axes à retour de force, périodes d'échantillonnage FFB, révisions matérielle/firmware, contrôles et leur décompte par type.
--- Accès : extension `telemetry_hardwareInput` : `extensions.load("telemetry_hardwareInput")`, puis la globale `telemetry_hardwareInput`
---@class telemetry_hardwareInput
telemetry_hardwareInput = {}

--- Applique fromControllerInfo à chaque contrôleur (en cherchant le nom anglais officiel des volants).
---Source : lua/ge/extensions/telemetry/hardwareInput.lua:77
---@param controllerInfo table[]|nil Liste des contrôleurs.
---@return table[]  Liste de tables de télémétrie.
function telemetry_hardwareInput.collect(controllerInfo) end

--- Convertit les infos d'un contrôleur en table de télémétrie. Les non-volants ne gardent que type, productName, vidpid et forceFeedback ; les volants reçoivent en plus reportedName, deviceName, guid, hidSupported, ffbAxes, périodes FFB, révisions, controls, controlCounts, productId, vendorId et maxRawFfbUpdateRateHz.
---Source : lua/ge/extensions/telemetry/hardwareInput.lua:38
---@param info table Infos du contrôleur (type, name, productName, vidpid, guid, ffbAxes, ff_sample_period, controls…).
---@param englishName string|nil Nom anglais officiel du volant, s'il est connu.
---@return table  Données de télémétrie du contrôleur.
function telemetry_hardwareInput.fromControllerInfo(info, englishName) end

--- Lit /settings/inputmaps/<pidVid>.json et renvoie displayName ou name, uniquement si ce fichier appartient au contenu officiel du jeu.
---Source : lua/ge/extensions/telemetry/hardwareInput.lua:12
---@param pidVid string|nil Identifiant de 8 chiffres hexadécimaux.
---@return string|nil  Nom anglais officiel, ou nil.
function telemetry_hardwareInput.officialEnglishName(pidVid) end

