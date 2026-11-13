---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/audio.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Réglages audio : choix du fournisseur/périphérique de sortie, volumes par canal (maître, moteur, suspension, musique, UI…) et mode casque stéréo. Fournit les « option helpers » (get/set) utilisés par core_settings_settings, et une fonction de remise aux valeurs par défaut.
--- Accès : extension `core_settings_audio` : `extensions.load("core_settings_audio")`, puis la globale `core_settings_audio`
---@class core_settings_audio
core_settings_audio = {}

--- Crée et renvoie (et mémorise) la table d'options. Clés : AudioProvider (get/set/getModes ; set crée le périphérique audio), AudioMasterVol, AudioPowerVol, AudioForcedInductionVol, AudioTransmissionVol, AudioSuspensionVol, AudioSurfaceVol, AudioCollisionVol, AudioAeroVol, AudioEnvironmentVol, AudioMusicVol, AudioUiVol, AudioOtherVol, AudioLfeVol, AudioIntercomVol (get lit $pref::SFX::AudioChannelXxx), AudioEnableStereoHeadphones (au changement : écrit $pref::SFX::enableHeadphonesMode, appelle core_audio.triggerBankHotloading() et ré-applique les volumes).
---Source : lua/ge/extensions/core/settings/audio.lua:48
---@return table<string, table>  Helpers avec get/set (et getModes pour AudioProvider).
function core_settings_audio.buildOptionHelpers() end

--- Renvoie la table d'options mémorisée par buildOptionHelpers.
---Source : lua/ge/extensions/core/settings/audio.lua:329
---@return table|nil  nil tant que buildOptionHelpers n'a pas été appelé.
function core_settings_audio.getOptions() end

--- Hook appelé à la première mise à jour des réglages : crée le périphérique audio du fournisseur choisi ($pref::SFX::providerName), avec repli sur le premier fournisseur non Null si le nom est invalide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/audio.lua:283
---@param data any Non utilisé.
function core_settings_audio.onFirstUpdateSettings(data) end

--- Remet tous les volumes à leurs valeurs par défaut : maître 1.0, LFE 0.5, tous les autres 0.8. Puis settings.refreshTSState(true), settings.notifyUI() et settings.requestSave(). Nécessite buildOptionHelpers déjà appelé.
---Source : lua/ge/extensions/core/settings/audio.lua:262
function core_settings_audio.restoreDefaults() end

--- Change le périphérique de sortie FMOD : prend le périphérique d'indice donné dans la liste FMOD de Engine.Audio.getInfo() et crée le périphérique audio correspondant.
---Source : lua/ge/extensions/core/settings/audio.lua:317
---@param index integer Indice dans la liste des périphériques FMOD.
function core_settings_audio.switchOutputDevice(index) end

