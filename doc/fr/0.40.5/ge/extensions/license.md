# `license`

*Fichier : `lua/ge/extensions/license.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `license` : `extensions.load("license")`, puis la globale `license`

Interroge l'état des licences BeamNG.tech (recherche) et commerciale via les objets C++ ResearchVerifier et CommercialVerifier, avec un cache par session. Sert à filtrer les fichiers d'input maps et d'actions réservés à BeamNG.tech (chemins contenant « _beamng.tech ») quand la licence n'est pas valide. Pour un moddeur, c'est surtout utile pour savoir si le jeu tourne en licence tech/commerciale.

## Remarques

- Les résultats sont mis en cache dans stateCache à la première lecture et jamais rafraîchis : un changement de licence en cours de session n'est pas vu.
- Si ResearchVerifier (ou CommercialVerifier) n'existe pas, isValid (resp. isCommercial) renvoie false sans mettre en cache.
- Le filtre de chemins est une simple recherche de la sous-chaîne « _beamng.tech » dans le chemin.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `license.isAllowedActionsPath(path)` | Même règle pour les fichiers d'actions. | 40 |
| `license.isAllowedInputmapPath(path)` | Dit s'il est pertinent de charger cette input map : toujours vrai avec une licence tech valide, sinon faux si le chemin contient « _beamng.tech ». | 34 |
| `license.isCommercial()` | Indique si la licence est commerciale (CommercialVerifier.isCommercialLicense). | 19 |
| `license.isValid()` | Indique si la licence BeamNG.tech est vérifiée (ResearchVerifier.isTechLicenseVerified). | 9 |
| `license.requestState()` | Envoie l'état de licence tech à l'interface via guihooks (TechLicenseState). | 29 |

### Détail des paramètres

#### `license.isAllowedActionsPath(path)`

Même règle pour les fichiers d'actions.

- `path` (*string*) : Chemin du fichier d'actions.
- **renvoie** : boolean 

#### `license.isAllowedInputmapPath(path)`

Dit s'il est pertinent de charger cette input map : toujours vrai avec une licence tech valide, sinon faux si le chemin contient « _beamng.tech ».

- `path` (*string*) : Chemin du fichier d'input map.
- **renvoie** : boolean 

#### `license.isCommercial()`

Indique si la licence est commerciale (CommercialVerifier.isCommercialLicense).

- **renvoie** : boolean false sans vérificateur ou sans licence.

#### `license.isValid()`

Indique si la licence BeamNG.tech est vérifiée (ResearchVerifier.isTechLicenseVerified).

- **renvoie** : boolean false sans vérificateur ou sans licence.

**Évènements UI (guihooks.trigger) :** `TechLicenseState`

## Appels vers le moteur (C++)

- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/license.lua`.*
