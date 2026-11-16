# `core_cameraModes_droneChase`

*Fichier : `lua/ge/extensions/core/cameraModes/droneChase.lua` · VM : Game Engine (GE) · 302 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/droneChase")` (fichier sous extensions/ mais pas une extension classique)

Caméra drone de poursuite aérienne (désactivée par défaut, icône cameraFocusOnVehicle1) : flotte au-dessus et derrière le véhicule du joueur selon son cap (smoothé), le regarde et penche dans les virages. Un ressort-amortisseur sous-amorti (survitesse visible, montée plus lente) la déplace ; elle suit le relief (consciente des tunnels/ponts) et garde safeDist mètres des bâtiments. Tout tourne sur dtSim (cohérent en avance rapide/ralenti). Les entrées de déplacement décalent la position souhaitée (positionOffset), les entrées de rotation la font orbiter. Renvoie un constructeur.

## Remarques

- data.res.collisionCompatible = false : le filtre de collision de caméra ne s'applique pas à ce mode.
- Paramètres réglables (listParams) : dist 12 m (4 à 80), height 6 m (1-40), bank (0-2), float (0.2-3, inertie), safeDist (0-5 m), fov (10-140, 55 par défaut). Pas de véhicule joueur : la caméra garde la pose précédente.
- Garde-fous : altitude minimale 2 m au-dessus du sol et 0.8 m sous un plafond (tunnel).
- L'extraction signale une globale « i » : en réalité c'est la boucle `for i = 0, 5` de la table de sondes (variable locale) ; pas de vraie fuite.

## Classe `C`

Mode drone. Champs : camDist, height, fov, bank, floating, safeDist, positionOffset, orbitYaw, orbitPitch, pos, vel, head.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_droneChase")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:avoid(x, y, z, car)` | Garde la distance de sécurité par rapport aux maillages statiques : reste du côté du véhicule d'un mur éventuel, et repousse hors de tout obstacle à moins de safeDist (6 sondes horizontales). | 158 |
| `C:clampAltitude(x, y, z, car)` | Corrige l'altitude pour suivre le véhicule : sous couvert reste entre sol+2 m et plafond-0.8 m ; à ciel ouvert monte pour survoler les collines. | 96 |
| `C:deserialize(s)` | Restaure l'état sauvegardé et force le replacement. | 141 |
| `C:init()` | Définit les valeurs par défaut et appelle reset. | 57 |
| `C:listParams()` | Liste des réglages exposés à l'UI de contrôle caméra / flux vidéo (dist, height, bank, float, safeDist, fov). | 114 |
| `C:onCameraChanged(focused)` | Hook : au gain de focus, le drone est replacé. | 86 |
| `C:placeInit(position)` | Place le drone instantanément à une position et annule sa vitesse. | 88 |
| `C:reset()` | Remet le drone à replacer, annule vitesse, décalage et orbite. | 73 |
| `C:serialize()` | Sauvegarde l'état du mode (distance, fov, hauteur, bank, float, safeDist, positionOffset, orbite). | 134 |
| `C:setDistance(d)` | Fixe la distance de suivi bornée à [4, 80] m. | 84 |
| `C:setFOV(fov)` | Fixe le champ de vision. | 85 |
| `C:setParam(key, value)` | Modifie un réglage listParams (valeurs bornées). | 125 |
| `C:update(data)` | Calcule la pose du drone et l'écrit dans data.res (pos, rot, fov, targetPos). | 183 |

**Globales affectées :** `i`

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/droneChase.lua`.*
