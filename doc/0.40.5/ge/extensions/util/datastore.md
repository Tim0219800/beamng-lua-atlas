# `util_datastore`

*Fichier : `lua/ge/extensions/util/datastore.lua` · VM : Game Engine (GE) · 425 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_datastore` : `extensions.load("util_datastore")`, puis la globale `util_datastore`

Magasin clé/valeur persistant générique, avec index secondaires construits à la demande. Chaque « store » est enregistré sous un nom avec un champ clé primaire (unique) et stocké dans un fichier <chemin>/<prefix->nom.bin (MessagePack ; le format JSON existe dans le code mais USE_MSGPACK est à true). Il sert de cache de données (le code mentionne un cache de l'UI) et permet de chercher des entrées par n'importe quel champ, de suivre des chaînes de relations (getChain) et de réécrire le fichier à chaque modification.

## Exemple

```lua
util_datastore.register('myStore', 'id', {path = '/temp'})
util_datastore.putEntries('myStore', {{id = 'a', color = 'red'}, {id = 'b', color = 'red'}})
local reds = util_datastore.getEntries('myStore', 'color', {'red'})
```

## Remarques

- Un store non enregistré fait renvoyer à la plupart des fonctions une table d'échec {ok = false, err = 'store_not_registered', storeName = ...} (et non nil). Tester avec isUnregisteredFailure(result).
- Le fichier n'est lu qu'au premier accès (chargement paresseux) ; un fichier tronqué ou illisible donne un store vide. Les fichiers écrits ne contiennent que des entrées (tableau de tables) ; l'ordre n'est pas garanti.
- Chemin par défaut : /temp ; clé primaire par défaut : 'name'. Les chemins sont normalisés (barres obliques, sans barre finale). Avec opts.prefix non vide, le fichier devient <prefix>-<storeName>.bin.
- Store en lecture seule (opts.readonly = true) : putEntries, removeEntries et clear renvoient false sans écrire.
- Les index secondaires sont multivalués (plusieurs entrées par valeur) et construits au premier usage d'un champ, puis maintenus à chaque putEntries/removeEntries. Les valeurs nil ne sont pas indexées.
- getChain part d'une entrée « graine » puis suit en profondeur le champ chainField (tableau de clés) en résolvant chaque clé dans le champ chainResolveField (réglés par setChain), sans doublons ; renvoie la liste des entrées trouvées, graine en tête.
- Rechargement à chaud : onSerialize ne conserve que les enregistrements (chemin, champs, lecture seule, chaîne), pas les entrées, qui sont relues depuis le fichier.
- register réutilise la configuration de chaîne d'un enregistrement précédent du même nom. L'extension passe en déchargement manuel (onInit).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_datastore.clear(storeName)` | Vide le store et réécrit le fichier (vide). | 347 |
| `util_datastore.getAll(storeName)` | Renvoie toutes les entrées du store (ordre non garanti). | 242 |
| `util_datastore.getChain(storeName, field, value)` | Cherche une entrée graine puis suit sa chaîne de relations (chainField/resolveField définis par setChain), sans cycle. | 261 |
| `util_datastore.getEntries(storeName, field, values)` | Renvoie les entrées dont le champ vaut l'une des valeurs, sans doublons (dédoublonnées par clé primaire). | 194 |
| `util_datastore.getEntry(storeName, field, value)` | Renvoie la première entrée dont le champ vaut value. | 184 |
| `util_datastore.getIndex(storeName, field, primaryKey)` | Sans primaryKey : liste des valeurs distinctes présentes pour le champ. Avec primaryKey = true : table clé primaire -> valeur du champ pour chaque entrée (non dédoublonnée). | 221 |
| `util_datastore.hasEntry(storeName, field, value)` | Indique si au moins une entrée a ce champ égal à value. | 252 |
| `util_datastore.isRegistered(storeName)` | Indique si un store est enregistré. | 64 |
| `util_datastore.isUnregisteredFailure(result)` | Indique si un résultat est l'échec « store_not_registered ». | 73 |
| `util_datastore.onDeserialized(data)` | Hook de rechargement à chaud : recrée les stores à partir des enregistrements sauvegardés (entrées à relire du fichier). *(interne)* *(hook)* | 388 |
| `util_datastore.onInit()` | Hook d'initialisation : passe l'extension en déchargement manuel. *(interne)* *(hook)* | 369 |
| `util_datastore.onSerialize()` | Hook de rechargement à chaud : sérialise seulement les enregistrements des stores (pas les entrées). *(interne)* *(hook)* | 374 |
| `util_datastore.putEntries(storeName, entries)` | Insère ou remplace des entrées (identifiées par la clé primaire), met à jour les index et réécrit le fichier. Les entrées sans clé primaire sont ignorées avec un avertissement. | 292 |
| `util_datastore.register(storeName, primaryField, opts)` | Enregistre (ou ré-enregistre) un store en mémoire ; ne charge pas le fichier. | 147 |
| `util_datastore.removeEntries(storeName, field, values)` | Supprime les entrées dont le champ vaut l'une des valeurs, puis réécrit le fichier. | 315 |
| `util_datastore.setChain(storeName, chainField, field)` | Définit comment suivre les relations pour getChain : chainField contient un tableau de clés, résolues via le champ field. | 359 |
| `util_datastore.unregister(storeName)` | Retire l'enregistrement en mémoire sans toucher au fichier. | 174 |

