# `career_modules_insurance_history`

*Fichier : `lua/ge/extensions/career/modules/insurance/history.lua` · VM : Game Engine (GE) · 116 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_insurance_history` : `extensions.load("career_modules_insurance_history")`, puis la globale `career_modules_insurance_history`

Historique des événements d'assurance du joueur en carrière (réclamations, réparations privées, renouvellements, changements de contrat…). Chaque entrée porte un type, un titre, des effets (par exemple {type='money', changedBy=-montant}), le nom de l'assurance concernée, un texte optionnel, des données libres (other) et l'heure os.time(). Le module fournit aussi des totaux utilisés pour les statistiques d'assurance. Les données sont sauvegardées par le module insurance via getPlHistory/setPlHistory.

## Remarques

- Types d'entrée utilisés par les totaux : 'insuranceRepairClaim', 'privateRepair', 'insuranceRenewed', 'insuranceChanged'.
- getHistoryTotalDetails (interne) incrémente totalCount une fois par effet de type 'money' (et non une fois par entrée) : une entrée avec plusieurs effets d'argent compte plusieurs fois, une entrée sans effet d'argent ne compte pas.
- Le total d'argent utilise la valeur absolue de changedBy.
- getTotalInsuranceRepairDeductiblesPaid lit entry.other.deductible et getDamageCostCoveredByInsurance lit entry.other.vehDamagePrice ; ces champs doivent être fournis dans other lors de l'ajout.
- buildPlHistory renvoie une copie triée de la plus récente à la plus ancienne et ajoute un champ date formaté os.date('%c').

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_insurance_history.addToPlHistory(data)` | Ajoute une entrée à l'historique avec l'heure courante (os.time()). | 10 |
| `career_modules_insurance_history.buildPlHistory()` | Construit la liste d'historique pour l'UI : copie profonde triée du plus récent au plus ancien, avec date lisible. | 23 |
| `career_modules_insurance_history.getDamageCostCoveredByInsurance()` | Somme des coûts de dégâts (vehDamagePrice) des réclamations de réparation, c'est-à-dire la valeur des dommages couverts. | 75 |
| `career_modules_insurance_history.getInsuranceClaimsCount()` | Nombre de réparations prises en charge par une assurance (effets d'argent des entrées 'insuranceRepairClaim'). | 85 |
| `career_modules_insurance_history.getNonInsuranceRepairsCount()` | Nombre de réparations payées sans assurance (entrées 'privateRepair'). | 89 |
| `career_modules_insurance_history.getPlHistory()` | Renvoie la table d'historique brute (pour la sauvegarde). | 53 |
| `career_modules_insurance_history.getTotalInsuranceRepairDeductiblesPaid()` | Somme des franchises payées lors des réclamations de réparation. | 65 |
| `career_modules_insurance_history.getTotalPremiumPaid()` | Total des primes payées : renouvellements ('insuranceRenewed') plus changements de contrat ('insuranceChanged'). | 93 |
| `career_modules_insurance_history.getTotalPrivateRepairsPaid()` | Total dépensé en réparations sans assurance. | 99 |
| `career_modules_insurance_history.initPlHistory()` | Vide l'historique (nouvelle partie). *(interne)* | 61 |
| `career_modules_insurance_history.setPlHistory(history)` | Remplace l'historique (chargement de sauvegarde) ; une valeur nil le vide. | 57 |

### Détail des paramètres

#### `career_modules_insurance_history.addToPlHistory(data)`

Ajoute une entrée à l'historique avec l'heure courante (os.time()).

- `data` (*table*) : Table avec type, title, effects, concernedInsuranceName, overrideText, other.

#### `career_modules_insurance_history.buildPlHistory()`

Construit la liste d'historique pour l'UI : copie profonde triée du plus récent au plus ancien, avec date lisible.

- **renvoie** : table Liste d'entrées avec champ date supplémentaire.

#### `career_modules_insurance_history.getDamageCostCoveredByInsurance()`

Somme des coûts de dégâts (vehDamagePrice) des réclamations de réparation, c'est-à-dire la valeur des dommages couverts.

- **renvoie** : number Montant.

#### `career_modules_insurance_history.getInsuranceClaimsCount()`

Nombre de réparations prises en charge par une assurance (effets d'argent des entrées 'insuranceRepairClaim').

- **renvoie** : integer Nombre de réclamations.

#### `career_modules_insurance_history.getNonInsuranceRepairsCount()`

Nombre de réparations payées sans assurance (entrées 'privateRepair').

- **renvoie** : integer Nombre de réparations privées.

#### `career_modules_insurance_history.getPlHistory()`

Renvoie la table d'historique brute (pour la sauvegarde).

- **renvoie** : table Liste d'entrées.

#### `career_modules_insurance_history.getTotalInsuranceRepairDeductiblesPaid()`

Somme des franchises payées lors des réclamations de réparation.

- **renvoie** : number Montant.

#### `career_modules_insurance_history.getTotalPremiumPaid()`

Total des primes payées : renouvellements ('insuranceRenewed') plus changements de contrat ('insuranceChanged').

- **renvoie** : number Montant en argent du jeu.

#### `career_modules_insurance_history.getTotalPrivateRepairsPaid()`

Total dépensé en réparations sans assurance.

- **renvoie** : number Montant.

#### `career_modules_insurance_history.setPlHistory(history)`

Remplace l'historique (chargement de sauvegarde) ; une valeur nil le vide.

- `history` (*table|nil*) : Historique sauvegardé.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/insurance/history.lua`.*
