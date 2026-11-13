# `ui_apps_minimap_minimap`

*Fichier : `lua/ge/extensions/ui/apps/minimap/minimap.lua` · VM : Game Engine (GE) · 854 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_minimap_minimap` : `extensions.load("ui_apps_minimap_minimap")`, puis la globale `ui_apps_minimap_minimap`

Minimap affichée en ImGui (API marquée expérimentale par BeamNG). Elle dessine dans une texture les routes, le joueur, les autres véhicules, la boussole, les marqueurs de playmode, etc., en forme de cercle ou de rectangle (réglage `minimapMode`). Un autre module l'active avec setDrawTransform (position et taille relatives à l'écran, entre 0 et 1) et la masque avec hide. Chaque frame, elle émet le hook `onDrawOnMinimap(td)` pour que d'autres extensions dessinent par-dessus. Contient aussi une fenêtre de réglages de debug (profilage, mesure du garbage, options d'affichage).

## Remarques

- Le fichier annonce : « This API is experimental and may change ».
- `M.onUpdate` vaut nil au chargement : setDrawTransform le branche sur la fonction de dessin et appelle `extensions.hookUpdate("onUpdate")` ; hide le remet à nil. La minimap ne dessine donc rien tant que setDrawTransform n'a pas été appelé.
- setDrawTransform et setOcclusionTransform attendent des valeurs normalisées entre 0 et 1 ; sinon un avertissement est loggé (setDrawTransform masque alors la minimap, setOcclusionTransform ignore la zone).
- Le mode lu dans les réglages est forcé à "rect" s'il n'est ni "circle" ni "rect".
- BUG probable : minimap.lua utilise `ui_apps_sdfTopomap` (lignes 311-312 et 605) alors que le module de topographie de 0.40.5 s'appelle `ui_apps_minimap_topomap` ; ce nom n'est défini nulle part, donc les courbes de niveau ne sont pas dessinées.
- Réglages utilisés : minimapMode, minimapOrientation ("rotateWithCamera"), minimapDrawGrid ("always"), minimapLookahead (disabled/low/medium/high).

**Dépendances (chargées avant) :** `ui_apps_minimap_topomap`, `ui_apps_minimap_additionalInfo`, `ui_apps_minimap_route`, `ui_apps_minimap_utils`, `ui_apps_minimap_roads`, `ui_apps_minimap_vehicles`, `gameplay_playmodeMarkers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_minimap_minimap.drawDebugOverlay()` | Dessine des repères de debug (coins, marges) et affiche les tailles dans ImGui. *(interne)* | 720 |
| `ui_apps_minimap_minimap.drawOcclusion(offsetX, offsetY)` | Dessine les masques d'occlusion et le découpage circulaire ou rectangulaire de la minimap dans la texture. Appelé par la boucle de dessin de la minimap. *(interne)* | 668 |
| `ui_apps_minimap_minimap.getDebugSettingsData()` | Renvoie les listes de choix de la fenêtre de debug (`lookaheadValue`, `profileEveryNthFrame`). | 832 |
| `ui_apps_minimap_minimap.getMode()` | Renvoie la forme de la minimap. | 747 |
| `ui_apps_minimap_minimap.getScale()` | Renvoie l'échelle courante de la minimap. | 41 |
| `ui_apps_minimap_minimap.hide()` | Masque la minimap : remet la transformation à 0 et détache onUpdate. | 812 |
| `ui_apps_minimap_minimap.onClientEndMission()` | Hook appelé à la fin d'une mission/niveau. Masque la minimap et réinitialise les routes. *(interne)* *(hook)* | 836 |
| `ui_apps_minimap_minimap.onClientStartMission()` | Hook appelé au début d'une mission/niveau. Masque la minimap et réinitialise les routes (`ui_apps_minimap_roads.reset`). *(interne)* *(hook)* | 844 |
| `ui_apps_minimap_minimap.onInit()` | Appelé à l'initialisation de l'extension. Passe en déchargement manuel et lit les réglages de minimap. *(interne)* *(hook)* | 11 |
| `ui_apps_minimap_minimap.onMinimapSettingsChanged(m)` | Hook appelé quand les réglages de la minimap changent. Relit le mode, l'orientation, la grille et l'anticipation (lookahead) et l'état des viewports ImGui. *(interne)* *(hook)* | 758 |
| `ui_apps_minimap_minimap.resetOcclusionTransform(id)` | Supprime la zone d'occlusion portant cet id ; si l'id n'est pas une chaîne non vide, supprime toutes les zones. | 803 |
| `ui_apps_minimap_minimap.setBuffers(left, right, top, bottom)` | Fixe des marges personnalisées autour de la minimap (gauche, droite, haut, bas). Une valeur nil devient 10. | 771 |
| `ui_apps_minimap_minimap.setDrawTransform(x, y, width, height)` | Positionne la minimap et l'active (branche onUpdate). Les 4 valeurs doivent être entre 0 et 1, sinon avertissement et appel de hide. | 778 |
| `ui_apps_minimap_minimap.setOcclusionTransform(id, x, y, width, height)` | Déclare une zone qui masque une partie de la minimap (par exemple un élément d'interface posé dessus). Ignorée avec un avertissement si une valeur sort de 0..1. | 795 |
| `ui_apps_minimap_minimap.toggledebugSettings()` | Ouvre ou ferme la fenêtre de réglages de debug. | 820 |

### Détail des paramètres

#### `ui_apps_minimap_minimap.drawOcclusion(offsetX, offsetY)`

Dessine les masques d'occlusion et le découpage circulaire ou rectangulaire de la minimap dans la texture. Appelé par la boucle de dessin de la minimap.

- `offsetX` (*number*) : Décalage horizontal de dessin.
- `offsetY` (*number*) : Décalage vertical de dessin.

#### `ui_apps_minimap_minimap.getDebugSettingsData()`

Renvoie les listes de choix de la fenêtre de debug (`lookaheadValue`, `profileEveryNthFrame`).

- **renvoie** : table Tables `{name, value}` par réglage.

#### `ui_apps_minimap_minimap.getMode()`

Renvoie la forme de la minimap.

- **renvoie** : string "circle" ou "rect".

#### `ui_apps_minimap_minimap.getScale()`

Renvoie l'échelle courante de la minimap.

- **renvoie** : number Échelle en pixels par mètre.

#### `ui_apps_minimap_minimap.onMinimapSettingsChanged(m)`

Hook appelé quand les réglages de la minimap changent. Relit le mode, l'orientation, la grille et l'anticipation (lookahead) et l'état des viewports ImGui.

- `m` (*any*) : Argument non utilisé (déduit du code).

#### `ui_apps_minimap_minimap.resetOcclusionTransform(id)`

Supprime la zone d'occlusion portant cet id ; si l'id n'est pas une chaîne non vide, supprime toutes les zones.

- `id` (*string|nil*) : Identifiant de la zone, ou nil pour tout effacer.

#### `ui_apps_minimap_minimap.setBuffers(left, right, top, bottom)`

Fixe des marges personnalisées autour de la minimap (gauche, droite, haut, bas). Une valeur nil devient 10.

- `left` (*number|nil*) : Marge gauche.
- `right` (*number|nil*) : Marge droite.
- `top` (*number|nil*) : Marge haut.
- `bottom` (*number|nil*) : Marge bas.

#### `ui_apps_minimap_minimap.setDrawTransform(x, y, width, height)`

Positionne la minimap et l'active (branche onUpdate). Les 4 valeurs doivent être entre 0 et 1, sinon avertissement et appel de hide.

- `x` (*number*) : Position horizontale relative (0 à 1).
- `y` (*number*) : Position verticale relative (0 à 1).
- `width` (*number*) : Largeur relative (0 à 1).
- `height` (*number*) : Hauteur relative (0 à 1).

#### `ui_apps_minimap_minimap.setOcclusionTransform(id, x, y, width, height)`

Déclare une zone qui masque une partie de la minimap (par exemple un élément d'interface posé dessus). Ignorée avec un avertissement si une valeur sort de 0..1.

- `id` (*string*) : Identifiant de la zone.
- `x` (*number*) : Position horizontale relative (0 à 1).
- `y` (*number*) : Position verticale relative (0 à 1).
- `width` (*number*) : Largeur relative (0 à 1).
- `height` (*number*) : Hauteur relative (0 à 1).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : topomap, additionalInfo, route, utils, roads, vehicles de la minimap, et gameplay_playmodeMarkers. |
| `onUpdate` | function|nil | nil au départ ; défini par setDrawTransform (fonction de dessin), remis à nil par hide. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDrawOnMinimap` — écouté par 2 module(s)
- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/minimap/minimap.lua`.*
