# `telemetry_hardwareInput`

*Fichier : `lua/ge/extensions/telemetry/hardwareInput.lua` · VM : Game Engine (GE) · 92 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_hardwareInput` : `extensions.load("telemetry_hardwareInput")`, puis la globale `telemetry_hardwareInput`

Module utilitaire de la télémétrie matérielle (chargé par require) : transforme les informations des contrôleurs de jeu en données de télémétrie. Pour tous les périphériques : type, productName, vidpid, forceFeedback. Pour les volants (type 'wheel') s'ajoutent le nom anglais officiel, GUID, axes à retour de force, périodes d'échantillonnage FFB, révisions matérielle/firmware, contrôles et leur décompte par type.

## Remarques

- Le nom anglais d'un volant ne vient que d'une table officielle /settings/inputmaps/<vidpid en minuscules>.json (isOfficialContentVPath) : une table de mod ne peut pas fournir le nom.
- Un vidpid de 8 chiffres hexadécimaux est mis en majuscules (les deux premiers groupes de 4 donnent productId puis vendorId) ; un identifiant symbolique (ex. 'XIDevice') garde sa casse.
- maxRawFfbUpdateRateHz = 1000000 / ff_sample_period ; si la période n'est pas un nombre positif, ffbSamplePeriodMicroseconds et le taux restent absents.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_hardwareInput.collect(controllerInfo)` | Applique fromControllerInfo à chaque contrôleur (en cherchant le nom anglais officiel des volants). | 77 |
| `telemetry_hardwareInput.fromControllerInfo(info, englishName)` | Convertit les infos d'un contrôleur en table de télémétrie. Les non-volants ne gardent que type, productName, vidpid et forceFeedback ; les volants reçoivent en plus reportedName, deviceName, guid, hidSupported, ffbAxes, périodes FFB, révisions, controls, controlCounts, productId, vendorId et maxRawFfbUpdateRateHz. | 38 |
| `telemetry_hardwareInput.officialEnglishName(pidVid)` | Lit /settings/inputmaps/<pidVid>.json et renvoie displayName ou name, uniquement si ce fichier appartient au contenu officiel du jeu. | 12 |

### Détail des paramètres

#### `telemetry_hardwareInput.collect(controllerInfo)`

Applique fromControllerInfo à chaque contrôleur (en cherchant le nom anglais officiel des volants).

- `controllerInfo` (*table[]|nil*) : Liste des contrôleurs.
- **renvoie** : table[] Liste de tables de télémétrie.

#### `telemetry_hardwareInput.fromControllerInfo(info, englishName)`

Convertit les infos d'un contrôleur en table de télémétrie. Les non-volants ne gardent que type, productName, vidpid et forceFeedback ; les volants reçoivent en plus reportedName, deviceName, guid, hidSupported, ffbAxes, périodes FFB, révisions, controls, controlCounts, productId, vendorId et maxRawFfbUpdateRateHz.

- `info` (*table*) : Infos du contrôleur (type, name, productName, vidpid, guid, ffbAxes, ff_sample_period, controls…).
- `englishName` (*string|nil*) : Nom anglais officiel du volant, s'il est connu.
- **renvoie** : table Données de télémétrie du contrôleur.

#### `telemetry_hardwareInput.officialEnglishName(pidVid)`

Lit /settings/inputmaps/<pidVid>.json et renvoie displayName ou name, uniquement si ce fichier appartient au contenu officiel du jeu.

- `pidVid` (*string|nil*) : Identifiant de 8 chiffres hexadécimaux.
- **renvoie** : string|nil Nom anglais officiel, ou nil.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/hardwareInput.lua`.*
