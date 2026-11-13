# `trackbuilder_trackBuilder`

*Fichier : `lua/ge/extensions/trackbuilder/trackBuilder.lua` · VM : Game Engine (GE) · 3654 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `trackbuilder_trackBuilder` : `extensions.load("trackbuilder_trackBuilder")`, puis la globale `trackbuilder_trackBuilder`

Interface ImGui de l'éditeur de circuits (Track Builder). Elle pilote le moteur de spline `util_trackBuilder_splineTrack` (chargé via `extensions['util_trackBuilder_splineTrack']`) : ajout et suppression de pièces, modificateurs (largeur, inclinaison, etc.), matériaux, bordures, sous-circuits, sauvegarde avec capture d'écran, mode conduite et modes de peinture (Select, Paint, ChangeMesh, Merge). Un moddeur s'en sert surtout pour ouvrir ou fermer l'éditeur (enter, exit, toggleTrackBuilder) et savoir s'il est actif (isActive). L'éditeur s'ouvre par la route UI `trackBuilder`, par défaut sur le niveau `glow_city`.

## Exemple

```lua
-- ouvrir le Track Builder sur glow_city (charge le niveau si besoin)
trackbuilder_trackBuilder.enter('glow_city')
print(trackbuilder_trackBuilder.isActive())
trackbuilder_trackBuilder.exit()
```

## Remarques

