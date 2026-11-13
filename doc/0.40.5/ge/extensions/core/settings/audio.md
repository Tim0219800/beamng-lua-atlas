# `core_settings_audio`

*Fichier : `lua/ge/extensions/core/settings/audio.lua` · VM : Game Engine (GE) · 335 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_settings_audio` : `extensions.load("core_settings_audio")`, puis la globale `core_settings_audio`

Réglages audio : choix du fournisseur/périphérique de sortie, volumes par canal (maître, moteur, suspension, musique, UI…) et mode casque stéréo. Fournit les « option helpers » (get/set) utilisés par core_settings_settings, et une fonction de remise aux valeurs par défaut.

## Remarques

- Les set de volume bornent la valeur entre 0 et 1 puis appellent Engine.Audio.setChannelVolume('AudioChannelXxx', valeur).
- BUG probable : dans createAudioDevice, le message d'erreur utilise audioProviderName qui n'est pas défini dans cette fonction (variable globale nil) : la concaténation lèverait une erreur si la création du périphérique échoue.
- AudioEnableStereoHeadphones.set référence AudioInterfaceVol et AudioAmbienceVol qui n'existent pas dans les helpers (ignorés par le test if).
- switchOutputDevice dump les fournisseurs dans le log et n'agit que sur le fournisseur 'FMOD'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_settings_audio.buildOptionHelpers()` | Crée et renvoie (et mémorise) la table d'options. Clés : AudioProvider (get/set/getModes ; set crée le périphérique audio), AudioMasterVol, AudioPowerVol, AudioForcedInductionVol, AudioTransmissionVol, AudioSuspensionVol, AudioSurfaceVol, AudioCollisionVol, AudioAeroVol, AudioEnvironmentVol, AudioMusicVol, AudioUiVol, AudioOtherVol, AudioLfeVol, AudioIntercomVol (get lit $pref::SFX::AudioChannelXxx), AudioEnableStereoHeadphones (au changement : écrit $pref::SFX::enableHeadphonesMode, appelle core_audio.triggerBankHotloading() et ré-applique les volumes). | 48 |
| `core_settings_audio.getOptions()` | Renvoie la table d'options mémorisée par buildOptionHelpers. | 329 |
| `core_settings_audio.onFirstUpdateSettings(data)` | Hook appelé à la première mise à jour des réglages : crée le périphérique audio du fournisseur choisi ($pref::SFX::providerName), avec repli sur le premier fournisseur non Null si le nom est invalide. *(interne)* *(hook)* | 283 |
| `core_settings_audio.restoreDefaults()` | Remet tous les volumes à leurs valeurs par défaut : maître 1.0, LFE 0.5, tous les autres 0.8. Puis settings.refreshTSState(true), settings.notifyUI() et settings.requestSave(). Nécessite buildOptionHelpers déjà appelé. | 262 |
| `core_settings_audio.switchOutputDevice(index)` | Change le périphérique de sortie FMOD : prend le périphérique d'indice donné dans la liste FMOD de Engine.Audio.getInfo() et crée le périphérique audio correspondant. | 317 |

### Détail des paramètres

#### `core_settings_audio.buildOptionHelpers()`

Crée et renvoie (et mémorise) la table d'options. Clés : AudioProvider (get/set/getModes ; set crée le périphérique audio), AudioMasterVol, AudioPowerVol, AudioForcedInductionVol, AudioTransmissionVol, AudioSuspensionVol, AudioSurfaceVol, AudioCollisionVol, AudioAeroVol, AudioEnvironmentVol, AudioMusicVol, AudioUiVol, AudioOtherVol, AudioLfeVol, AudioIntercomVol (get lit $pref::SFX::AudioChannelXxx), AudioEnableStereoHeadphones (au changement : écrit $pref::SFX::enableHeadphonesMode, appelle core_audio.triggerBankHotloading() et ré-applique les volumes).

- **renvoie** : table<string, table> Helpers avec get/set (et getModes pour AudioProvider).

#### `core_settings_audio.getOptions()`

Renvoie la table d'options mémorisée par buildOptionHelpers.

- **renvoie** : table|nil nil tant que buildOptionHelpers n'a pas été appelé.

#### `core_settings_audio.onFirstUpdateSettings(data)`

Hook appelé à la première mise à jour des réglages : crée le périphérique audio du fournisseur choisi ($pref::SFX::providerName), avec repli sur le premier fournisseur non Null si le nom est invalide.

- `data` (*any*) : Non utilisé.

#### `core_settings_audio.switchOutputDevice(index)`

Change le périphérique de sortie FMOD : prend le périphérique d'indice donné dans la liste FMOD de Engine.Audio.getInfo() et crée le périphérique audio correspondant.

- `index` (*integer*) : Indice dans la liste des périphériques FMOD.

## Appels vers le moteur (C++)

- `be:` `sfxGetAvailableDevices`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/audio.lua`.*
