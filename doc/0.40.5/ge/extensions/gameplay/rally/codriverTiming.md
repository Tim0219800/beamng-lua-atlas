# `gameplay_rally_codriverTiming`

*Fichier : `lua/ge/extensions/gameplay/rally/codriverTiming.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_codriverTiming` : `extensions.load("gameplay_rally_codriverTiming")`, puis la globale `gameplay_rally_codriverTiming`

Calcule le délai du copilote de rallye : l'écart (en secondes) entre la fin de l'annonce d'une note et l'arrivée de la voiture au virage. Le délai minimum vient du réglage utilisateur 'rallyCodriverTiming' (plus un décalage propre au pack vocal) ; il augmente avec la vitesse entre startSpeedMph et endSpeedMph jusqu'à un supplément maxDelayOffsetSeconds. Les valeurs par défaut sont lues dans /gameplay/rally/codriverTiming.json.

## Exemple

```lua
local d = gameplay_rally_codriverTiming.delayForSpeed(speedMph, true, 0)
```

## Remarques

- Les vitesses sont en mph (pas en m/s).
- Défauts si le JSON est absent : maxDelayOffsetSeconds=0.5, startSpeedMph=40, endSpeedMph=80.
- enableSpeedScaling == false (comparaison stricte) désactive la partie dépendante de la vitesse ; nil la laisse active.
- nudge borne le délai minimum entre 1 et 10 s et l'écrit dans les settings.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_codriverTiming.config()` | Renvoie la configuration chargée (et mise en cache) : maxDelayOffsetSeconds, startSpeedMph, endSpeedMph. | 28 |
| `gameplay_rally_codriverTiming.delayForSpeed(speedMph, enableSpeedScaling, offsetSeconds)` | Délai pour une vitesse donnée : minDelay en dessous de startSpeedMph, puis interpolation linéaire jusqu'à minDelay + maxDelayOffsetSeconds à endSpeedMph (plafonné). | 42 |
| `gameplay_rally_codriverTiming.maxDelay(enableSpeedScaling, offsetSeconds)` | Délai maximum en secondes (atteint à endSpeedMph) : minDelay + maxDelayOffsetSeconds, ou minDelay si la mise à l'échelle par la vitesse est désactivée. | 36 |
| `gameplay_rally_codriverTiming.minDelay(offsetSeconds)` | Délai minimum en secondes : réglage rallyCodriverTiming + décalage du pack vocal. | 32 |
| `gameplay_rally_codriverTiming.nudge(tick)` | Décale la plage de délais de 'tick' secondes : seul le minimum (réglage rallyCodriverTiming, borné à [1, 10]) bouge, le maximum suit via le décalage. Enregistre le nouveau réglage. | 54 |

### Détail des paramètres

#### `gameplay_rally_codriverTiming.config()`

Renvoie la configuration chargée (et mise en cache) : maxDelayOffsetSeconds, startSpeedMph, endSpeedMph.

- **renvoie** : table {maxDelayOffsetSeconds, startSpeedMph, endSpeedMph}.

#### `gameplay_rally_codriverTiming.delayForSpeed(speedMph, enableSpeedScaling, offsetSeconds)`

Délai pour une vitesse donnée : minDelay en dessous de startSpeedMph, puis interpolation linéaire jusqu'à minDelay + maxDelayOffsetSeconds à endSpeedMph (plafonné).

- `speedMph` (*number*) : Vitesse du véhicule en mph.
- `enableSpeedScaling` (*boolean|nil*) : false pour toujours renvoyer le minimum.
- `offsetSeconds` (*number|nil*) : Décalage du pack vocal.
- **renvoie** : number Délai en secondes.

#### `gameplay_rally_codriverTiming.maxDelay(enableSpeedScaling, offsetSeconds)`

Délai maximum en secondes (atteint à endSpeedMph) : minDelay + maxDelayOffsetSeconds, ou minDelay si la mise à l'échelle par la vitesse est désactivée.

- `enableSpeedScaling` (*boolean|nil*) : false pour désactiver la partie liée à la vitesse.
- `offsetSeconds` (*number|nil*) : Décalage du pack vocal.
- **renvoie** : number Délai maximum en secondes.

#### `gameplay_rally_codriverTiming.minDelay(offsetSeconds)`

Délai minimum en secondes : réglage rallyCodriverTiming + décalage du pack vocal.

- `offsetSeconds` (*number|nil*) : Décalage du pack vocal (0 si nil).
- **renvoie** : number Délai minimum en secondes.

#### `gameplay_rally_codriverTiming.nudge(tick)`

Décale la plage de délais de 'tick' secondes : seul le minimum (réglage rallyCodriverTiming, borné à [1, 10]) bouge, le maximum suit via le décalage. Enregistre le nouveau réglage.

- `tick` (*number*) : Variation en secondes (positive ou négative).
- **renvoie** : number Nouveau délai minimum.
- **renvoie** : number Nouveau délai maximum (min + maxDelayOffsetSeconds).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/codriverTiming.lua`.*
