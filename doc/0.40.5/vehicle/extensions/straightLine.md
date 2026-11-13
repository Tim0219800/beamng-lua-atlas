# `straightLine`

*Fichier : `lua/vehicle/extensions/straightLine.lua` · VM : Véhicule · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `straightLine` : `extensions.load (VM véhicule)("straightLine")`, puis la globale `straightLine`

Pilote automatique de direction très simple : un PID corrige la direction pour que le véhicule roule vers un point cible (ou tout droit, 20 m devant sa position initiale). Il envoie la commande via input.event("steering", valeur, 1) à chaque frame. Ne contrôle ni gaz ni frein.

## Exemple

```lua
extensions.load('straightLine')
straightLine.setTargetDirection(nil, 'road')   -- tout droit
straightLine.setTargetDirection(vec3(100,0,0), 'offroad')
straightLine.stop()
```

## Remarques

- Modes : "offroad" utilise un PID (0.8, 0.5, 0) ; tout autre mode utilise (0.4, 0, 0), sortie bornée à [-1, 1]. Le paramètre mode est concaténé dans un print : passer nil provoque une erreur.
- La cible est recalculée à chaque frame : targetPos = baseTargetPos + ((pos - 20) * offset) avec offset = (0,1,0) ; seul l'axe Y est donc ajusté (comportement tel que lu dans le code).
- Aucune vérification que steeringPID existe : updateGFX n'agit que si baseTargetPos est défini, ce qui n'arrive qu'après setTargetDirection.
- L'erreur d'angle est mise en forme (racine carrée du signe conservé) avant le PID.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `straightLine.onInit()` | Hook appelé à l'initialisation du véhicule (extensions.hook('onInit')) : efface la cible. *(interne)* *(hook)* | 59 |
| `straightLine.onReset()` | Hook appelé au reset du véhicule ; même fonction que onInit : efface la cible. *(interne)* *(hook)* | 59 |
| `straightLine.setTargetDirection(target, mode)` | Active la conduite vers une cible. Sans cible, vise le point situé 20 m devant le véhicule dans la direction actuelle (projetée à l'horizontale). Crée le PID de direction selon le mode. | 33 |
| `straightLine.stop()` | Arrête l'assistance : envoie input.event('steering', 0, 0) et efface la cible. | 53 |
| `straightLine.updateGFX(dt)` | Appelé à chaque frame graphique via extensions.hook('updateGFX'). Si une cible est définie, calcule l'erreur d'angle et envoie la direction PID par input.event('steering', ...). *(interne)* | 15 |

### Détail des paramètres

#### `straightLine.setTargetDirection(target, mode)`

Active la conduite vers une cible. Sans cible, vise le point situé 20 m devant le véhicule dans la direction actuelle (projetée à l'horizontale). Crée le PID de direction selon le mode.

- `target` (*vec3|nil*) : Position cible ; nil = 20 m droit devant.
- `mode` (*string*) : "offroad" pour un PID plus agressif, autre valeur pour le PID standard. Ne doit pas être nil.

#### `straightLine.updateGFX(dt)`

Appelé à chaque frame graphique via extensions.hook('updateGFX'). Si une cible est définie, calcule l'erreur d'angle et envoie la direction PID par input.event('steering', ...).

- `dt` (*number*) : Pas de temps en secondes, passé au PID.

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getPosition`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/straightLine.lua`.*
