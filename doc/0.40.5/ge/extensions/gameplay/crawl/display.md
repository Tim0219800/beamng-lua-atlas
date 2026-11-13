# `gameplay_crawl_display`

*Fichier : `lua/ge/extensions/gameplay/crawl/display.lua` · VM : Game Engine (GE) · 249 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_display` : `extensions.load("gameplay_crawl_display")`, puis la globale `gameplay_crawl_display`

Affichage des messages à l'écran du mode crawl. Chaque fonction showXxxMessage envoie une notification traduite (clés ui.crawl.*) via ui_message, ou via guihooks.trigger('Message') ciblé sur le panneau d'un joueur en écran partagé (multiseat). Il gère les messages de pénalité, de point de passage, de fin, de disqualification et de DNF. Les catégories de pénalité ne sont affichées que si le crawler a des pénalités (gameplay_crawl_utils.hasPenalties).

## Remarques

- Un message vide ('') sert à effacer une catégorie ; clearMessage l'utilise.
- En écran partagé, un message avec crawlerId n'est envoyé qu'au joueur qui contrôle ce véhicule ; s'il n'est plus associé à un joueur, il est ignoré. Sans crawlerId, il est diffusé à tous les joueurs mémorisés ou connectés.
- showPointsMessage n'affiche rien si la session multijoueur est hôte (multiplayer_sessionManager.isSessionHost()).
- setCrawlUILayout est entièrement commenté : le changement de disposition d'UI ne fait rien.
- Les points de pénalité affichés proviennent de gameplay_crawl_utils.infractionPoints.
- onCrawlResultsShown et onExtensionLoaded sont des corps vides.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_display.clearDisqualifiedWaitingMessage(crawlerId)` | Efface le message d'attente de disqualification. | 188 |
| `gameplay_crawl_display.clearPointsMessage(crawlerId)` | Efface le message de points. | 156 |
| `gameplay_crawl_display.onCrawlComplete()` | Hook appelé à la fin d'un crawl : appelle setCrawlUILayout(false) (sans effet). *(interne)* *(hook)* | 133 |
| `gameplay_crawl_display.onCrawlResultsShown()` | Hook appelé à l'affichage des résultats : corps vide. *(interne)* *(hook)* | 137 |
| `gameplay_crawl_display.onCrawlStarted()` | Hook appelé au démarrage d'un crawl : journalise et appelle setCrawlUILayout (sans effet). *(interne)* *(hook)* | 128 |
| `gameplay_crawl_display.onExtensionLoaded()` | Hook appelé au chargement : corps vide. *(interne)* *(hook)* | 141 |
| `gameplay_crawl_display.onExtensionUnloaded()` | Hook appelé au déchargement : oublie les joueurs mémorisés pour les messages. *(interne)* *(hook)* | 145 |
| `gameplay_crawl_display.showBonusCheckpointMessage(penaltyPoints, crawlerId)` | Affiche le message de point de passage bonus. | 212 |
| `gameplay_crawl_display.showBoundaryViolationMessage(crawlerId)` | Affiche le message de sortie de zone avec la pénalité boundaryViolation. | 208 |
| `gameplay_crawl_display.showCrawlCompletedMessage(time, points, crawlerId)` | Affiche « crawl terminé », puis (10 s) le temps et les points si le crawler a des pénalités. | 160 |
| `gameplay_crawl_display.showDNFMessage(crawlerId)` | Affiche le message d'abandon (DNF). | 220 |
| `gameplay_crawl_display.showDisqualifiedMessage(eventData)` | Affiche le message de disqualification. | 179 |
| `gameplay_crawl_display.showDisqualifiedWaitingMessage(crawlerId)` | Affiche le message d'attente après disqualification (600 s). | 184 |
| `gameplay_crawl_display.showDrivingBackwardsMessage(crawlerId)` | Affiche l'avertissement de conduite en marche arrière avec la pénalité drivingBackwards. | 192 |
| `gameplay_crawl_display.showGateClearedMessage(penaltyPoints, crawlerId)` | Affiche le message de porte franchie proprement. | 216 |
| `gameplay_crawl_display.showGateReachedMessage(crawlerId)` | Affiche « porte atteinte » (ui.crawl.gateReached). | 171 |
| `gameplay_crawl_display.showPointsMessage(points, crawlerId)` | Affiche le total de points de pénalité (durée 600 s, catégorie 'points'), sauf si l'on est hôte d'une session multijoueur. | 150 |
| `gameplay_crawl_display.showSkippedCheckpointsMessage(skippedCount, crawlerId)` | Affiche le nombre de points de passage sautés et la pénalité (skippedCount × infractionPoints.skippedCheckpoint). | 167 |
| `gameplay_crawl_display.showStartedCrawlMessage(crawlerId)` | Affiche le message de démarrage du crawl. | 175 |
| `gameplay_crawl_display.showVehicleFlippedUprightMessage(crawlerId)` | Affiche le message de véhicule remis sur les roues avec la pénalité vehicleFlippedUpright. | 196 |
| `gameplay_crawl_display.showVehicleRecoveredMessage(crawlerId)` | Affiche le message de récupération du véhicule ; la pénalité affichée est infractionPoints.vehicleReset (pas de clé vehicleRecovered). | 204 |
| `gameplay_crawl_display.showVehicleResetMessage(crawlerId)` | Affiche le message de réinitialisation du véhicule avec la pénalité vehicleReset. | 200 |

