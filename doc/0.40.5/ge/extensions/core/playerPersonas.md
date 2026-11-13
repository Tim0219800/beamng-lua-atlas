# `core_playerPersonas`

*Fichier : `lua/ge/extensions/core/playerPersonas.lua` · VM : Game Engine (GE) · 244 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_playerPersonas` : `extensions.load("core_playerPersonas")`, puis la globale `core_playerPersonas`

Extension GE `core_playerPersonas` : identité visuelle des joueurs locaux en multi-joueur (multiseat). Une 'persona' regroupe un nom affiché, une icône, une couleur et éventuellement un véhicule favori, numérotées à partir de 1 (joueur 0 = persona 1). Les valeurs par défaut sont générées : nom traduit 'ui.multiseat.playerTag', icône tirée d'un pool (décalage aléatoire par session), couleur d'une palette de 8 teintes (calculées en OKLCH). Un moddeur s'en sert pour récupérer le nom, la couleur et l'icône d'un joueur local.

## Exemple

```lua
local n = core_playerPersonas.getNumberForPlayer(0) -- 1
local p = core_playerPersonas.get(n)
log('I','', p.displayName .. ' ' .. p.colorHex .. ' ' .. p.icon)
```

## Remarques

- get(numéro) renvoie une table construite à la volée : { id ('local-persona:N' par défaut), number, displayName, icon, color = {r,g,b} (0..1), colorHex ('#rrggbb'), vehicleFallbackPaint (peinture de /vehicles/common/paintLibraries/common.paintLibrary.json la plus proche de la couleur, par distance RGB au carré), vehicle }. Modifier la table renvoyée ne change pas la persona stockée.
- set(numéro, data) mémorise id, displayName, icon, color, vehicle ; un displayName égal au nom par défaut n'est pas stocké (pour suivre les changements de langue). Chaque modification incrémente la révision (getRevision), ce qui permet aux interfaces de détecter un changement.
- Couleur 'solo' : applySoloColor remplace la couleur d'une persona par un gris (0.37, 0.37, 0.39) et recalcule colorHex et vehicleFallbackPaint ; utile quand il n'y a qu'un joueur.
- Icônes autorisées (pool de 19) : explosion, hingeBroken, drag01, trafficCone, engine, mirrorInteriorMiddle, doorFrontDetached, vehicleTrunk, carCrash, barrelKnocker01, bollard, drift01, hazardLights, N2OHoriz, rangeboxHi, rallyHelmet, road, tire3Fourth, tireDeflated. Les icônes par défaut avancent d'un cran par numéro de persona, donc sans doublon tant qu'il y a moins de 19 joueurs.
- Le module est un simple module de fonctions (pas de hooks).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_playerPersonas.applySoloColor(persona)` | Remplace en place la couleur d'une persona par le gris 'solo' et recalcule colorHex et vehicleFallbackPaint. | 140 |
| `core_playerPersonas.clear(personaNumber)` | Efface les données enregistrées d'une persona (retour aux valeurs par défaut). | 171 |
| `core_playerPersonas.clearAll()` | Efface toutes les personas enregistrées. | 179 |
| `core_playerPersonas.get(personaNumber)` | Construit et renvoie la persona du numéro donné (valeurs enregistrées + valeurs par défaut). | 134 |
| `core_playerPersonas.getDefaultDisplayName(personaNumber)` | Nom par défaut : traduction de 'ui.multiseat.playerTag' avec { number }, sinon 'Player N' si core_locales n'est pas chargé. | 106 |
| `core_playerPersonas.getDefaultIcon(personaNumber)` | Icône par défaut d'une persona, prise dans le pool avec un décalage aléatoire fixé pour la session. | 114 |
| `core_playerPersonas.getIconPool()` | Renvoie une copie de la liste des icônes de persona disponibles. | 232 |
| `core_playerPersonas.getNumberForPlayer(player)` | Convertit un indice de joueur local (0, 1, 2...) en numéro de persona (indice + 1). | 148 |
| `core_playerPersonas.getRevision()` | Renvoie le compteur de révision, incrémenté à chaque changement des personas. | 237 |
| `core_playerPersonas.invalidate()` | Incrémente la révision sans rien modifier, pour forcer les interfaces à se rafraîchir. | 186 |
| `core_playerPersonas.isPersonaIcon(icon)` | Indique si une icône fait partie du pool des icônes de persona. | 233 |
| `core_playerPersonas.preview(personaNumber)` | Construit une persona purement par défaut (sans les valeurs enregistrées) pour un numéro (1 si invalide). | 230 |
| `core_playerPersonas.replaceAll(values)` | Remplace toutes les personas par celles d'une table (clés = numéros, ou champ number de chaque élément) puis incrémente la révision. | 197 |
| `core_playerPersonas.restoreSnapshot(value)` | Restaure l'état à partir d'un instantané de snapshot() et incrémente la révision. | 219 |
| `core_playerPersonas.set(personaNumber, data)` | Enregistre les données d'une persona (id, displayName, icon, color, vehicle) et incrémente la révision. | 154 |
| `core_playerPersonas.snapshot()` | Copie profonde de l'état : { personas, revision }. | 190 |

