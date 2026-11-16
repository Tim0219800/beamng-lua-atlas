# `campaign_comics`

*Fichier : `lua/ge/extensions/campaign/comics.lua` · VM : Game Engine (GE) · 79 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `campaign_comics` : `extensions.load("campaign_comics")`, puis la globale `campaign_comics`

Affiche une bande dessinée (suite de planches) dans l'interface de la campagne. playComic construit la liste des planches à partir de comicData puis ouvre l'écran UI « campaign.comic » ; quand l'animation Spine est terminée, le callback fourni est appelé. Le canal audio GUI est joué pendant l'affichage.

## Remarques

- comicData : {path = dossier, order = liste, backgroundSound = ...}. Chaque entrée de order est soit une chaîne (nom de planche), soit une table {comic = nom, sound = ...}. Chaque planche devient « path/nom/ ».
- Le code qui coupait les autres canaux audio est commenté (« buggy »), mais reset() restaure encore lastVolumes s'il est renseigné ; en pratique lastVolumes reste vide.
- Si comicData est nil, playComic revient sans rien afficher et sans appeler le callback.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `campaign_comics.onScenarioChange(sc)` | Hook de changement de scénario : si sc est nil ou si son état est « pre-start », restaure les volumes audio mémorisés. *(interne)* *(hook)* | 68 |
| `campaign_comics.onSpineAnimationFinished()` | Hook appelé par l'interface à la fin de l'animation Spine : exécute le callback mémorisé (une seule fois), restaure les volumes et arrête le canal AudioChannelGui (arrêt avec paramètre 1). *(interne)* *(hook)* | 56 |
| `campaign_comics.playComic(comicData, comicFinishedCallback)` | Prépare les planches, lance le canal audio AudioChannelGui et navigue vers l'écran « campaign.comic » avec la liste des planches. Mémorise le callback de fin. | 18 |

### Détail des paramètres

#### `campaign_comics.onScenarioChange(sc)`

Hook de changement de scénario : si sc est nil ou si son état est « pre-start », restaure les volumes audio mémorisés.

- `sc` (*table|nil*) : Scénario courant ; son champ state est lu.

#### `campaign_comics.playComic(comicData, comicFinishedCallback)`

Prépare les planches, lance le canal audio AudioChannelGui et navigue vers l'écran « campaign.comic » avec la liste des planches. Mémorise le callback de fin.

- `comicData` (*table*) : Description de la BD : path, order, backgroundSound.
- `comicFinishedCallback` (*function|nil*) : Appelée une fois la BD terminée ; nop si absente.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/campaign/comics.lua`.*
