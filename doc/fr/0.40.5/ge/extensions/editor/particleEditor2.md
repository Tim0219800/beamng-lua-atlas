# `editor_particleEditor2`

*Fichier : `lua/ge/extensions/editor/particleEditor2.lua` · VM : Game Engine (GE) · 541 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_particleEditor2` : `extensions.load("editor_particleEditor2")`, puis la globale `editor_particleEditor2`

Seconde version, expérimentale, de l'éditeur de particules : une fenêtre d'outil « Particle Editor 2 » (menu Fenêtre > Experimental) avec, à gauche, un aperçu 3D rendu dans une RenderView dédiée (caméra orbitale, grille tracée au debugDrawer) et, à droite, les contrôles. Elle utilise deux genericInspector (ParticleEmitterData et ParticleData) pour modifier les champs, et gère création, sauvegarde (fichier d'origine, niveau, « sous... ») et suppression des émetteurs et particules (4 particules max par émetteur).

## Remarques

- Aperçu : clic droit glissé = rotation, clic milieu glissé = déplacement, molette = distance (0.5 à 200), double-clic gauche = recentrage.
- La caméra d'aperçu est limitée en tangage à ±1.5 rad ; le masque de vue vaut 30 et le fond est gris foncé (20,20,20).
- DefaultEmitter ne peut pas être supprimé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_particleEditor2.onEditorGui()` | Appelé à chaque frame par l'éditeur. Ouvre la fenêtre « Particle Editor 2 » (avec barre de menu) et dessine l'aperçu puis les contrôles. *(interne)* *(hook)* | 463 |
| `editor_particleEditor2.onEditorInitialized()` | Enregistre la fenêtre (900x600), l'entrée de menu Experimental et crée les deux inspecteurs génériques (ParticleEmitterData / ParticleData). *(interne)* *(hook)* | 517 |
| `editor_particleEditor2.onEditorToolWindowHide(windowName)` | Si la fenêtre masquée est particleEditor2, désactive l'aperçu et détruit le nœud d'aperçu. *(interne)* *(hook)* | 507 |
| `editor_particleEditor2.onEditorToolWindowShow(windowName)` | Si la fenêtre affichée est particleEditor2, active l'aperçu, relit la liste des datablocks, crée le nœud d'aperçu et sélectionne le premier émetteur si aucun n'est choisi. *(interne)* *(hook)* | 497 |
| `editor_particleEditor2.onExtensionUnloaded()` | Détruit l'aperçu au déchargement de l'extension. *(interne)* *(hook)* | 528 |
| `editor_particleEditor2.onPreRender()` | Appelé avant le rendu ; dessine la grille d'aperçu (lignes debugDrawer limitées au masque de vue de l'aperçu) quand l'aperçu est actif. *(interne)* *(hook)* | 488 |
| `editor_particleEditor2.onUpdate()` | Appelé à chaque frame ; si l'éditeur est actif et l'aperçu ouvert, met à jour la RenderView (taille, fov 60, matrice caméra). *(interne)* *(hook)* | 492 |

### Détail des paramètres

#### `editor_particleEditor2.onEditorToolWindowHide(windowName)`

Si la fenêtre masquée est particleEditor2, désactive l'aperçu et détruit le nœud d'aperçu.

- `windowName` (*string*) : Nom de la fenêtre d'outil masquée.

#### `editor_particleEditor2.onEditorToolWindowShow(windowName)`

Si la fenêtre affichée est particleEditor2, active l'aperçu, relit la liste des datablocks, crée le nœud d'aperçu et sélectionne le premier émetteur si aucun n'est choisi.

- `windowName` (*string*) : Nom de la fenêtre d'outil affichée.

## Appels vers le moteur (C++)

- `Sim.` `getDataBlockSet`, `getUniqueName`, `upcast`
- `debugDrawer:` `currentRenderViewMaskClear`, `currentRenderViewMaskSet`, `drawLine`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/particleEditor2.lua`.*
