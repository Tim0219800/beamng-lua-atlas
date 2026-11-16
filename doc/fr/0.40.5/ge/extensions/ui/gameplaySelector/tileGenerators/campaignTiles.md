# `ui_gameplaySelector_tileGenerators_campaignTiles`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/campaignTiles.lua` · VM : Game Engine (GE) · 177 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_tileGenerators_campaignTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_campaignTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_campaignTiles`

Générateur de tuiles du sélecteur de gameplay pour les campagnes (système hérité). Il ajoute une tuile par campagne renvoyée par campaign_campaignsLoader.getList() et construit le panneau de détails avec un bouton « Start Campaign ». Il est appelé via les hooks onGameplaySelectorGetTiles et onGameplaySelectorGetDetails.

## Remarques

- Les tuiles de campagne ne sont ajoutées que pour le backend gameplaySelector ; la tuile « More Campaigns... » est ajoutée pour tous les backends (validBackends vide).
- Les détails affichent toujours la mention « Campaign system is outdated. » : le système est marqué comme hérité (isLegacy).
- Bug probable : order = -tonumber(campaign.date) or 0 s'évalue comme (-tonumber(date)) or 0, donc le « or 0 » ne protège pas d'une date nil (erreur arithmétique sur nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)` | Hook appelé quand l'utilisateur ouvre les détails d'une tuile. Si itemDetails.campaignSourceFile existe, charge la campagne et ajoute dans details un bloc avec titre, description, aperçu, favori, spécifications (difficulté, auteurs, date, joueurs, nombre de scénarios), étiquettes (officiel, auxiliaire, mod) et un bouton « Start Campaign ». Ce bouton enregistre l'élément comme récent, navigue vers « play » et lance campaign_campaignsLoader.start. *(interne)* *(hook)* | 122 |
| `ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetTiles(items, backend)` | Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector, ajoute une tuile par campagne (nom traduit, aperçu, niveau, icônes beamNG ou bug, clé campaign_<sourceFile>). Ajoute dans tous les cas une tuile « More Campaigns... ». *(interne)* *(hook)* | 7 |

### Détail des paramètres

#### `ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)`

Hook appelé quand l'utilisateur ouvre les détails d'une tuile. Si itemDetails.campaignSourceFile existe, charge la campagne et ajoute dans details un bloc avec titre, description, aperçu, favori, spécifications (difficulté, auteurs, date, joueurs, nombre de scénarios), étiquettes (officiel, auxiliaire, mod) et un bouton « Start Campaign ». Ce bouton enregistre l'élément comme récent, navigue vers « play » et lance campaign_campaignsLoader.start.

- `itemDetails` (*table*) : Données showDetails de la tuile (campaignSourceFile, key).
- `details` (*table*) : Liste de blocs de détails à compléter.
- `buttonInstance` (*table*) : Objet fournissant addButton pour créer les boutons.
- `backend` (*table*) : Backend offrant isFavourite et trackRecent.

#### `ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetTiles(items, backend)`

Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector, ajoute une tuile par campagne (nom traduit, aperçu, niveau, icônes beamNG ou bug, clé campaign_<sourceFile>). Ajoute dans tous les cas une tuile « More Campaigns... ».

- `items` (*table*) : Liste de tuiles à compléter (modifiée en place).
- `backend` (*table*) : Backend appelant ; backendName doit valoir « gameplaySelector » pour les tuiles de campagne.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/campaignTiles.lua`.*
