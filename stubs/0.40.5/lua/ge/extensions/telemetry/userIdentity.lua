---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/userIdentity.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère l'identifiant anonyme de l'utilisateur utilisé par la télémétrie. Un « sel » aléatoire est créé une fois et stocké dans `/telemetry/salt.txt` ; l'identifiant est le hash SHA-256 de ce fichier. Un ancien fichier `/gameTelemetries/.salt` est migré automatiquement pour conserver le même identifiant.
--- Accès : extension `telemetry_userIdentity` : `extensions.load("telemetry_userIdentity")`, puis la globale `telemetry_userIdentity`
---@class telemetry_userIdentity
telemetry_userIdentity = {}

--- Renvoie l'identifiant anonyme : le hash SHA-256 (`hashStringSHA256`) du sel. Crée ou migre le fichier de sel si nécessaire (dossier `telemetry` créé au besoin).
---Source : lua/ge/extensions/telemetry/userIdentity.lua:94
---@return string  Hash SHA-256 du contenu du fichier de sel.
function telemetry_userIdentity.getAnonymousUserID() end

--- Hook appelé au chargement de l'extension. Passe l'extension en déchargement manuel pour éviter son déchargement automatique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/userIdentity.lua:101
function telemetry_userIdentity.onExtensionLoaded() end

