# `career_modules_payment`

*Fichier : `lua/ge/extensions/career/modules/payment.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_payment` : `extensions.load("career_modules_payment")`, puis la globale `career_modules_payment`

Paiement générique en carrière : vérifie qu'un prix (table de devises) est payable avec les attributs du joueur et le débite via career_modules_playerAttributes.

## Exemple

```lua
if career_modules_payment.pay({money = {amount = 500}}, {tags = {"buying"}, label = "Achat"}) then ... end
```

## Remarques

- Le prix est une table {devise = {amount = n, canBeNegative = bool}}. Une devise avec canBeNegative = true n'est jamais bloquante.
- pay renvoie false sans rien débiter si canPay échoue.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_payment.canPay(price)` | Teste si le joueur possède assez de chaque devise du prix (sauf devises canBeNegative ou montant <= 0). | 9 |
| `career_modules_payment.pay(price, reason)` | Débite le prix (montants négatifs) via playerAttributes.addAttributes si canPay. | 18 |

### Détail des paramètres

#### `career_modules_payment.canPay(price)`

Teste si le joueur possède assez de chaque devise du prix (sauf devises canBeNegative ou montant <= 0).

- `price` (*table<string, {amount: number, canBeNegative: boolean|nil}>*) : Prix par devise.
- **renvoie** : boolean true si payable.

#### `career_modules_payment.pay(price, reason)`

Débite le prix (montants négatifs) via playerAttributes.addAttributes si canPay.

- `price` (*table*) : Prix par devise, comme pour canPay.
- `reason` (*table|nil*) : Raison passée au journal des attributs (tags, label).
- **renvoie** : boolean true si le paiement a eu lieu.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/payment.lua`.*
