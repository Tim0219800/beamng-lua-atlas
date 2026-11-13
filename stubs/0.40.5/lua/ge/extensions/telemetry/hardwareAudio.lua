---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareAudio.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module utilitaire de la télémétrie matérielle (chargé par require) : transforme les informations brutes du périphérique de sortie audio en un résumé anonymisé. Le nom du périphérique est classé par mots-clés (virtual, headphones, display, speakers, unknown) puis supprimé : seuls la catégorie, la fréquence d'échantillonnage, le mode haut-parleurs et le nombre de canaux sont conservés.
--- Accès : extension `telemetry_hardwareAudio` : `extensions.load("telemetry_hardwareAudio")`, puis la globale `telemetry_hardwareAudio`
---@class telemetry_hardwareAudio
telemetry_hardwareAudio = {}

--- Renvoie {category, sampleRateHz, speakerMode, channels} à partir des infos du périphérique audio ; le nom brut et les champs de diagnostic (provider, driverIndex, useHardware, maxBuffers, caps) ne sont jamais repris.
---Source : lua/ge/extensions/telemetry/hardwareAudio.lua:48
---@param info table|nil Infos du périphérique : name, sampleRateHz, speakerMode, channels…
---@return table|nil  Résumé anonymisé, ou nil si info est absent ou vide.
function telemetry_hardwareAudio.fromDeviceInfo(info) end