### Détail des paramètres

#### `gameplay_crawl_display.clearDisqualifiedWaitingMessage(crawlerId)`

Efface le message d'attente de disqualification.

- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.clearPointsMessage(crawlerId)`

Efface le message de points.

- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showBonusCheckpointMessage(penaltyPoints, crawlerId)`

Affiche le message de point de passage bonus.

- `penaltyPoints` (*number*) : Points (bonus) à afficher.
- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showBoundaryViolationMessage(crawlerId)`

Affiche le message de sortie de zone avec la pénalité boundaryViolation.

- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showCrawlCompletedMessage(time, points, crawlerId)`

Affiche « crawl terminé », puis (10 s) le temps et les points si le crawler a des pénalités.

- `time` (*number*) : Temps en secondes (affiché avec 3 décimales).
- `points` (*number*) : Points de pénalité.
- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showDNFMessage(crawlerId)`

Affiche le message d'abandon (DNF).

- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showDisqualifiedMessage(eventData)`

Affiche le message de disqualification.

- `eventData` (*table|integer*) : Soit une table avec crawlerId, soit directement l'id du véhicule.

#### `gameplay_crawl_display.showDisqualifiedWaitingMessage(crawlerId)`

Affiche le message d'attente après disqualification (600 s).

- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showDrivingBackwardsMessage(crawlerId)`

Affiche l'avertissement de conduite en marche arrière avec la pénalité drivingBackwards.

- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showGateClearedMessage(penaltyPoints, crawlerId)`

Affiche le message de porte franchie proprement.

- `penaltyPoints` (*number*) : Points à afficher.
- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showGateReachedMessage(crawlerId)`

Affiche « porte atteinte » (ui.crawl.gateReached).

- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showPointsMessage(points, crawlerId)`

Affiche le total de points de pénalité (durée 600 s, catégorie 'points'), sauf si l'on est hôte d'une session multijoueur.

- `points` (*number*) : Points de pénalité.
- `crawlerId` (*integer|nil*) : Id du véhicule concerné.

#### `gameplay_crawl_display.showSkippedCheckpointsMessage(skippedCount, crawlerId)`

Affiche le nombre de points de passage sautés et la pénalité (skippedCount × infractionPoints.skippedCheckpoint).

- `skippedCount` (*integer*) : Nombre de points de passage sautés.
- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showStartedCrawlMessage(crawlerId)`

Affiche le message de démarrage du crawl.

- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showVehicleFlippedUprightMessage(crawlerId)`

Affiche le message de véhicule remis sur les roues avec la pénalité vehicleFlippedUpright.

- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showVehicleRecoveredMessage(crawlerId)`

Affiche le message de récupération du véhicule ; la pénalité affichée est infractionPoints.vehicleReset (pas de clé vehicleRecovered).

- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_display.showVehicleResetMessage(crawlerId)`

Affiche le message de réinitialisation du véhicule avec la pénalité vehicleReset.

- `crawlerId` (*integer|nil*) : Id du véhicule.

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/display.lua`.*
