# `editor_ezObjectSelect_subtools_fence_controller`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua` · VM : Game Engine (GE) · 164 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_subtools_fence_controller` : `extensions.load("editor_ezObjectSelect_subtools_fence_controller")`, puis la globale `editor_ezObjectSelect_subtools_fence_controller`

Panneau ImGui du sous-outil « Fence » d'Easy Object Select. Permet de choisir le mesh de clôture (sélection de l'Asset Browser ou objet sélectionné dans Easy Select), de régler la distance de correspondance des ancres (0.05 à 5 m) et l'option « No overlap », puis de lancer Select Fence, et, une fois le mode actif, de valider (Exit Fence Mode), annuler (Cancel Fence) ou supprimer (Delete Fence) la clôture. Délègue toute la logique à fence/session.

## Remarques

- Exit Fence Mode et Delete Fence sont désactivés quand la session a atteint sa limite de sécurité (isCapped).
- L'état du panneau (asset choisi, distance, noOverlap, message) est local au module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_subtools_fence_controller.cancel()` | Annule la session de clôture en cours (restaure les pièces d'origine). | 155 |
| `editor_ezObjectSelect_subtools_fence_controller.drawWorkspace(options)` | Dessine le panneau du sous-outil et traite les clics sur ses boutons (appelle fenceSession.begin / exitAndCommit / cancel / deleteAndCommit / setNoOverlap). | 28 |
| `editor_ezObjectSelect_subtools_fence_controller.isModeActive()` | Indique si le mode clôture est actif. | 159 |
| `editor_ezObjectSelect_subtools_fence_controller.update(canAcceptInput)` | Passe la frame à fenceSession.update (entrées souris/clavier, aperçu, dessin). | 151 |

### Détail des paramètres

#### `editor_ezObjectSelect_subtools_fence_controller.drawWorkspace(options)`

Dessine le panneau du sous-outil et traite les clics sur ses boutons (appelle fenceSession.begin / exitAndCommit / cancel / deleteAndCommit / setNoOverlap).

- `options` (*table|nil*) : canEnter (boolean) : si false, Select Fence est désactivé.

#### `editor_ezObjectSelect_subtools_fence_controller.isModeActive()`

Indique si le mode clôture est actif.

- **renvoie** : boolean true si une session est active.

#### `editor_ezObjectSelect_subtools_fence_controller.update(canAcceptInput)`

Passe la frame à fenceSession.update (entrées souris/clavier, aperçu, dessin).

- `canAcceptInput` (*boolean*) : true si la vue peut recevoir les entrées.
- **renvoie** : boolean true si une session est active.

## Appels vers le moteur (C++)

- `obj:` `getField`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua`.*
