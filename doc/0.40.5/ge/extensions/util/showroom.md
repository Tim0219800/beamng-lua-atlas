# `util_showroom`

*Fichier : `lua/ge/extensions/util/showroom.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_showroom` : `extensions.load("util_showroom")`, puis la globale `util_showroom`

Petit utilitaire de « showroom » : fait apparaître à la demande un préfabriqué de garage (art/prefabs/garage_simple.prefab) à la position fixe (0, 0, 1000) dans le niveau courant et permet d'y déplacer un véhicule. Le préfabriqué est chargé au premier appel qui a besoin de sa position (moveInside, getPosRot) et déchargé à la fin du niveau (onClientEndMission).

## Exemple

```lua
local veh = getPlayerVehicle(0)
util_showroom.moveInside(veh) -- charge le garage au besoin, téléporte et pose le véhicule
print(util_showroom.isInside(veh:getPosition()))
```

## Remarques

- Position du garage : vec3(0, 0, 1000), rotation identité ; ces valeurs sont fixes (getSuitablePosition).
- isInside renvoie nil (et non false) si le préfabriqué n'est pas chargé ; sinon true quand la position est à moins de 20 m du centre du garage (test volontairement simple, marqué TODO dans le code).
- Si le préfabriqué ne se charge pas, le message d'erreur journalisé affiche la variable position, qui est encore nil à ce moment-là ; getPosRot ne vérifie pas l'échec et la fonction suivante ferait alors position + pos avec position nil (erreur Lua).
- Le code ne détecte pas un préfabriqué déjà présent (commentaire TODO) : un rechargement Lua peut en laisser plusieurs.
- isInside utilise core_camera sans l'avoir déclaré en dépendance.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_showroom.getPosRot()` | Renvoie la position et la rotation de l'intérieur du garage (charge le préfabriqué si besoin). | 39 |
| `util_showroom.isInside(pos)` | Indique si une position est dans le garage (distance au centre < 20 m). Sans argument, utilise la position du véhicule du joueur ou à défaut celle de la caméra. | 49 |
| `util_showroom.moveInside(veh)` | Charge le garage si nécessaire, place le véhicule à sa position (setPosRot) puis appelle veh:autoplace(false) pour le poser. | 42 |
| `util_showroom.onClientEndMission()` | Hook appelé à la fin du niveau : supprime le préfabriqué et recharge la collision (be:reloadCollision). *(interne)* *(hook)* | 26 |

### Détail des paramètres

#### `util_showroom.getPosRot()`

Renvoie la position et la rotation de l'intérieur du garage (charge le préfabriqué si besoin).

- **renvoie** : vec3 Position monde du garage (0, 0, 1000).
- **renvoie** : quat Rotation identité (0, 0, 0, 1).

#### `util_showroom.isInside(pos)`

Indique si une position est dans le garage (distance au centre < 20 m). Sans argument, utilise la position du véhicule du joueur ou à défaut celle de la caméra.

- `pos` (*vec3|nil*) : Position monde à tester.
- **renvoie** : boolean|nil true si dedans ; false hors du garage ; nil si le préfabriqué n'est pas chargé.

#### `util_showroom.moveInside(veh)`

Charge le garage si nécessaire, place le véhicule à sa position (setPosRot) puis appelle veh:autoplace(false) pour le poser.

- `veh` (*table*) : Objet véhicule à déplacer.

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/showroom.lua`.*
