# `thrusters`

*Fichier : `lua/vehicle/thrusters.lua` · VM : Véhicule · 189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `thrusters`

Applique des poussées au véhicule : propulseurs jbeam (section 'thrusters', commandés par une valeur electrics ou en mode 'auto' qui fabrique une poussée proportionnelle à la vitesse relative entre deux noeuds), impulsions de force entre deux noeuds, et accélérations/vitesses imposées à un cluster de noeuds. Un moddeur ou un outil (scénarios, script) s'en sert pour pousser ou lancer un véhicule pendant une durée donnée. Le module n'est actif dans la boucle de physique que lorsqu'il y a quelque chose à appliquer.

## Exemple

```lua
-- pousser le véhicule vers l'avant (déduit : base arrière -> avant) pendant 0.5 s
thrusters.applyImpulseBody(5000, 0.5)
-- imposer une accélération de 20 m/s² vers le haut pendant 0.2 s
thrusters.applyAccel(vec3(0, 0, 20), 0.2)
```

## Remarques

- Clés jbeam d'un thruster (v.data.thrusters) : id1 (noeud source), id2 (noeud destination), control (nom d'une valeur electrics, ou 'auto'), factor (1 par défaut), thrustLimit (poussée max en N, infinie par défaut). La force appliquée est min(electrics[control]*factor, thrustLimit) sur la paire de noeuds (id2, id1), calculée dans updateGFX et appliquée à chaque pas de physique.
- Mode 'auto' : vel = -vitesse du noeud id2 par rapport à id1 ; si vel > 0.3 m/s, poussée = vel² * factor, bornée par thrustLimit ; si d'autres propulseurs sont actifs, on ajoute la force mesurée entre les noeuds (max(0, force)). Note : factor et thrustLimit n'ont pas de défaut pour les auto (seul le chemin activeThrusters les initialise) : sans factor ou thrustLimit définis, l'arithmétique ou la comparaison peut échouer.
- Un control qui n'existe pas dans electrics provoque un log d'erreur une seule fois (invalidThrusterControlWarned) ; il est recommandé d'utiliser des bindings de véhicule ou un canal electrics.
- applyImpulse/applyImpulseBody/applyAccel activent update() (physique) ; lorsque plus rien n'est actif, M.update repasse à nop et updateCorePhysicsStepEnabled() est rappelée pour désactiver le pas physique.
- Bug/incohérence : applyImpulse et applyImpulseBody remplacent dt par lastDt (`dt or lastDt`) seulement quand l'impulsion existe déjà ; pour une nouvelle impulsion elles insèrent le dt brut ; si dt est nil, thruster[4] est nil et le calcul `ttl - physicsDt` de update() lève une erreur. Toujours passer dt.
- Unités : forces en N, accélérations en m/s², vitesses en m/s, durées en s ; angularAccel est une accélération angulaire (rad/s², vec3).
- lastDt et physicsDt, updateCorePhysicsStepEnabled sont des variables globales du jeu (non définies dans ce fichier).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `thrusters.applyAccel(accel, dt, nodeId, angularAccel)` | Impose une accélération linéaire (et angulaire facultative) au cluster de noeuds contenant nodeId pendant dt secondes (obj:applyClusterLinearAngularAccel). Une seule accélération par nodeId à la fois : un nouvel appel remplace l'ancien. | 124 |
| `thrusters.applyImpulse(n1, n2, force, dt)` | Applique une force constante entre deux noeuds pendant dt secondes ; si l'impulsion existe déjà pour cette paire de noeuds, met à jour sa force et sa durée. | 95 |
| `thrusters.applyImpulseBody(force, dt)` | Comme applyImpulse mais entre le noeud ref et le noeud back du véhicule (refNodes[0].ref et .back), c'est-à-dire selon l'axe longitudinal du châssis. | 109 |
| `thrusters.applyVelocity(velocity, dt, nodeId)` | Fait atteindre une vitesse donnée au cluster en une durée dt, en appliquant l'accélération (velocity - vitesse actuelle hors roues) / dt. Ne fait rien si dt vaut 0. | 137 |
| `thrusters.getAccelDt(nodeId)` | Renvoie la durée restante d'une accélération appliquée par applyAccel/applyVelocity sur ce noeud. | 132 |
| `thrusters.init()` | Charge les propulseurs jbeam du véhicule (séparés en auto et commandés), remet à zéro les impulsions et choisit update/updateGFX. Si le véhicule n'a pas de thrusters, met les deux à nop. *(interne)* | 148 |
| `thrusters.isPhysicsStepUsed()` | Indique si le module est actuellement appelé à chaque pas de physique (M.update == update). *(interne)* | 144 |
| `thrusters.reset()` | Identique à init (M.reset = init) : réinitialise les propulseurs. *(interne)* | 148 |

