# `career_modules_playerAttributes`

*Fichier : `lua/ge/extensions/career/modules/playerAttributes.lua` · VM : Game Engine (GE) · 328 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_playerAttributes` : `extensions.load("career_modules_playerAttributes")`, puis la globale `career_modules_playerAttributes`

Registre central des attributs du joueur en carrière : money, beamXP, vouchers, un attribut par branche/compétence (branch.attributeKey) et <orgId>Reputation par organisation. Chaque attribut a une valeur, des gains et des pertes cumulés par tag (+ "all"), et éventuellement min/max. Toute modification passe par addAttributes (ou setAttributes) qui met à jour les statistiques, tient le journal des changements, écrit dans career_modules_log et émet le hook onPlayerAttributesChanged(change, reason). Sauvegarde dans career/playerAttributes.json et career/attributeLog.json.

## Exemple

```lua
career_modules_playerAttributes.addAttributes({money = 250, beamXP = 10}, {label = "ui.career.attributeLog.unknownReason", tags = {"gameplay", "reward"}})
local money = career_modules_playerAttributes.getAttributeValue("money")
```

## Remarques

- reason = {label, tags}. label est une clé de traduction ou une table {txt, context} ; tags est une liste convertie en dictionnaire. Sans reason, un avertissement est loggé avec la trace d'appel.
- Les tags servent aux jalons : money.gains/losses[tag] alimentent career_modules_milestones_generalMilestones_money (reward, buying, selling, delivery, fine, partsBought, vehicleBought).
- Une modification d'un attribut se terminant par "Reputation" appelle career_career.interactWithOrganization(orgId).
- Les valeurs sont bornées par attribute.min/max (réputation : -50 à 700).
- Tag gameplay avec argent (hors tutoriel) débloque le succès FIRST_ASSIGNMENT ; tag fine avec argent débloque PAID_THE_PRICE.
- Bug : M.logAttributeChange = logAttributeChange référence une variable non définie : le champ exporté vaut nil.
- init() (non exportée) est appelée seulement par onExtensionLoaded quand attributes est nil ; le mode de départ de la carrière peut fournir initPlayerAttributes(M), sinon l'argent de départ est 10000 (label startingCapital).
- Compatibilité : bonusStars devient vouchers si la version de sauvegarde < 37 ; les anciens noms de branches sont remappés via career_branches.oldAttributeNamesToNewNames.
- onLogbookGetEntries est un hook vide.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_playerAttributes.addAttributes(change, reason)` | Ajoute les variations données aux attributs (création si absent), met à jour gains/losses par tag, enregistre l'entrée dans attributeLog, écrit un log carrière et émet onPlayerAttributesChanged(change, reason). | 66 |
| `career_modules_playerAttributes.getAllAttributes()` | Renvoie la table de tous les attributs (référence directe, non copiée). | 152 |
| `career_modules_playerAttributes.getAttribute(attributeName)` | Renvoie l'objet complet d'un attribut {value, gains, losses, min, max}. | 145 |
| `career_modules_playerAttributes.getAttributeLog()` | Renvoie le journal des changements d'attributs ({attributeChange, reason, time}). | 320 |
| `career_modules_playerAttributes.getAttributeValue(attributeName)` | Renvoie la valeur numérique d'un attribut (0 s'il n'existe pas). | 148 |
| `career_modules_playerAttributes.getCareerHistoryInfo(historyType)` | Renvoie le titre (clé de traduction) de l'écran d'historique : gameplay ou financier (défaut). | 215 |
| `career_modules_playerAttributes.getFinancialHistory(limit)` | Historique des changements d'argent, du plus récent au plus ancien. | 207 |
| `career_modules_playerAttributes.getGameplayHistory(limit)` | Historique des récompenses de gameplay (changements dont les tags contiennent gameplay), avec noms d'affichage et icônes. | 211 |
| `career_modules_playerAttributes.getRecentFinancialChanges(limit)` | Historique financier récent (les 5 derniers changements d'argent par défaut), du plus récent au plus ancien. | 203 |
| `career_modules_playerAttributes.getRewardDisplayName(attributeKey)` | Renvoie la clé de traduction d'affichage d'un attribut : money, beamXP, vouchers, reputation, XP de branche {txt, context} ou la clé brute. | 22 |
| `career_modules_playerAttributes.onCareerActive(active)` | Hook : crée l'attribut <orgId>Reputation (min/max de career_modules_reputation) pour chaque organisation qui n'en a pas. *(interne)* *(hook)* | 294 |
| `career_modules_playerAttributes.onExtensionLoaded()` | Hook : si la carrière est active, initialise les attributs puis charge playerAttributes.json et attributeLog.json avec conversions de compatibilité (renvoie false sinon). *(interne)* *(hook)* | 226 |
| `career_modules_playerAttributes.onLogbookGetEntries(_)` | Hook d'intégration au journal de bord (corps vide). *(interne)* *(hook)* | 307 |
| `career_modules_playerAttributes.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde : écrit playerAttributes.json et attributeLog.json dans <save>/career/. *(interne)* *(hook)* | 288 |
| `career_modules_playerAttributes.setAttributes(newValues, reason)` | Fixe des valeurs absolues en appelant addAttributes avec la différence par rapport à la valeur actuelle. | 136 |

### Détail des paramètres

#### `career_modules_playerAttributes.addAttributes(change, reason)`

Ajoute les variations données aux attributs (création si absent), met à jour gains/losses par tag, enregistre l'entrée dans attributeLog, écrit un log carrière et émet onPlayerAttributesChanged(change, reason).

- `change` (*table<string, number>*) : Variation par attribut (positif = gain, négatif = perte).
- `reason` (*{label: string|table, tags: string[]}|nil*) : Raison : libellé et liste de tags.

#### `career_modules_playerAttributes.getAllAttributes()`

Renvoie la table de tous les attributs (référence directe, non copiée).

- **renvoie** : table<string, table> Attributs par nom.

#### `career_modules_playerAttributes.getAttribute(attributeName)`

Renvoie l'objet complet d'un attribut {value, gains, losses, min, max}.

- `attributeName` (*string*) : Nom de l'attribut.
- **renvoie** : table|nil Attribut, nil s'il n'existe pas.

#### `career_modules_playerAttributes.getAttributeLog()`

Renvoie le journal des changements d'attributs ({attributeChange, reason, time}).

- **renvoie** : table[] Entrées du journal.

#### `career_modules_playerAttributes.getAttributeValue(attributeName)`

Renvoie la valeur numérique d'un attribut (0 s'il n'existe pas).

- `attributeName` (*string*) : Nom de l'attribut.
- **renvoie** : number Valeur.

#### `career_modules_playerAttributes.getCareerHistoryInfo(historyType)`

Renvoie le titre (clé de traduction) de l'écran d'historique : gameplay ou financier (défaut).

- `historyType` (*string*) : "gameplay" ou autre pour le financier.
- **renvoie** : {title: string} Titre.

#### `career_modules_playerAttributes.getFinancialHistory(limit)`

Historique des changements d'argent, du plus récent au plus ancien.

- `limit` (*integer|nil*) : Nombre maximal (tout si nil).
- **renvoie** : table[] Lignes d'historique.

#### `career_modules_playerAttributes.getGameplayHistory(limit)`

Historique des récompenses de gameplay (changements dont les tags contiennent gameplay), avec noms d'affichage et icônes.

- `limit` (*integer|nil*) : Nombre maximal (tout si nil).
- **renvoie** : table[] Lignes d'historique.

#### `career_modules_playerAttributes.getRecentFinancialChanges(limit)`

Historique financier récent (les 5 derniers changements d'argent par défaut), du plus récent au plus ancien.

- `limit` (*integer|nil*) : Nombre maximal, 5 par défaut.
- **renvoie** : {reason: any, time: integer, rewards: table[]}[] Lignes d'historique.

#### `career_modules_playerAttributes.getRewardDisplayName(attributeKey)`

Renvoie la clé de traduction d'affichage d'un attribut : money, beamXP, vouchers, reputation, XP de branche {txt, context} ou la clé brute.

- `attributeKey` (*string*) : Clé d'attribut.
- **renvoie** : string|table Clé de traduction ou table {txt, context}.

#### `career_modules_playerAttributes.onCareerActive(active)`

Hook : crée l'attribut <orgId>Reputation (min/max de career_modules_reputation) pour chaque organisation qui n'en a pas.

- `active` (*boolean*) : Rien si false.

#### `career_modules_playerAttributes.onLogbookGetEntries(_)`

Hook d'intégration au journal de bord (corps vide).

- `_` (*any*) : Non utilisé.

#### `career_modules_playerAttributes.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde : écrit playerAttributes.json et attributeLog.json dans <save>/career/.

- `currentSavePath` (*string*) : Dossier de sauvegarde.

#### `career_modules_playerAttributes.setAttributes(newValues, reason)`

Fixe des valeurs absolues en appelant addAttributes avec la différence par rapport à la valeur actuelle.

- `newValues` (*table<string, number>*) : Nouvelle valeur par attribut.
- `reason` (*table|nil*) : Même format que pour addAttributes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career. |
| `logAttributeChange` | nil | Toujours nil : référence une variable locale inexistante dans le fichier (bug). ⚠ référence `logAttributeChange` non définie dans le fichier (vaut probablement nil) |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPlayerAttributesChanged` — écouté par 3 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/playerAttributes.lua`.*
