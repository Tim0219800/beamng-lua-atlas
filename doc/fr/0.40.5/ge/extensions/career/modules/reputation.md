# `career_modules_reputation`

*Fichier : `lua/ge/extensions/career/modules/reputation.lua` · VM : Game Engine (GE) · 160 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_reputation` : `extensions.load("career_modules_reputation")`, puis la globale `career_modules_reputation`

Calcul de la réputation du joueur auprès des organisations de la carrière. Valeur comprise entre -50 et 700, convertie en niveau (-1 à 3 par défaut : questionable, neutral, reliable, preferred, partner) avec, par niveau, la part retenue sur les véhicules prêtés (loanerCut) et le bonus de livraison (deliveryBonus). La valeur brute est l'attribut <orgId>Reputation de playerAttributes.

## Remarques

- Seuils par défaut (requiredValue) : -50, -25, 40, 175, 400. Les organisations peuvent surcharger via organization.reputationLevels.
- Événements : returnLoanerDamaged = -20, discardDeliveryVehicle = -10.
- addReputationToOrg modifie l'objet organisation : fusionne les valeurs par défaut dans reputationLevels, traduit label/levelLabel et écrit organization.reputation.
- Le niveau renvoyé est (index trouvé - 2) ; addReputationToOrg suppose donc que reputationLevels commence au niveau -1.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_reputation.addReputationToOrg(organization)` | Calcule la réputation de l'organisation et l'attache dans organization.reputation = {value, level, curLvlProgress, neededForNext, prevThreshold, nextThreshold} ; complète aussi les niveaux avec les valeurs par défaut. | 101 |
| `career_modules_reputation.getLabel(lvl)` | Libellé traduit du niveau de réputation par défaut. | 139 |
| `career_modules_reputation.getMaximumValue()` | Valeur maximale de réputation. | 149 |
| `career_modules_reputation.getMinimumValue()` | Valeur minimale de réputation. | 145 |
| `career_modules_reputation.getValueForEvent(eventId)` | Variation de réputation associée à un événement. | 78 |

### Détail des paramètres

#### `career_modules_reputation.addReputationToOrg(organization)`

Calcule la réputation de l'organisation et l'attache dans organization.reputation = {value, level, curLvlProgress, neededForNext, prevThreshold, nextThreshold} ; complète aussi les niveaux avec les valeurs par défaut.

- `organization` (*table|nil*) : Organisation (id, reputationLevels). Ne fait rien si nil.

#### `career_modules_reputation.getLabel(lvl)`

Libellé traduit du niveau de réputation par défaut.

- `lvl` (*integer*) : Niveau de -1 à 3.
- **renvoie** : string Libellé, ou chaîne vide si inconnu.

#### `career_modules_reputation.getMaximumValue()`

Valeur maximale de réputation.

- **renvoie** : number 700.

#### `career_modules_reputation.getMinimumValue()`

Valeur minimale de réputation.

- **renvoie** : number -50.

#### `career_modules_reputation.getValueForEvent(eventId)`

Variation de réputation associée à un événement.

- `eventId` (*string*) : returnLoanerDamaged ou discardDeliveryVehicle.
- **renvoie** : number|nil Variation (négative), nil si inconnu.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/reputation.lua`.*