### Détail des paramètres

#### `thrusters.applyAccel(accel, dt, nodeId, angularAccel)`

Impose une accélération linéaire (et angulaire facultative) au cluster de noeuds contenant nodeId pendant dt secondes (obj:applyClusterLinearAngularAccel). Une seule accélération par nodeId à la fois : un nouvel appel remplace l'ancien.

- `accel` (*vec3*) : Accélération linéaire en m/s² (modifiée sur place en fin de durée).
- `dt` (*number|nil*) : Durée en secondes (lastDt par défaut).
- `nodeId` (*integer|nil*) : Noeud du cluster (noeud ref par défaut, ou 0).
- `angularAccel` (*vec3|nil*) : Accélération angulaire en rad/s² (zéro par défaut).

#### `thrusters.applyImpulse(n1, n2, force, dt)`

Applique une force constante entre deux noeuds pendant dt secondes ; si l'impulsion existe déjà pour cette paire de noeuds, met à jour sa force et sa durée.

- `n1` (*integer*) : Noeud (cid) auquel la force est appliquée en premier.
- `n2` (*integer*) : Noeud (cid) de l'autre extrémité.
- `force` (*number*) : Force en N (obj:applyForce(n1, n2, force)).
- `dt` (*number*) : Durée en secondes (à fournir : voir bug dans notes).

#### `thrusters.applyImpulseBody(force, dt)`

Comme applyImpulse mais entre le noeud ref et le noeud back du véhicule (refNodes[0].ref et .back), c'est-à-dire selon l'axe longitudinal du châssis.

- `force` (*number*) : Force en N.
- `dt` (*number*) : Durée en secondes.

#### `thrusters.applyVelocity(velocity, dt, nodeId)`

Fait atteindre une vitesse donnée au cluster en une durée dt, en appliquant l'accélération (velocity - vitesse actuelle hors roues) / dt. Ne fait rien si dt vaut 0.

- `velocity` (*vec3*) : Vitesse cible en m/s.
- `dt` (*number|nil*) : Durée en secondes (lastDt par défaut).
- `nodeId` (*integer|nil*) : Noeud du cluster (noeud ref par défaut).

#### `thrusters.getAccelDt(nodeId)`

Renvoie la durée restante d'une accélération appliquée par applyAccel/applyVelocity sur ce noeud.

- `nodeId` (*integer*) : Noeud du cluster.
- **renvoie** : number Durée restante en secondes (0 s'il n'y en a pas).

#### `thrusters.isPhysicsStepUsed()`

Indique si le module est actuellement appelé à chaque pas de physique (M.update == update).

- **renvoie** : boolean true s'il y a des poussées en cours.

## Champs

| Champ | Type | Description |
|---|---|---|
| `update` | function | nop, ou la fonction de physique de ce module quand au moins un propulseur, impulsion ou cluster est actif. Appelée à chaque pas de physique. ⚠ nop est un global du jeu. |
| `updateGFX` | function | nop, ou la fonction qui recalcule les poussées commandées par electrics à chaque frame graphique si le véhicule a des thrusters jbeam. |

## Appels vers le moteur (C++)

- `obj:` `applyClusterLinearAngularAccel`, `applyForce`, `getClusterVelocityWithoutWheels`, `getNodeForce`, `getNodeVelocity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/thrusters.lua`.*
