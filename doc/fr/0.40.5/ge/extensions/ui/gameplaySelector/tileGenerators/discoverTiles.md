# `ui_gameplaySelector_tileGenerators_discoverTiles`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua` · VM : Game Engine (GE) · 206 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_tileGenerators_discoverTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_discoverTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_discoverTiles`

Générateur de tuiles du sélecteur de gameplay pour les « expériences de démarrage rapide » (système quickStartExperiences). Il lit les pages et cartes de gameplay_discover.getDiscoverPages(), crée une tuile par page, regroupe les cartes d'une page en « Experiences » et « Challenges » (missions), et fournit les détails et le bouton de lancement d'une carte.

## Remarques

- Les pages avec showMultiseatControllers ou sans carte ne produisent pas de tuile.
- Une carte de type mission avec missionId reçoit la clé mission_<id> et un showDetails.missionId (détails gérés par missionTiles) ; les autres reçoivent discover_<discoverId>.
- Le bouton de lancement navigue vers card.preStartRoute si elle existe, sinon appelle gameplay_discover.startDiscover(discoverId) avec écran de chargement.

**Dépendances (chargées avant) :** `gameplay_discover`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_tileGenerators_discoverTiles.getPageGroups(pageKey)` | Renvoie les groupes de tuiles d'une page découverte : un groupe « discoverExperiences » (cartes non mission) et un groupe « discoverChallenges » (cartes mission), chacun seulement s'il n'est pas vide. Renvoie une table vide si la page est introuvable. | 106 |
| `ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)` | Hook appelé à l'ouverture des détails. Si itemDetails.discoverId désigne une carte connue, ajoute dans details un bloc (titre, description, aperçu, favori, étiquettes) avec un bouton « play » qui enregistre l'élément comme récent puis lance la carte. *(interne)* *(hook)* | 164 |
| `ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetTiles(items, backend)` | Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector uniquement, ajoute une tuile de type discoverPage par page contenant au moins une carte, avec gotoPath, nombre de sous-éléments et icônes officiel ou mod. *(interne)* *(hook)* | 142 |

### Détail des paramètres

#### `ui_gameplaySelector_tileGenerators_discoverTiles.getPageGroups(pageKey)`

Renvoie les groupes de tuiles d'une page découverte : un groupe « discoverExperiences » (cartes non mission) et un groupe « discoverChallenges » (cartes mission), chacun seulement s'il n'est pas vide. Renvoie une table vide si la page est introuvable.

- `pageKey` (*string*) : Clé de la page (page.folder, sinon page.title, sinon son index).
- **renvoie** : table[] Liste de groupes {key, label, tiles}.

#### `ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)`

Hook appelé à l'ouverture des détails. Si itemDetails.discoverId désigne une carte connue, ajoute dans details un bloc (titre, description, aperçu, favori, étiquettes) avec un bouton « play » qui enregistre l'élément comme récent puis lance la carte.

- `itemDetails` (*table*) : Données showDetails (discoverId, key).
- `details` (*table*) : Liste de blocs de détails à compléter.
- `buttonInstance` (*table*) : Objet fournissant addButton.
- `backend` (*table*) : Backend offrant isFavourite et trackRecent.

#### `ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetTiles(items, backend)`

Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector uniquement, ajoute une tuile de type discoverPage par page contenant au moins une carte, avec gotoPath, nombre de sous-éléments et icônes officiel ou mod.

- `items` (*table*) : Liste de tuiles à compléter.
- `backend` (*table*) : Backend appelant.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : gameplay_discover. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua`.*
