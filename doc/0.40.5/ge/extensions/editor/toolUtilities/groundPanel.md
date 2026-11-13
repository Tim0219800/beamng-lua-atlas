# `editor_toolUtilities_groundPanel`

*Fichier : `lua/ge/extensions/editor/toolUtilities/groundPanel.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_groundPanel` : `extensions.load("editor_toolUtilities_groundPanel")`, puis la globale `editor_toolUtilities_groundPanel`

Panneau imgui des réglages du terraformage partagé (groundPass), dessiné à l'identique dans l'onglet Terrain de chaque outil de l'éditeur. Il lit et écrit groundPass.params (curseurs avec bouton de remise à la valeur par défaut, cases à cocher).

## Remarques

- Réglages exposés quand Terraform est coché : distance de fondu (5 à 100 m), marge (0 à 20 m), pente de fondu (1 à 8), pas de lissage (0 à 15), rugosité (0 à 1), échelle du bruit (0 à 1), longueur et épaulement des culées de pont (0 à 40 m, 0 à 5 m).
- Les cases Roads et Rail choisissent les réseaux couverts par Build.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_groundPanel.draw()` | Dessine la case Terraform (décochée : restaure le terrain) et, si elle est cochée, les curseurs de fondu, marge, falloff, lissage, rugosité, échelle et culées de pont. | 49 |
| `editor_toolUtilities_groundPanel.drawNetworks()` | Dessine la ligne 'Networks:' avec les cases Roads et Rail (réseaux couverts par Build). | 41 |
| `editor_toolUtilities_groundPanel.rowLabel(text, tip)` | Dessine l'étiquette d'une ligne (texte vert avec infobulle) et place le curseur imgui à 90 px pour que les cases suivent sur la même ligne. | 28 |

### Détail des paramètres

#### `editor_toolUtilities_groundPanel.rowLabel(text, tip)`

Dessine l'étiquette d'une ligne (texte vert avec infobulle) et place le curseur imgui à 90 px pour que les cases suivent sur la même ligne.

- `text` (*string*) : Texte de l'étiquette.
- `tip` (*string*) : Infobulle.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/groundPanel.lua`.*
