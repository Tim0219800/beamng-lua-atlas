# `freeroam_organizations`

*Fichier : `lua/ge/extensions/freeroam/organizations.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_organizations` : `extensions.load("freeroam_organizations")`, puis la globale `freeroam_organizations`

Registre des organisations (factions du mode carrière avec réputation), chargé depuis les fichiers `gameplay/organizations/*.organizations.json` et enrichi avec les données de réputation du carrière. Fournit aussi les données prêtes pour l'UI. Global : freeroam_organizations.

## Remarques

- Dépend des modules carrière (career_modules_reputation, career_career, career_modules_delivery_generator) : getOrganizations appelle addAdditionalInfoToOrg qui utilise career_modules_reputation sans test de nil, donc hors carrière ces globales doivent exister.
- Chaque organisation reçoit : id (clé du fichier), visible, attributeKey (= id .. 'Reputation') et les champs de réputation.
- getOrganizationIdOrderAndIcon renvoie toujours 7000 et 'peopleOutline' (ordre réservé 7000-8000).
- getUIDataForOrg: deepcopy puis max/min/label de réputation, offersDeliveries, hasUnlocks, associatedFacilities, et pour chaque niveau de réputation label et level (= indice - 2). Il déréférence organization.reputation sans test : une org inconnue renvoie nil (log d'erreur dans getOrganization).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_organizations.getOrganization(id)` | Renvoie une organisation par id (en rafraîchissant sa réputation) ou nil avec un log d'erreur. | 36 |
| `freeroam_organizations.getOrganizationIdOrderAndIcon(id)` | Ordre d'affichage et icône : constants (7000, 'peopleOutline'). | 47 |
| `freeroam_organizations.getOrganizations()` | Charge (une fois, mise en cache) toutes les organisations. | 15 |
| `freeroam_organizations.getUIData()` | Liste des organisations au format UI (getUIDataForOrg), triées par nom traduit. | 87 |
| `freeroam_organizations.getUIDataForOrg(orgId)` | Copie enrichie d'une organisation pour l'UI. | 70 |

### Détail des paramètres

#### `freeroam_organizations.getOrganization(id)`

Renvoie une organisation par id (en rafraîchissant sa réputation) ou nil avec un log d'erreur.

- `id` (*string*) : Id de l'organisation.
- **renvoie** : table|nil Organisation.

#### `freeroam_organizations.getOrganizationIdOrderAndIcon(id)`

Ordre d'affichage et icône : constants (7000, 'peopleOutline').

- `id` (*string*) : Non utilisé.
- **renvoie** : integer 7000
- **renvoie** : string 'peopleOutline'

#### `freeroam_organizations.getOrganizations()`

Charge (une fois, mise en cache) toutes les organisations.

- **renvoie** : table<string, table> Organisations indexées par id.

#### `freeroam_organizations.getUIData()`

Liste des organisations au format UI (getUIDataForOrg), triées par nom traduit.

- **renvoie** : table[] Données UI.

#### `freeroam_organizations.getUIDataForOrg(orgId)`

Copie enrichie d'une organisation pour l'UI.

- `orgId` (*string*) : Id de l'organisation.
- **renvoie** : table|nil Données UI.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/organizations.lua`.*
