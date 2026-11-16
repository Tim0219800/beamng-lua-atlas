# `career_modules_tutorial_debug`

*Fichier : `lua/ge/extensions/career/modules/tutorial/debug.lua` · VM : Game Engine (GE) · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_debug` : `extensions.load("career_modules_tutorial_debug")`, puis la globale `career_modules_tutorial_debug`

Menu de debug imgui du tutoriel de carrière. Il affiche l'étape courante, des boutons pour démarrer/avancer/terminer le tutoriel, sauter à une étape, ouvrir l'écran de signature de contrat, simuler un véhicule endommagé ou une sortie de zone, et gérer l'affichage des zones de limites. Il appelle aussi onDebugMenu(im) de l'extension de l'étape courante si elle en a un.

## Remarques

- debugName vaut "Tutorial" et debugOrder 100 : ces champs servent au système de menus de debug.
- Si career_modules_tutorial n'est pas chargé, le menu affiche seulement « Tutorial module not loaded ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_debug.drawDebugMenu(dt)` | Dessine le contenu imgui du menu de debug du tutoriel (appelé chaque frame par le système de debug). *(interne)* | 19 |

### Détail des paramètres

#### `career_modules_tutorial_debug.drawDebugMenu(dt)`

Dessine le contenu imgui du menu de debug du tutoriel (appelé chaque frame par le système de debug).

- `dt` (*number*) : Delta temps.

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | Nom de l'onglet de debug : "Tutorial". |
| `debugOrder` | number | Ordre d'affichage : 100. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCareerTutorialLeftBounds` — écouté par 8 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/debug.lua`.*
