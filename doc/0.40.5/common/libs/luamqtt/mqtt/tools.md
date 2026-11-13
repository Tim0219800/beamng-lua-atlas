# `libs_luamqtt_mqtt_tools`

*Fichier : `lua/common/libs/luamqtt/mqtt/tools.lua` · VM : Commun (GE + véhicule) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/tools")`

Deux petits utilitaires de luamqtt : conversion d'une chaîne en hexadécimal et division entière. Utilisés par protocol.lua et pour le débogage.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_tools.div(x, y)` | Division entière : math.floor(x / y). | 28 |
| `libs_luamqtt_mqtt_tools.hex(str)` | Encode chaque octet de la chaîne en deux chiffres hexadécimaux majuscules. | 19 |

### Détail des paramètres

#### `libs_luamqtt_mqtt_tools.div(x, y)`

Division entière : math.floor(x / y).

- `x` (*number*) : Dividende.
- `y` (*number*) : Diviseur.
- **renvoie** : integer Quotient arrondi à l'inférieur.

#### `libs_luamqtt_mqtt_tools.hex(str)`

Encode chaque octet de la chaîne en deux chiffres hexadécimaux majuscules.

- `str` (*string*) : Chaîne source.
- **renvoie** : string Chaîne hexadécimale.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/tools.lua`.*