- Le fichier fait plus de 3600 lignes, surtout du code d'interface ImGui (fenêtres, barre d'outils, matériaux, sauvegarde) ; seules les fonctions de `M` ci-dessous sont l'API publique.
- La table `tbFunctions` (navigate, refreshPieceInfo, pieceDeleted, pieceUpdated, modifierChange, modifierRemove, modifierShift, drive, unDrive, refreshTrackPositionRotation, switchSubTrack, mergeMultiTrack) est locale au fichier et n'est pas exportée dans M : ce sont des fonctions internes appelées par l'interface. La page automatique la présente comme classe, mais ce n'est pas un objet instanciable.
- BUG : dans toggleTrackBuilder, la variable `active` est lue (`not freeCam and active`) avant sa déclaration `local active = open[0]` ; elle vaut donc nil (variable globale) et le passage en caméra de jeu de cette ligne n'a jamais lieu.
- BUG mineur : une variable globale `i` est affectée quelque part dans le fichier (relevé par l'analyse automatique).
- enter charge le niveau demandé via `freeroam_freeroam.startFreeroam` si nécessaire et ouvre l'éditeur au hook onClientStartMission ; pendant ce chargement `pendingEnter` empêche onClientEndMission de fermer l'éditeur. Son callback appelle `trackbuilder_trackBuilder.showTrackBuilder()` par la globale.
- La fenêtre n'est dessinée dans onUpdate que si l'éditeur est initialisé ; pendant une capture d'écran de sauvegarde (hiddenForScreenshotTimer) rien n'est affiché.
- En mode conduite (tbFunctions.drive), le code reset le véhicule 0, passe en caméra de jeu et envoie `ShowApps` à l'UI ; unDrive repasse en caméra libre.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `trackbuilder_trackBuilder.enter(levelName, forceLoad)` | Ouvre le Track Builder. Si le niveau demandé n'est pas déjà chargé (ou si forceLoad est vrai), le charge en freeroam puis ouvre l'éditeur ; sinon l'ouvre directement. Un niveau introuvable est loggé en erreur et rien n'est fait. | 3577 |
| `trackbuilder_trackBuilder.exit()` | Ferme le Track Builder s'il est actif, sans naviguer lui-même (le routeur garde la navigation), et libère la route de gameplay. | 3599 |
| `trackbuilder_trackBuilder.exitToMainMenu()` | Annule une entrée en attente, ferme l'éditeur s'il est actif, puis appelle `returnToMainMenu()`. | 3609 |
| `trackbuilder_trackBuilder.hideTrackBuilder()` | Ferme la fenêtre de l'éditeur, restaure le style ImGui BeamNG et réinitialise l'état. Si la fermeture n'est pas pilotée par le routeur, rend la route de gameplay en naviguant vers `play`. Sans effet si non initialisé. | 3530 |
| `trackbuilder_trackBuilder.isActive()` | Indique si l'éditeur est initialisé et sa fenêtre ouverte. | 3573 |
| `trackbuilder_trackBuilder.onClientEndMission()` | Hook appelé à la fin d'une mission/niveau. Ferme l'éditeur sauf si une entrée est en attente de chargement de niveau. *(interne)* *(hook)* | 3631 |
| `trackbuilder_trackBuilder.onRouteEnter(context, toRoute, fromRoute, data)` | Hook appelé par le routeur UI à l'entrée de la route `trackBuilder`. Réserve la route de gameplay et appelle enter avec `params.level` ("glow_city" par défaut) et `params.forceLoad`. *(interne)* *(hook)* | 3617 |
| `trackbuilder_trackBuilder.onRouteLeave(context, toRoute, fromRoute, data)` | Hook appelé par le routeur UI quand on quitte la route : ferme l'éditeur s'il est actif. *(interne)* *(hook)* | 3625 |
| `trackbuilder_trackBuilder.onUpdate()` | Hook appelé à chaque frame. Affiche la fenêtre principale ou la barre du mode conduite, ou rien pendant la prise de capture d'écran de sauvegarde. *(interne)* *(hook)* | 2894 |
| `trackbuilder_trackBuilder.onWindowResized(size)` | Hook appelé quand la fenêtre du jeu est redimensionnée. Mémorise la taille d'affichage utilisée par le style. *(interne)* *(hook)* | 3343 |
| `trackbuilder_trackBuilder.showTrackBuilder()` | Affiche l'éditeur : passe en caméra de jeu si la caméra n'est pas libre, puis ouvre la fenêtre. | 3521 |
| `trackbuilder_trackBuilder.showTrackBuilderWindow(show)` | Ouvre ou ferme la fenêtre ImGui. À l'ouverture : initialise, récupère le moteur de spline et applique le style ; à la fermeture : désélectionne, masque les marqueurs, et supprime le circuit s'il a 2 pièces ou moins (hors glow_city). Émet toujours le hook `onTrackBuilderWindowToggled(open)`. | 3477 |
| `trackbuilder_trackBuilder.toggleTrackBuilder()` | Ouvre l'éditeur (en réglant la route de gameplay et en naviguant vers `trackBuilder`) ou le ferme s'il est ouvert. | 3552 |

### Détail des paramètres

#### `trackbuilder_trackBuilder.enter(levelName, forceLoad)`

Ouvre le Track Builder. Si le niveau demandé n'est pas déjà chargé (ou si forceLoad est vrai), le charge en freeroam puis ouvre l'éditeur ; sinon l'ouvre directement. Un niveau introuvable est loggé en erreur et rien n'est fait.

- `levelName` (*string|nil*) : Nom du niveau (par exemple "glow_city").
- `forceLoad` (*boolean|nil*) : Force le rechargement du niveau même s'il est déjà chargé.

#### `trackbuilder_trackBuilder.isActive()`

Indique si l'éditeur est initialisé et sa fenêtre ouverte.

- **renvoie** : boolean true si actif.

#### `trackbuilder_trackBuilder.onRouteEnter(context, toRoute, fromRoute, data)`

Hook appelé par le routeur UI à l'entrée de la route `trackBuilder`. Réserve la route de gameplay et appelle enter avec `params.level` ("glow_city" par défaut) et `params.forceLoad`.

- `context` (*any*) : Contexte de la route (non utilisé).
- `toRoute` (*table*) : Route d'arrivée ; son champ `params` est lu.
- `fromRoute` (*any*) : Route de départ (non utilisé).
- `data` (*any*) : Données de route (non utilisées).

#### `trackbuilder_trackBuilder.onRouteLeave(context, toRoute, fromRoute, data)`

Hook appelé par le routeur UI quand on quitte la route : ferme l'éditeur s'il est actif.

- `context` (*any*) : Contexte de la route (non utilisé).
- `toRoute` (*any*) : Route d'arrivée (non utilisé).
- `fromRoute` (*any*) : Route de départ (non utilisé).
- `data` (*any*) : Données de route (non utilisées).

#### `trackbuilder_trackBuilder.onWindowResized(size)`

Hook appelé quand la fenêtre du jeu est redimensionnée. Mémorise la taille d'affichage utilisée par le style.

- `size` (*table*) : Taille de l'écran avec champs `x` et `y`.

#### `trackbuilder_trackBuilder.showTrackBuilderWindow(show)`

Ouvre ou ferme la fenêtre ImGui. À l'ouverture : initialise, récupère le moteur de spline et applique le style ; à la fermeture : désélectionne, masque les marqueurs, et supprime le circuit s'il a 2 pièces ou moins (hors glow_city). Émet toujours le hook `onTrackBuilderWindowToggled(open)`.

- `show` (*boolean*) : true pour ouvrir, false pour fermer.

## Classe `tbFunctions`

Table locale de fonctions internes de l'interface (non exportée). Elles modifient le circuit via le moteur de spline puis rafraîchissent les valeurs affichées ; `currentIndex` désigne la pièce sélectionnée.

| Méthode | Description | Ligne |
|---|---|---|
| `tbFunctions.drive(index)` | Démarre le mode conduite : circuit en haute qualité, marqueurs masqués, reset du véhicule 0 et placement sur la pièce donnée, caméra de jeu. | 3102 |
| `tbFunctions.mergeMultiTrack(segments)` | Fusionne des segments de circuit via le moteur de spline. | 3148 |
| `tbFunctions.modifierChange(field)` | Applique la valeur d'un modificateur à la pièce courante et reconstruit le circuit. | 3070 |
| `tbFunctions.modifierRemove(field)` | Retire un modificateur de la pièce courante. | 3078 |
| `tbFunctions.modifierShift(name, offset)` | Déplace un modificateur sur la pièce précédente ou suivante. | 3085 |
| `tbFunctions.navigate(off)` | Déplace le curseur : 1 suivant, -1 précédent (avec bouclage), 'first' ou 'last'. Recentre le marqueur et relit les infos de la pièce. | 2966 |
| `tbFunctions.pieceDeleted()` | Supprime la pièce courante (si l'indice est supérieur à 2), reconstruit le circuit et recule d'une pièce. | 3020 |
| `tbFunctions.pieceUpdated(replace)` | Ajoute ou remplace une pièce avec les paramètres de l'interface. Ctrl remplace, Shift insère après la pièce courante, sans touche ajoute à la fin. Replace le curseur au début si le circuit vient de se fermer. | 3031 |
| `tbFunctions.refreshPieceInfo()` | Relit les paramètres de la pièce courante et les valeurs des modificateurs dans l'interface. | 2983 |
| `tbFunctions.refreshTrackPositionRotation()` | Relit la position et le cap du circuit (cap converti en degrés) dans l'interface. | 3127 |
| `tbFunctions.switchSubTrack(index)` | Passe à un autre sous-circuit et sélectionne sa dernière pièce. | 3135 |
| `tbFunctions.unDrive()` | Termine le mode conduite : caméra libre, marqueurs réaffichés, mode Select. | 3117 |

**Globales affectées :** `i`

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTrackBuilderWindowToggled` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `ShowApps`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `resetVehicle`
- `core_environment.` `getFogDensity`, `getTimeOfDay`, `setFogDensity`, `setTimeOfDay`
- `debugDrawer:` `drawLine`, `drawSphere`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/trackbuilder/trackBuilder.lua`.*