### Détail des paramètres

#### `util_datastore.clear(storeName)`

Vide le store et réécrit le fichier (vide).

- `storeName` (*string*) : Nom du store.
- **renvoie** : boolean|table true ; false si lecture seule ; table d'échec si non enregistré.

#### `util_datastore.getAll(storeName)`

Renvoie toutes les entrées du store (ordre non garanti).

- `storeName` (*string*) : Nom du store.
- **renvoie** : table[] Entrées (ou table d'échec).

#### `util_datastore.getChain(storeName, field, value)`

Cherche une entrée graine puis suit sa chaîne de relations (chainField/resolveField définis par setChain), sans cycle.

- `storeName` (*string*) : Nom du store.
- `field` (*string*) : Champ pour trouver la graine.
- `value` (*any*) : Valeur de la graine.
- **renvoie** : table[] Graine puis entrées liées ; vide si la graine n'existe pas.

#### `util_datastore.getEntries(storeName, field, values)`

Renvoie les entrées dont le champ vaut l'une des valeurs, sans doublons (dédoublonnées par clé primaire).

- `storeName` (*string*) : Nom du store.
- `field` (*string*) : Champ de recherche.
- `values` (*table*) : Liste de valeurs ; une valeur non-table donne une liste vide.
- **renvoie** : table[] Entrées trouvées (ou table d'échec).

#### `util_datastore.getEntry(storeName, field, value)`

Renvoie la première entrée dont le champ vaut value.

- `storeName` (*string*) : Nom du store.
- `field` (*string*) : Champ de recherche (clé primaire ou autre).
- `value` (*any*) : Valeur cherchée.
- **renvoie** : table|nil Entrée, nil si absente, ou table d'échec si le store n'est pas enregistré.

#### `util_datastore.getIndex(storeName, field, primaryKey)`

Sans primaryKey : liste des valeurs distinctes présentes pour le champ. Avec primaryKey = true : table clé primaire -> valeur du champ pour chaque entrée (non dédoublonnée).

- `storeName` (*string*) : Nom du store.
- `field` (*string*) : Champ à indexer.
- `primaryKey` (*boolean|nil*) : true pour la table indexée par clé primaire.
- **renvoie** : table Liste ou table, ou table d'échec.

#### `util_datastore.hasEntry(storeName, field, value)`

Indique si au moins une entrée a ce champ égal à value.

- `storeName` (*string*) : Nom du store.
- `field` (*string*) : Champ de recherche.
- `value` (*any*) : Valeur cherchée.
- **renvoie** : boolean true si trouvée (ou table d'échec si store inconnu).

#### `util_datastore.isRegistered(storeName)`

Indique si un store est enregistré.

- `storeName` (*string*) : Nom du store.
- **renvoie** : boolean true si enregistré.

#### `util_datastore.isUnregisteredFailure(result)`

Indique si un résultat est l'échec « store_not_registered ».

- `result` (*any*) : Résultat d'une fonction du module.
- **renvoie** : boolean true si c'est cet échec.

#### `util_datastore.onDeserialized(data)`

Hook de rechargement à chaud : recrée les stores à partir des enregistrements sauvegardés (entrées à relire du fichier).

- `data` (*table*) : Résultat d'onSerialize.

#### `util_datastore.onSerialize()`

Hook de rechargement à chaud : sérialise seulement les enregistrements des stores (pas les entrées).

- **renvoie** : table {registrations = ...}.

#### `util_datastore.putEntries(storeName, entries)`

Insère ou remplace des entrées (identifiées par la clé primaire), met à jour les index et réécrit le fichier. Les entrées sans clé primaire sont ignorées avec un avertissement.

- `storeName` (*string*) : Nom du store.
- `entries` (*table[]*) : Liste d'entrées (tables).
- **renvoie** : boolean true si quelque chose a changé ; false si lecture seule, argument invalide ou rien à écrire (ou table d'échec).

#### `util_datastore.register(storeName, primaryField, opts)`

Enregistre (ou ré-enregistre) un store en mémoire ; ne charge pas le fichier.

- `storeName` (*string*) : Nom du store (non vide).
- `primaryField` (*string|nil*) : Champ de clé primaire unique, 'name' par défaut.
- `opts` (*table|nil*) : {path = dossier (défaut /temp), prefix = préfixe du fichier, readonly = boolean}.
- **renvoie** : boolean false si le nom est invalide, sinon true.

#### `util_datastore.removeEntries(storeName, field, values)`

Supprime les entrées dont le champ vaut l'une des valeurs, puis réécrit le fichier.

- `storeName` (*string*) : Nom du store.
- `field` (*string*) : Champ de recherche.
- `values` (*table*) : Liste de valeurs.
- **renvoie** : boolean true si des entrées ont été supprimées.

#### `util_datastore.setChain(storeName, chainField, field)`

Définit comment suivre les relations pour getChain : chainField contient un tableau de clés, résolues via le champ field.

- `storeName` (*string*) : Nom du store.
- `chainField` (*string*) : Champ de l'entrée contenant un tableau de clés liées.
- `field` (*string*) : Champ dans lequel chercher chaque clé.
- **renvoie** : boolean|table true, ou table d'échec.

#### `util_datastore.unregister(storeName)`

Retire l'enregistrement en mémoire sans toucher au fichier.

- `storeName` (*string*) : Nom du store.
- **renvoie** : boolean true si le store existait.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/datastore.lua`.*
