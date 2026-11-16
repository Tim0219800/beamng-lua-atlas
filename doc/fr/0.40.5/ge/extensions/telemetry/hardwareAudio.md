# `telemetry_hardwareAudio`

*Fichier : `lua/ge/extensions/telemetry/hardwareAudio.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_hardwareAudio` : `extensions.load("telemetry_hardwareAudio")`, puis la globale `telemetry_hardwareAudio`

Module utilitaire de la télémétrie matérielle (chargé par require) : transforme les informations brutes du périphérique de sortie audio en un résumé anonymisé. Le nom du périphérique est classé par mots-clés (virtual, headphones, display, speakers, unknown) puis supprimé : seuls la catégorie, la fréquence d'échantillonnage, le mode haut-parleurs et le nombre de canaux sont conservés.

## Remarques

- Les mots-clés sont cherchés en minuscules dans le nom : virtual (virtual, voicemeeter, cable input, sonar, streaming speakers, wave link) prioritaire, puis headphones (headphone, headset, earphone, earbud, airpods), puis display (mot 'tv', hdmi, displayport, monitor, audio NVIDIA/AMD/Intel d'écran), puis speakers (speaker, soundbar).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_hardwareAudio.fromDeviceInfo(info)` | Renvoie {category, sampleRateHz, speakerMode, channels} à partir des infos du périphérique audio ; le nom brut et les champs de diagnostic (provider, driverIndex, useHardware, maxBuffers, caps) ne sont jamais repris. | 48 |

### Détail des paramètres

#### `telemetry_hardwareAudio.fromDeviceInfo(info)`

Renvoie {category, sampleRateHz, speakerMode, channels} à partir des infos du périphérique audio ; le nom brut et les champs de diagnostic (provider, driverIndex, useHardware, maxBuffers, caps) ne sont jamais repris.

- `info` (*table|nil*) : Infos du périphérique : name, sampleRateHz, speakerMode, channels…
- **renvoie** : table|nil Résumé anonymisé, ou nil si info est absent ou vide.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/hardwareAudio.lua`.*
