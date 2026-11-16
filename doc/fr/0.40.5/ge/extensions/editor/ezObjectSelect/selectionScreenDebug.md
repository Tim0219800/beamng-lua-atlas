# `editor_ezObjectSelect_selectionScreenDebug`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/selectionScreenDebug.lua` · VM : Game Engine (GE) · 492 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_selectionScreenDebug` : `extensions.load("editor_ezObjectSelect_selectionScreenDebug")`, puis la globale `editor_ezObjectSelect_selectionScreenDebug`

Dessin en surcouche ImGui (plein écran, sans entrées) de la sélection de l'outil Easy Object Select : contours/enveloppes convexes et remplissages des candidats (vert pour le pick actif, jaune pour le reste de la pile, blanc pour la découverte, orange pour les objets sélectionnés, magenta pendant le glisser), cercle de découverte autour du curseur, étiquettes, et fenêtre de debug avec courbe de performance (180 échantillons).

## Remarques

- Dessine dans une fenêtre ImGui « ##easySelectProxyOverlay » couvrant le viewport principal, avec les flags NoInputs/NoBackground.
- Ne dessine rien s'il n'y a ni pick, ni proxy de découverte, ni debugEnabled, ni showHoverRing.
- Hors debug, le nombre de contours de découverte est limité par options.maxDiscoveryOutlines (5 par défaut).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_selectionScreenDebug.draw(snapshot, options)` | Dessine la surcouche pour un snapshot de selectionModel.update et enregistre le temps de performance de la frame. Sort immédiatement si le snapshot n'a pas de caméra. | 299 |
| `editor_ezObjectSelect_selectionScreenDebug.reset()` | Remet à zéro l'historique de performance (échantillons et compteurs). | 51 |

### Détail des paramètres

#### `editor_ezObjectSelect_selectionScreenDebug.draw(snapshot, options)`

Dessine la surcouche pour un snapshot de selectionModel.update et enregistre le temps de performance de la frame. Sort immédiatement si le snapshot n'a pas de caméra.

- `snapshot` (*table|nil*) : Snapshot produit par editor_ezObjectSelect_selectionModel.update.
- `options` (*table|nil*) : Options d'affichage : debugEnabled, showHoverRing, outlineMode (1 = pas d'enveloppes convexes), discoveryPixels, maxDiscoveryOutlines… (déduit du code).

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/selectionScreenDebug.lua`.*