### Détail des paramètres

#### `core_playerPersonas.applySoloColor(persona)`

Remplace en place la couleur d'une persona par le gris 'solo' et recalcule colorHex et vehicleFallbackPaint.

- `persona` (*table*) : Persona renvoyée par get/preview.
- **renvoie** : table La même table (ou la valeur reçue si ce n'est pas une table).

#### `core_playerPersonas.clear(personaNumber)`

Efface les données enregistrées d'une persona (retour aux valeurs par défaut).

- `personaNumber` (*integer*) : Numéro de persona.
- **renvoie** : boolean true si quelque chose a été effacé.

#### `core_playerPersonas.clearAll()`

Efface toutes les personas enregistrées.

- **renvoie** : boolean true si quelque chose a été effacé.

#### `core_playerPersonas.get(personaNumber)`

Construit et renvoie la persona du numéro donné (valeurs enregistrées + valeurs par défaut).

- `personaNumber` (*integer*) : Numéro de persona >= 1.
- **renvoie** : table|nil Persona, ou nil si le numéro n'est pas valide.

#### `core_playerPersonas.getDefaultDisplayName(personaNumber)`

Nom par défaut : traduction de 'ui.multiseat.playerTag' avec { number }, sinon 'Player N' si core_locales n'est pas chargé.

- `personaNumber` (*integer*) : Numéro de persona.
- **renvoie** : string Nom par défaut.

#### `core_playerPersonas.getDefaultIcon(personaNumber)`

Icône par défaut d'une persona, prise dans le pool avec un décalage aléatoire fixé pour la session.

- `personaNumber` (*integer*) : Numéro de persona.
- **renvoie** : string Nom d'icône.

#### `core_playerPersonas.getIconPool()`

Renvoie une copie de la liste des icônes de persona disponibles.

- **renvoie** : string[] Noms d'icônes.

#### `core_playerPersonas.getNumberForPlayer(player)`

Convertit un indice de joueur local (0, 1, 2...) en numéro de persona (indice + 1).

- `player` (*integer*) : Indice de joueur >= 0.
- **renvoie** : integer|nil Numéro, ou nil si invalide.

#### `core_playerPersonas.getRevision()`

Renvoie le compteur de révision, incrémenté à chaque changement des personas.

- **renvoie** : integer Révision courante.

#### `core_playerPersonas.isPersonaIcon(icon)`

Indique si une icône fait partie du pool des icônes de persona.

- `icon` (*string*) : Nom d'icône.
- **renvoie** : boolean true si valide.

#### `core_playerPersonas.preview(personaNumber)`

Construit une persona purement par défaut (sans les valeurs enregistrées) pour un numéro (1 si invalide).

- `personaNumber` (*integer|nil*) : Numéro de persona.
- **renvoie** : table Persona par défaut.

#### `core_playerPersonas.replaceAll(values)`

Remplace toutes les personas par celles d'une table (clés = numéros, ou champ number de chaque élément) puis incrémente la révision.

- `values` (*table*) : Table de personas { id, displayName, icon, color, vehicle }.
- **renvoie** : boolean false si values n'est pas une table.

#### `core_playerPersonas.restoreSnapshot(value)`

Restaure l'état à partir d'un instantané de snapshot() et incrémente la révision.

- `value` (*table*) : Instantané avec champ personas.
- **renvoie** : boolean false si l'instantané est invalide.

#### `core_playerPersonas.set(personaNumber, data)`

Enregistre les données d'une persona (id, displayName, icon, color, vehicle) et incrémente la révision.

- `personaNumber` (*integer*) : Numéro >= 1.
- `data` (*table*) : { id, displayName, icon, color = {r,g,b}, vehicle }
- **renvoie** : boolean true si enregistré, false si les arguments sont invalides.

#### `core_playerPersonas.snapshot()`

Copie profonde de l'état : { personas, revision }.

- **renvoie** : table Instantané.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/playerPersonas.lua`.*
