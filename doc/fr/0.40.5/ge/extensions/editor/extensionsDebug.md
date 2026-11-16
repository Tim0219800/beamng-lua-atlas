# `editor_extensionsDebug`

*Fichier : `lua/ge/extensions/editor/extensionsDebug.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_extensionsDebug` : `extensions.load("editor_extensionsDebug")`, puis la globale `editor_extensionsDebug`

Fenêtre de debug de l'éditeur (menu Window > Debug > Extensions Debug) qui liste les extensions Lua chargées (extensions.getLoadedExtensionsNames()) sous forme d'arbre imgui. Chaque extension se déplie pour montrer récursivement le contenu de sa table (imguiUtils.addRecursiveTreeTable). Utile à un moddeur pour inspecter l'état d'une extension à chaud.

## Remarques

- La case « Filters » est affichée mais le filtrage par type est commenté dans le code : cocher la case masque simplement l'arbre détaillé de chaque extension (rien n'est affiché à l'intérieur des nœuds).
- Les cases funCheck/numCheck/strCheck/cdataCheck/boolCheck/tblCheck sont déclarées mais jamais utilisées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_extensionsDebug.onEditorGui()` | Dessine la fenêtre « Extensions Debug Window » : case Filters puis un nœud d'arbre par extension chargée, avec le contenu récursif de extensions[nom] quand Filters est décochée. *(interne)* *(hook)* | 33 |
| `editor_extensionsDebug.onEditorInitialized()` | Appelé quand l'éditeur est initialisé : enregistre la fenêtre « extensionsDebug » et l'entrée de menu « Extensions Debug » (groupe Debug). *(interne)* *(hook)* | 59 |
| `editor_extensionsDebug.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; ne fait rien ici. *(interne)* *(hook)* | 56 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/extensionsDebug.lua`.*
