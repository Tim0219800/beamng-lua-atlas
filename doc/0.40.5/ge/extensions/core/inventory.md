# `core_inventory`

*Fichier : `lua/ge/extensions/core/inventory.lua` · VM : Game Engine (GE) · 216 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_inventory` : `extensions.load("core_inventory")`, puis la globale `core_inventory`

Extension GE `core_inventory` : inventaire simple de la campagne/scénarios. Stocke par type (clé en MAJUSCULES) soit un compteur numérique (argent), soit une liste d'objets (véhicules, pièces). Fournit des fonctions pour ajouter, retirer et lire des éléments, et interprète les blocs `onEvent` des fichiers de campagne (récompenses ou pertes selon la médaille obtenue).

## Exemple

```lua
core_inventory.addItem('$$$_MONEY', 200)
core_inventory.addItem('$$$_VEHICLE', {model='etk800', config='etk800_m', color='1 1 1 1'})
print(core_inventory.getItem('$$$_MONEY'))      -- 200 (la clé doit être en majuscules)
local liste = core_inventory.getItemList('$$$_VEHICLE')
```

## Remarques

- Les types sont convertis en MAJUSCULES par addItem/removeItem, mais PAS par getItem/getItemList : il faut passer le type en majuscules (ex. '$$$_MONEY') pour lire ce qu'on a ajouté.
- Un type contenant des nombres est un compteur (addItem additionne, removeItem soustrait, pas de limite basse) ; avec une table, le type devient une liste. Le premier ajout fixe la nature du type.
- Doublons : addItem d'une table n'ajoute rien si un élément existant a TOUS ses champs égaux aux champs correspondants de la nouvelle valeur (comparaison clé par clé depuis l'élément existant). removeItem d'une table supprime le premier élément dont model et config sont égaux à ceux de valueObj (les autres champs sont ignorés).
- processOnEvent : clés d'un bloc onEvent : 'remove' (retire) ou toute autre clé (ajoute) ; la clé est préfixée par '$$$_' et mise en majuscules. Dans 'remove', les sous-clés 'gold'/'silver'/'bronze' ne sont appliquées que si elles égalent earnedMedal ; les autres sous-clés sont retirées sans condition.
- Incohérence : onSerialize renvoie une copie de itemsTable mais onDeserialized est vide ; après un rechargement des extensions l'inventaire n'est donc pas restauré par ce mécanisme (seul onResumeCampaign le recharge). existItem renvoie nil (et non false) pour une liste vide ; getItem renvoie le dernier élément trouvé si plusieurs ont le même itemId.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_inventory.addItem(itemType, valueObj)` | Ajoute à l'inventaire : somme d'un nombre ou insertion d'un objet (sans doublon). Ignoré si itemType ou valueObj est nil/false. | 29 |
| `core_inventory.getItem(itemType, itemId)` | Lit un type. Pour un compteur renvoie sa valeur (0 si absent) ; pour une liste renvoie une copie de l'élément dont itemId est égal à itemId. | 85 |
| `core_inventory.getItemList(itemType)` | Copie profonde de la liste d'un type ; crée une liste vide pour ce type si absente (effet de bord). | 101 |
| `core_inventory.onDeserialized(data)` | Hook de restauration : ne fait rien (voir notes). *(interne)* *(hook)* | 196 |
| `core_inventory.onResumeCampaign(campaignInProgress, data)` | Hook de reprise de campagne : remplace itemsTable par les données sauvegardées. *(interne)* *(hook)* | 185 |
| `core_inventory.onSaveCampaign(saveCallback)` | Hook de sauvegarde de campagne : appelle saveCallback(alias de l'extension, copie de itemsTable). *(interne)* *(hook)* | 180 |
| `core_inventory.onSerialize()` | Hook de sérialisation avant rechargement des extensions : renvoie une copie de itemsTable. *(interne)* *(hook)* | 190 |
| `core_inventory.processOnEvent(onEventData, earnedMedal)` | Applique un bloc 'onEvent' de campagne : clés 'add' directes (type -> valeur ou liste) et bloc 'remove' (par médaille ou inconditionnel). | 129 |
| `core_inventory.removeItem(itemType, valueObj)` | Retire de l'inventaire : soustrait un nombre ou supprime l'objet dont model et config correspondent. | 58 |

### Détail des paramètres

#### `core_inventory.addItem(itemType, valueObj)`

Ajoute à l'inventaire : somme d'un nombre ou insertion d'un objet (sans doublon). Ignoré si itemType ou valueObj est nil/false.

- `itemType` (*string*) : Type d'objet (converti en majuscules), par convention préfixé '$$$_'.
- `valueObj` (*number|table*) : Quantité à ajouter, ou objet (ex. {model, config, color}).

#### `core_inventory.getItem(itemType, itemId)`

Lit un type. Pour un compteur renvoie sa valeur (0 si absent) ; pour une liste renvoie une copie de l'élément dont itemId est égal à itemId.

- `itemType` (*string*) : Type exact (déjà en majuscules).
- `itemId` (*any*) : Valeur du champ itemId recherchée (liste seulement).
- **renvoie** : number|table|nil Quantité, copie de l'élément, ou nil si non trouvé dans une liste.

#### `core_inventory.getItemList(itemType)`

Copie profonde de la liste d'un type ; crée une liste vide pour ce type si absente (effet de bord).

- `itemType` (*string*) : Type exact (déjà en majuscules).
- **renvoie** : table Copie de la liste (ou du compteur numérique s'il s'agit d'un nombre).

#### `core_inventory.onDeserialized(data)`

Hook de restauration : ne fait rien (voir notes).

- `data` (*table*) : Données de onSerialize (non utilisées).

#### `core_inventory.onResumeCampaign(campaignInProgress, data)`

Hook de reprise de campagne : remplace itemsTable par les données sauvegardées.

- `campaignInProgress` (*any*) : Campagne en cours (non utilisé).
- `data` (*table*) : Données sauvegardées.

#### `core_inventory.onSaveCampaign(saveCallback)`

Hook de sauvegarde de campagne : appelle saveCallback(alias de l'extension, copie de itemsTable).

- `saveCallback` (*function*) : Fonction (nomExtension, données).

#### `core_inventory.onSerialize()`

Hook de sérialisation avant rechargement des extensions : renvoie une copie de itemsTable.

- **renvoie** : table Inventaire.

#### `core_inventory.processOnEvent(onEventData, earnedMedal)`

Applique un bloc 'onEvent' de campagne : clés 'add' directes (type -> valeur ou liste) et bloc 'remove' (par médaille ou inconditionnel).

- `onEventData` (*table|nil*) : Bloc onEvent ; nil = rien.
- `earnedMedal` (*string|nil*) : 'bronze', 'silver' ou 'gold' : sélectionne le sous-bloc de 'remove'.

#### `core_inventory.removeItem(itemType, valueObj)`

Retire de l'inventaire : soustrait un nombre ou supprime l'objet dont model et config correspondent.

- `itemType` (*string*) : Type d'objet (converti en majuscules).
- `valueObj` (*number|table*) : Quantité à retirer, ou objet avec model et config.

## Champs

| Champ | Type | Description |
|---|---|---|
| `itemsTable` | table<string, number|table[]> | Inventaire : type (MAJUSCULES) -> compteur ou liste d'objets. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/inventory.lua`.*
