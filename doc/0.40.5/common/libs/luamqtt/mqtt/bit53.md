# `libs_luamqtt_mqtt_bit53`

*Fichier : `lua/common/libs/luamqtt/mqtt/bit53.lua` · VM : Commun (GE + véhicule) · 19 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/bit53")`

Implémentation de secours de quelques fonctions de BitOp (lshift, rshift, bor, band) avec les opérateurs natifs de Lua 5.3 (<<, >>, |, &). Chargé par bitwrap uniquement si l'interpréteur n'est ni Lua 5.1/LuaJIT ni Lua 5.2. Dans BeamNG (LuaJIT) il n'est jamais chargé.

## Remarques

- Ne pas le charger sous LuaJIT : la syntaxe des opérateurs de bits de Lua 5.3 n'y est pas valide et provoquerait une erreur de compilation.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_bit53.band(x1, x2)` | ET bit à bit. | 13 |
| `libs_luamqtt_mqtt_bit53.bor(x1, x2)` | OU bit à bit. | 10 |
| `libs_luamqtt_mqtt_bit53.lshift(x, n)` | Décalage à gauche. | 4 |
| `libs_luamqtt_mqtt_bit53.rshift(x, n)` | Décalage à droite. | 7 |

### Détail des paramètres

#### `libs_luamqtt_mqtt_bit53.band(x1, x2)`

ET bit à bit.

- `x1` (*integer*) : Valeur.
- `x2` (*integer*) : Valeur.
- **renvoie** : integer x1 & x2.

#### `libs_luamqtt_mqtt_bit53.bor(x1, x2)`

OU bit à bit.

- `x1` (*integer*) : Valeur.
- `x2` (*integer*) : Valeur.
- **renvoie** : integer x1 | x2.

#### `libs_luamqtt_mqtt_bit53.lshift(x, n)`

Décalage à gauche.

- `x` (*integer*) : Valeur.
- `n` (*integer*) : Nombre de bits.
- **renvoie** : integer x << n.

#### `libs_luamqtt_mqtt_bit53.rshift(x, n)`

Décalage à droite.

- `x` (*integer*) : Valeur.
- `n` (*integer*) : Nombre de bits.
- **renvoie** : integer x >> n.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/bit53.lua`.*
