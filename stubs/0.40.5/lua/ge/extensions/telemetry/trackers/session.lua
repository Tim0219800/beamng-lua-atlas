---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/session.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie de session : marque le début et la fin de la session. Il se charge en premier et se décharge en dernier, donc encadre tous les autres évènements. Un rechargement Lua du moteur de jeu poursuit la session en cours. Au début : évènement « session » (type start) avec faits sur le client, langues, version de télémétrie, licence tech, fuseau horaire, identifiant anonyme, mode Big Picture, alimentation et VR. À la fin : « session » (type end) avec la durée.
--- Accès : extension `telemetry_trackers_session` : `extensions.load("telemetry_trackers_session")`, puis la globale `telemetry_trackers_session`
---@class telemetry_trackers_session
---@field dependencies string[] telemetry_core.
telemetry_trackers_session = {}

--- Hook appelé au chargement : émet l'évènement de début de session (sauf session poursuivie), tente d'émettre le login et passe en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/session.lua:59
---@param previousState table|nil État renvoyé par onSerialize ({loginLogged}) lors d'un rechargement.
function telemetry_trackers_session.onExtensionLoaded(previousState) end

--- Hook appelé au déchargement : émet l'évènement de fin de session avec la durée (hors rechargement Lua).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/session.lua:95
function telemetry_trackers_session.onExtensionUnloaded() end

--- Hook appelé quand l'état de connexion en ligne change : une fois la connexion revenue (premier moment où l'horloge serveur est connue), émet l'évènement login.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/session.lua:115
---@param connected boolean true si connecté.
function telemetry_trackers_session.onOnlineStateChanged(connected) end

--- Hook appelé avant déchargement : retient si c'est un rechargement Lua et renvoie {loginLogged}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/session.lua:108
---@param reason string Raison (« reload » pour un rechargement).
---@return table  {loginLogged}
function telemetry_trackers_session.onSerialize(reason) end

