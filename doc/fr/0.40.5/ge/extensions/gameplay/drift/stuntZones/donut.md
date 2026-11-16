# `gameplay_drift_stuntZones_donut`

*Fichier : `lua/ge/extensions/gameplay/drift/stuntZones/donut.lua` · VM : Game Engine (GE) · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/drift/stuntZones/donut")` (fichier sous extensions/ mais pas une extension classique)

Type de zone de cascade « donut » : le joueur doit faire un tour complet (360° cumulés d'angle de direction de vitesse) en drift à l'intérieur d'un cercle de rayon scl autour de pos. Le module renvoie un constructeur appelé par gameplay_drift_stuntZones.setStuntZones ; ce n'est pas une extension. En cas de réussite, émet onAnyStuntZoneAccomplished avec le sous-hook onDonutDriftAccomplished (points de base donut).

## Remarques

- Sortir du cercle remet le compteur d'angle à 0 (isPlayerInside).
- Après réussite, la zone est indisponible pendant zoneData.cooldown secondes ; le cercle est dessiné avec des segments colorés (bleu = tour effectué, rouge/blanc = cooldown).
- Le nombre de segments du cercle est drawData.decalCount = scl * 10.

## Classe `C`

Zone donut. Champs : data = {id, zoneData = {pos, scl (rayon), cooldown}, drawData}, activeData = {isActive, currCooldown, totalDriftAngle, completedPerc}.

Le module renvoie un constructeur : `local obj = require("gameplay_drift_stuntZones_donut")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:accomplish()` | Réussite : remet l'angle cumulé à 0, démarre le cooldown et émet onAnyStuntZoneAccomplished (sous-hook onDonutDriftAccomplished, points = base donut). | 25 |
| `C:detectStunt()` | Ajoute à l'angle cumulé la variation d'angle de drift de la frame (gameplay_drift_drift.getAngleDiff) ; à 360° ou plus, appelle accomplish. | 39 |
| `C:init(data)` | Constructeur interne : mémorise les données de la zone et appelle reset(). | 20 |
| `C:isAvailable()` | Indique si le cooldown est écoulé. | 49 |
| `C:isPlayerInside()` | Teste si le véhicule est à moins de scl de pos ; sinon remet l'angle cumulé à 0. | 53 |
| `C:onUpdate()` | Appelé à chaque frame par le gestionnaire : dessine le cercle. | 61 |
| `C:reset()` | Réinitialise activeData (cooldown à 0, angle cumulé à 0). | 11 |
| `C:sendDecals()` | Dessine le cercle avec debugDrawer:drawLineInstance, coloré selon l'avancement et le cooldown (si le tracé est activé). | 68 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAnyStuntZoneAccomplished` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/stuntZones/donut.lua`.*
