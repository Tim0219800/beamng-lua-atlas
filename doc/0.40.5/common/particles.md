# `_`

*Fichier : `lua/common/particles.lua` · VM : Commun (GE + véhicule) · 135 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `_`, `particles`

Charge au démarrage lua/common/particles.json (matériaux physiques et règles de particules entre deux matériaux) et prépare des tables de recherche : une liste de matériaux et une table indexée par paire de matériaux avec, pour chaque règle, une fonction de comparaison compilée (sur perpendicularVel et slipVel). Sert à choisir les particules d'impact/glissement selon les deux matériaux en contact.

## Exemple

```lua
local particles = require('particles')
local mats, pairsMap = particles.getMaterialsParticlesTable()
local id1 = particles.getMaterialIDByName(mats, 'ASPHALT')
local mat = particles.getMaterialByID(mats, id1)
```

## Remarques

- Le chargement se fait à l'exécution du module (preloadParticlesTable() est appelé au niveau du fichier) via readDictJSONTable('lua/common/particles.json').
- Clé de la table de paires : materialID1 * 10000 + materialID2, avec toujours materialID1 >= materialID2 (échangés si besoin). Chaque entrée est une liste de règles ayant compareFunc(arg) où arg = {perpendicularVel=, slipVel=} ; dans les chaînes JSON, la lettre X est remplacée par arg.<champ>.
- Un matériau inconnu passé à getOrAddMaterialIDByName est ajouté dynamiquement ({colorB/G/R = 255, dynamic = true, name}) ; getMaterialIDByName renvoie à la place min(3, #mats) (valeur de repli, id 3 si assez de matériaux).
- BUG probable : si perpendicularVel et slipVel sont tous deux vides dans une règle, compareFuncStr vaut '' (table.concat d'une liste vide) et non nil ; la condition 'toujours vraie' ("true") n'est donc jamais appliquée et la fonction compilée ('return ') renvoie nil. De plus, dans le message d'erreur de parsing, `compareFuncStr` est une variable non définie (devrait être v.compareFuncStr).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `_.getMaterialByID(mats, i)` | Renvoie le matériau d'indice i dans mats, ou nil si i est nil. | 11 |
| `_.getMaterialIDByName(mats, s)` | Cherche l'identifiant du matériau nommé s ; renvoie min(3, #mats) s'il est inconnu (pas d'ajout). | 30 |
| `_.getMaterialsParticlesTable()` | Renvoie la liste des matériaux et la table des règles de particules par paire de matériaux (clé id1*10000+id2). | 122 |
| `_.getOrAddMaterialIDByName(mats, s)` | Cherche l'identifiant du matériau de nom s ; s'il n'existe pas, crée une définition temporaire (blanche, dynamic = true) ajoutée à mats et renvoie son nouvel identifiant. | 16 |

### Détail des paramètres

#### `_.getMaterialByID(mats, i)`

Renvoie le matériau d'indice i dans mats, ou nil si i est nil.

- `mats` (*table*) : liste de matériaux (premier retour de getMaterialsParticlesTable)
- `i` (*integer|nil*) : identifiant de matériau
- **renvoie** : table|nil matériau {name, colorR, colorG, colorB, …}

#### `_.getMaterialIDByName(mats, s)`

Cherche l'identifiant du matériau nommé s ; renvoie min(3, #mats) s'il est inconnu (pas d'ajout).

- `mats` (*table*) : liste de matériaux
- `s` (*string*) : nom du matériau
- **renvoie** : integer identifiant de matériau

#### `_.getMaterialsParticlesTable()`

Renvoie la liste des matériaux et la table des règles de particules par paire de matériaux (clé id1*10000+id2).

- **renvoie** : table matériaux
- **renvoie** : table<integer, table[]> règles par paire de matériaux

#### `_.getOrAddMaterialIDByName(mats, s)`

Cherche l'identifiant du matériau de nom s ; s'il n'existe pas, crée une définition temporaire (blanche, dynamic = true) ajoutée à mats et renvoie son nouvel identifiant.

- `mats` (*table*) : liste de matériaux (modifiée)
- `s` (*string*) : nom du matériau
- **renvoie** : integer identifiant de matériau

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/particles.lua`.*
