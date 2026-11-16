# `campaign_dealer`

*Fichier : `lua/ge/extensions/campaign/dealer.lua` · VM : Game Engine (GE) · 134 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `campaign_dealer` : `extensions.load("campaign_dealer")`, puis la globale `campaign_dealer`

Concessionnaire de la campagne : tient un stock (M.state.stock) indexé par type d'objet en majuscules. Un stock est soit une liste de tables (véhicules {model, config}), soit un nombre cumulé. Sauvegardé et restauré avec la campagne (onSaveCampaign / onResumeCampaign). La fonction buy est vide (non implémentée).

## Exemple

```lua
campaign_dealer.addToStock('$$$_vehicles', {model='pickup', config='base'})
local stock = campaign_dealer.getStock('$$$_VEHICLES')
```

## Remarques

- addToStock et removeFromStock passent itemType en majuscules ; getStock ne le fait pas : il faut donc lui donner le type déjà en majuscules.
- Bug probable : existItem considère un doublon dès qu'un seul champ de l'entrée existante est égal à celui de valueObj (pas tous les champs) ; deux véhicules du même modèle avec une config différente sont donc vus comme identiques.
- removeFromStock compare model et config des entrées et laisse des print de débogage ; pour un stock numérique il soustrait la valeur.
- onDeserialized ne fait que journaliser ; onResumeCampaign remplace M.state par les données reçues (sans copie).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `campaign_dealer.addToStock(itemType, valueObj)` | Ajoute un objet (table, sans doublon selon existItem) ou une quantité (nombre) au stock du type donné. Crée l'entrée si besoin. | 32 |
| `campaign_dealer.buy(itemType, index)` | Prévue pour acheter un objet du stock ; le corps est vide dans cette version. | 98 |
| `campaign_dealer.getStock(itemType)` | Retourne une copie profonde du stock d'un type (crée une liste vide si absent). | 61 |
| `campaign_dealer.onDeserialized(data)` | Hook appelé après désérialisation ; ne fait que journaliser. *(interne)* *(hook)* | 108 |
| `campaign_dealer.onResumeCampaign(campaignInProgress, data)` | Hook de reprise de campagne : remplace M.state par data. *(interne)* *(hook)* | 118 |
| `campaign_dealer.onSaveCampaign(saveCallback)` | Hook de sauvegarde de la campagne : appelle saveCallback(M.__globalAlias__, copie de l'état). *(interne)* *(hook)* | 113 |
| `campaign_dealer.onSerialize()` | Hook de sérialisation : retourne une copie profonde de M.state. *(interne)* *(hook)* | 102 |
| `campaign_dealer.removeFromStock(itemType, valueObj)` | Retire du stock la première entrée dont model et config correspondent (valeur table) ou soustrait la quantité (valeur nombre). | 68 |

### Détail des paramètres

#### `campaign_dealer.addToStock(itemType, valueObj)`

Ajoute un objet (table, sans doublon selon existItem) ou une quantité (nombre) au stock du type donné. Crée l'entrée si besoin.

- `itemType` (*string*) : Type du stock (converti en majuscules).
- `valueObj` (*table|number*) : Objet à ajouter ou quantité.

#### `campaign_dealer.buy(itemType, index)`

Prévue pour acheter un objet du stock ; le corps est vide dans cette version.

- `itemType` (*string*) : Type de stock.
- `index` (*integer*) : Position de l'objet (déduit du nom).

#### `campaign_dealer.getStock(itemType)`

Retourne une copie profonde du stock d'un type (crée une liste vide si absent).

- `itemType` (*string*) : Type de stock, tel qu'enregistré (majuscules).
- **renvoie** : table|number Copie du stock.

#### `campaign_dealer.onDeserialized(data)`

Hook appelé après désérialisation ; ne fait que journaliser.

- `data` (*table*) : Données désérialisées (non utilisées).

#### `campaign_dealer.onResumeCampaign(campaignInProgress, data)`

Hook de reprise de campagne : remplace M.state par data.

- `campaignInProgress` (*any*) : Campagne en cours (non utilisé).
- `data` (*table*) : État sauvegardé.

#### `campaign_dealer.onSaveCampaign(saveCallback)`

Hook de sauvegarde de la campagne : appelle saveCallback(M.__globalAlias__, copie de l'état).

- `saveCallback` (*function*) : Reçoit (alias global du module, données).

#### `campaign_dealer.onSerialize()`

Hook de sérialisation : retourne une copie profonde de M.state.

- **renvoie** : table Copie de l'état.

#### `campaign_dealer.removeFromStock(itemType, valueObj)`

Retire du stock la première entrée dont model et config correspondent (valeur table) ou soustrait la quantité (valeur nombre).

- `itemType` (*string*) : Type du stock (converti en majuscules).
- `valueObj` (*table|number*) : Objet {model, config} à retirer ou quantité.

## Champs

| Champ | Type | Description |
|---|---|---|
| `state` | table | État sauvegardé : {stock = table<string, table\|number>}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/campaign/dealer.lua`.*
