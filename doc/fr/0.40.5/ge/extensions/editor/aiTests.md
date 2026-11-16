# `editor_aiTests`

*Fichier : `lua/ge/extensions/editor/aiTests.lua` · VM : Game Engine (GE) · 420 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_aiTests` : `extensions.load("editor_aiTests")`, puis la globale `editor_aiTests`

Outil de l'éditeur « Vehicle AI Path/Plan Debug » (menu Debug des fenêtres de l'éditeur). Deux onglets : « Route » permet de définir un départ, une arrivée et des waypoints (marqueurs déplaçables, ou position du véhicule joueur / de la caméra), calcule la route sur le navgraph (gameplay/route/route), l'affiche avec debugDrawer et peut l'envoyer aux ground markers ; « AI Vehicles » permet de sélectionner des véhicules IA, régler leurs paramètres (aggression, turnForceCoef, awarenessForceCoef, edgeDist, lookAheadKv, staticFrictionCoefMult), puis lancer, arrêter, replacer ou recharger tous les véhicules sur la route courante ou un chemin aléatoire de 2000 m. Utile pour comparer le comportement de l'IA avec des réglages différents.

## Remarques

- Désactiver les collisions dynamiques (case Enable Dynamic Collisions) rend les véhicules « fantômes » pour comparer les trajectoires ; elles sont réactivées à la fermeture de l'éditeur (onEditorDeactivated).
- Au lancement, chaque véhicule reçoit ai.driveUsingPath({wpTargetList = ..., avoidCars = 'off'}), ai.setAggression, ai.setParameters et le mode de debug de trajectoire.
- Dans tabParams, la branche `elseif type(p[0]) == "boolean"` teste p[0] au lieu de p[1][0] ; comme tous les paramètres sont des nombres, elle n'est jamais utilisée.
- Les fonctions de l'outil sont toutes locales : seuls les trois hooks de l'éditeur sont exportés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_aiTests.onEditorDeactivated()` | Hook émis quand l'éditeur est fermé : réactive les collisions dynamiques si l'outil les avait désactivées. *(interne)* *(hook)* | 404 |
| `editor_aiTests.onEditorGui()` | Hook de dessin de l'éditeur : affiche la fenêtre à onglets Route / AI Vehicles. *(interne)* *(hook)* | 384 |
| `editor_aiTests.onEditorInitialized()` | Hook émis à l'initialisation de l'éditeur : enregistre la fenêtre (520x420) et son entrée de menu dans le groupe Debug. *(interne)* *(hook)* | 410 |

## Appels vers le moteur (C++)

- `be:` `setDynamicCollisionEnabled`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getPosition`, `getRotation`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/aiTests.lua`.*
