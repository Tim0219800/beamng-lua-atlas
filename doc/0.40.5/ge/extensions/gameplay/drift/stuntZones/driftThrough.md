# `gameplay_drift_stuntZones_driftThrough`

*Fichier : `lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua` · VM : Game Engine (GE) · 95 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/drift/stuntZones/driftThrough")` (fichier sous extensions/ mais pas une extension classique)

Type de zone de cascade « driftThrough » (passage serré) : le joueur doit traverser en drift une boîte orientée (OBB, centre pos, demi-axes dérivés de rot et scl) et en ressortir. Le module renvoie un constructeur appelé par gameplay_drift_stuntZones.setStuntZones ; ce n'est pas une extension. En cas de réussite, émet onAnyStuntZoneAccomplished avec le sous-hook onDriftThroughAccomplished (angle de drift et points de base driftThrough).

## Remarques

- La zone est validée à la sortie de la boîte : tant que le joueur est dedans il n'y a rien ; au premier relevé « dehors » usedFlag passe à vrai, puis detectStunt appelle accomplish. Détails : isPlayerInside n'est appelé que quand le joueur drifte, donc la sortie n'est détectée que s'il drifte encore.
- Si aucun driftActiveData n'existe (test imgui), l'angle envoyé vaut 30°.
- Cooldown de zoneData.cooldown secondes après réussite. Dessin : deux lignes qui se colorent (vert prêt, blanc/rouge pendant le cooldown).

## Classe `C`

Zone driftThrough. Champs : data = {id, zoneData = {pos, scl (vec3), rot (quat), cooldown}, x, y, z (demi-axes), drawData = {pointA..D}}, activeData = {isActive, currCooldown, usedFlag}.

Le module renvoie un constructeur : `local obj = require("gameplay_drift_stuntZones_driftThrough")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:accomplish()` | Réussite : remet usedFlag à false, démarre le cooldown et émet onAnyStuntZoneAccomplished (sous-hook onDriftThroughAccomplished avec currDegAngle et points). | 24 |
| `C:detectStunt()` | Appelé quand le joueur drifte dans la zone ; appelle accomplish si usedFlag est vrai. | 41 |
| `C:init(data)` | Constructeur interne : mémorise les données de la zone et appelle reset(). | 19 |
| `C:isAvailable()` | Indique si le cooldown est écoulé. | 47 |
| `C:isPlayerInside()` | Teste avec containsOBB_point si le véhicule est dans la boîte ; s'il n'y est pas, met usedFlag à true. | 51 |
| `C:onUpdate()` | Appelé à chaque frame par le gestionnaire : dessine les lignes. | 59 |
| `C:reset()` | Réinitialise activeData (cooldown 0, usedFlag false). | 11 |
| `C:sendDecals()` | Dessine les deux bords de la zone avec debugDrawer:drawLineInstance (si le tracé est activé). | 70 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAnyStuntZoneAccomplished` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua`.*
