# `gameplay_statisticModules_watchRollover`

*Fichier : `lua/ge/extensions/gameplay/statisticModules/watchRollover.lua` · VM : Game Engine (GE) · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_statisticModules_watchRollover` : `extensions.load("gameplay_statisticModules_watchRollover")`, puis la globale `gameplay_statisticModules_watchRollover`

Module de statistiques qui détecte les tonneaux (véhicule retourné sur le toit puis remis sur ses roues) et incrémente la métrique « vehicle/rollover » via gameplay_statistic.metricAdd. Il est appelé par gameplay_statistic avec la fonction workload.

## Remarques

- Le toit est détecté quand l'axe haut du véhicule a une composante z < -0,7 et que le véhicule glisse plus latéralement que longitudinalement. Le retour sur roues (z > 0,7) valide le tonneau si le toit a été vu depuis moins de 4 s et la dernière position sur roues depuis moins de 8 s.
- La fonction onPreRender (debug) est commentée à l'export et référence une variable vpos non définie.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_statisticModules_watchRollover.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; ne fait rien. *(interne)* *(hook)* | 66 |
| `gameplay_statisticModules_watchRollover.onVehicleResetted(vid)` | Hook appelé quand un véhicule est réinitialisé : annule la détection s'il s'agit du véhicule suivi. *(interne)* *(hook)* | 62 |
| `gameplay_statisticModules_watchRollover.onVehicleSwitched(oldid, newid, player)` | Hook appelé au changement de véhicule contrôlé : annule la détection. *(interne)* *(hook)* | 69 |
| `gameplay_statisticModules_watchRollover.workload(v, vid, dtSim)` | Analyse un véhicule à chaque appel (axes haut/avant, vitesse) et compte un tonneau quand la séquence toit puis roues est détectée. *(interne)* | 28 |

### Détail des paramètres

#### `gameplay_statisticModules_watchRollover.onVehicleResetted(vid)`

Hook appelé quand un véhicule est réinitialisé : annule la détection s'il s'agit du véhicule suivi.

- `vid` (*integer*) : Identifiant du véhicule.

#### `gameplay_statisticModules_watchRollover.onVehicleSwitched(oldid, newid, player)`

Hook appelé au changement de véhicule contrôlé : annule la détection.

- `oldid` (*integer*) : Ancien véhicule.
- `newid` (*integer*) : Nouveau véhicule.
- `player` (*integer*) : Indice du joueur.

#### `gameplay_statisticModules_watchRollover.workload(v, vid, dtSim)`

Analyse un véhicule à chaque appel (axes haut/avant, vitesse) et compte un tonneau quand la séquence toit puis roues est détectée.

- `v` (*userdata*) : Objet véhicule.
- `vid` (*integer*) : Identifiant du véhicule ; un changement annule la détection.
- `dtSim` (*number*) : Temps simulé écoulé en secondes.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/statisticModules/watchRollover.lua`.*
