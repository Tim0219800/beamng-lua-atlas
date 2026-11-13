# `gameplay_crawl_freeroamMultiplayer`

*Fichier : `lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua` · VM : Game Engine (GE) · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_freeroamMultiplayer` : `extensions.load("gameplay_crawl_freeroamMultiplayer")`, puis la globale `gameplay_crawl_freeroamMultiplayer`

Intégration du crawl en freeroam multijoueur. Chargée par gameplay_crawl_general quand une session multijoueur commence (onMPSessionChanged), déchargée à sa fin. Elle affiche l'app « scoreboard » en haut à gauche et crée un tableau des scores (multiplayer_multiplayerScoreboard) avec une colonne de points de pénalité (tri croissant). Elle met à jour le score du joueur local, fait clignoter sa ligne en rouge (pénalité) ou vert (bonus) et indique la disqualification ou l'arrivée.

## Remarques

- Aucune fonction n'est appelable : le module n'exporte que des hooks d'évènements crawl.
- onCrawlPenaltyScoreChanged attend eventData.penaltyScore et eventData.oldPenaltyScore ; une hausse du score (pénalité) donne un clignotement rouge, une baisse un clignotement vert.
- Le tableau est identifié par trail.id (onCrawlStarted reçoit la table {trail = ...} des hooks de gameplay_crawl_general, donc trail.id est celui de cette table, pas du parcours : possible incohérence, car l'appelant passe {trail = trail}).
- L'app scoreboard n'est masquée qu'à la disqualification (endCrawlFreeroam) ; elle reste affichée à la fin normale.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_freeroamMultiplayer.onCrawlDisqualified()` | Hook appelé en cas de disqualification : statut « disqualified » dans le tableau et masquage de l'app scoreboard. *(interne)* *(hook)* | 38 |
| `gameplay_crawl_freeroamMultiplayer.onCrawlPenaltyScoreChanged(eventData)` | Hook appelé quand le score de pénalité change : envoie la nouvelle valeur au tableau et fait clignoter la ligne du joueur. *(interne)* *(hook)* | 22 |
| `gameplay_crawl_freeroamMultiplayer.onCrawlResultsShown(eventData)` | Hook appelé à l'affichage des résultats : pousse les points finaux et le statut « finishLine ». *(interne)* *(hook)* | 45 |
| `gameplay_crawl_freeroamMultiplayer.onCrawlStarted(trail)` | Hook appelé au démarrage d'un crawl : affiche l'app scoreboard, crée un tableau des scores et pousse le score initial 0. *(interne)* *(hook)* | 9 |

### Détail des paramètres

#### `gameplay_crawl_freeroamMultiplayer.onCrawlPenaltyScoreChanged(eventData)`

Hook appelé quand le score de pénalité change : envoie la nouvelle valeur au tableau et fait clignoter la ligne du joueur.

- `eventData` (*table*) : {penaltyScore, oldPenaltyScore}.

#### `gameplay_crawl_freeroamMultiplayer.onCrawlResultsShown(eventData)`

Hook appelé à l'affichage des résultats : pousse les points finaux et le statut « finishLine ».

- `eventData` (*table*) : {points, time}.

#### `gameplay_crawl_freeroamMultiplayer.onCrawlStarted(trail)`

Hook appelé au démarrage d'un crawl : affiche l'app scoreboard, crée un tableau des scores et pousse le score initial 0.

- `trail` (*table*) : Données de l'évènement ; son champ id sert d'identifiant du tableau (voir notes).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua`.*
