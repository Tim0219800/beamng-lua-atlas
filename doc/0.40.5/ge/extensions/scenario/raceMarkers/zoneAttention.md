# `scenario_raceMarkers_zoneAttention`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua` · VM : Game Engine (GE) · 164 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/zoneAttention")` (fichier sous extensions/ mais pas une extension classique)

Marqueur d'attention pour une zone (polygone) : au lieu d'un objet 3D, il demande à l'objet zone de se dessiner lui-même (zone:drawDebug('faded', couleur, hauteur de clôture)). La couleur passe du bleu (normal) au jaune puis à l'orange pendant un compte à rebours, et au orange foncé quand la zone « monte » (rising) ou que le compte est terminé. Le module renvoie un constructeur : require('scenario/raceMarkers/zoneAttention')(id) donne un objet de la classe C.

## Remarques

- setToCheckpoint(wp) accepte soit un objet zone (champs drawDebug et vertices), soit wp.zone ; sinon seuls wp.pos et wp.radius sont mémorisés et rien n'est dessiné.
- Le centre est zone.center ou la position du premier sommet ; si un terrain existe, la hauteur est replaquée à terrain + 2 m (core_terrain).
- La clôture est dessinée avec alpha 0.25 et hauteur fenceHeight (0.33 par défaut, réglable par setFenceHeight).
- C:setCountdown a pour signature réelle (remaining, total, done) ; la page extraite affiche (total, done) car elle omet le premier paramètre : le premier argument est le temps restant.
- La page extraite affiche update(dtSim) ; la signature réelle est update(dt, dtSim).

## Classe `C`

Marqueur de zone dessiné par debug.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_zoneAttention")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarkers()` | Efface la table d'identifiants. | 153 |
| `C:createMarkers()` | Conservé pour la compatibilité d'API : ne crée aucun objet. | 149 |
| `C:hide()` | Appelle setVisibility(false). | 145 |
| `C:init(id)` | Constructeur : initialise l'état (invisible, mode 'hidden', couleur bleue). | 12 |
| `C:setCountdown(remaining, total, done)` | Règle l'état du compte à rebours qui pilote la couleur. | 130 |
| `C:setFenceHeight(h)` | Règle la hauteur de la clôture dessinée. | 126 |
| `C:setMode(mode)` | 'hidden' masque, autre mode affiche. | 113 |
| `C:setRising(v)` | Marque la zone comme « montante » : couleur orange foncé. | 136 |
| `C:setToCheckpoint(wp)` | Associe la zone à dessiner, ou une simple position si wp n'est pas une zone. | 84 |
| `C:setVisibility(v)` | Active ou désactive le dessin. | 141 |
| `C:show()` | Appelle setVisibility(true). | 146 |
| `C:update(dt, dtSim)` | Appel par image : calcule la couleur cible (bleue, dégradé jaune vers orange pendant le compte à rebours, orange foncé si rising ou terminé), la lisse puis dessine la zone. | 34 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua`.*
