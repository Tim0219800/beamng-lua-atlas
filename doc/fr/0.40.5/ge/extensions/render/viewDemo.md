# `render_viewDemo`

*Fichier : `lua/ge/extensions/render/viewDemo.lua` · VM : Game Engine (GE) · 74 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `render_viewDemo` : `extensions.load("render_viewDemo")`, puis la globale `render_viewDemo`

Petit exemple d'utilisation des vues de rendu (RenderViewManagerInstance) : crée une vue nommée 'Demo view 1' rendue dans une texture nommée, déplace sa caméra en cercle et l'affiche dans une fenêtre ImGui. À charger à la main avec extensions.load('render_viewDemo') ; sert de modèle pour un moddeur qui veut une caméra virtuelle vers une texture.

## Exemple

```lua
extensions.load('render_viewDemo')
```

## Remarques

- Le nom de la vue est son identifiant unique ; renderView.namedTexTargetColor reçoit ce nom, et imUtils.texObj('#<nom>') récupère la texture pour ImGui.
- luaOwned = true fait supprimer la vue quand le ramasse-miettes la collecte.
- Paramètres de la vue dans l'exemple : résolution 512x256, fov 75, near 0.1, far 2000, renderCubemap faux, renderEditorIcons vrai.
- Le texte 'Hello world view :)' est dessiné via debugDrawer:drawTextAdvanced en (20, 20, 0).
- La vue n'est jamais détruite par l'extension : pas de onExtensionUnloaded.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `render_viewDemo.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque image : crée la vue au premier appel, déplace la caméra (position sin/cos du temps simulé, hauteur 1.5), dessine un texte de debug et affiche la texture de la vue dans la fenêtre ImGui 'Render view test'. *(interne)* *(hook)* | 25 |

### Détail des paramètres

#### `render_viewDemo.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque image : crée la vue au premier appel, déplace la caméra (position sin/cos du temps simulé, hauteur 1.5), dessine un texte de debug et affiche la texture de la vue dans la fenêtre ImGui 'Render view test'.

- `dtReal` (*number*) : Durée réelle de l'image (s), non utilisée.
- `dtSim` (*number*) : Durée simulée (s), ajoutée à un chronomètre local.
- `dtRaw` (*number*) : Durée brute (s), non utilisée.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/render/viewDemo.lua`.*
