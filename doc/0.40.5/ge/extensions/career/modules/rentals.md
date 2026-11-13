# `career_modules_rentals`

*Fichier : `lua/ge/extensions/career/modules/rentals.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_rentals` : `extensions.load("career_modules_rentals")`, puis la globale `career_modules_rentals`

Ébauche non terminée d'un système de location de véhicules en carrière : la plupart des fonctions ne contiennent que des commentaires, et les hooks (onExtensionLoaded, onSaveCurrentProfile, onUpdate) sont commentés. Seule isRenting est exportée.

## Remarques

- Code inactif : currRentalVeh n'est jamais assigné (beginRenting déclare une variable locale du même nom et utilise shopId non défini), donc isRenting renvoie toujours false.
- playAbandonTimer et trackAbandonVeh utilisent currAbandonTime alors que la variable déclarée s'appelle currAbandonTimer : bug si le code était activé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_rentals.isRenting()` | API UI : indique si un véhicule de location est en cours (currRentalVeh non nil). | 42 |

### Détail des paramètres

#### `career_modules_rentals.isRenting()`

API UI : indique si un véhicule de location est en cours (currRentalVeh non nil).

- **renvoie** : boolean Toujours false en l'état.

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/rentals.lua`.*
