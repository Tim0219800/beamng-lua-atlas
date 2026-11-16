# `editor_flowgraph_properties`

*Fichier : `lua/ge/extensions/editor/flowgraph/properties.lua` · VM : Game Engine (GE) · 1325 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/properties")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « Properties » (fg_properties) de l'éditeur Flowgraph : inspecteur du nœud sélectionné (ou du graphe courant). Elle affiche un en-tête coloré avec renommage/couleurs personnalisés, les propriétés spécifiques du nœud (node:drawCustomProperties), sa table data, ses pins d'entrée (valeur codée en dur, modèles, visibilité) et de sortie (valeur courante _value), et les propriétés du graphe (nom, tags de macro…). Chaque changement ajoute une entrée d'historique via fgEditor.addHistory.

## Remarques

- _drawInputField gère number (float/int, input ou slider selon pin.numericSetup, bornes min/max appliquées), string et autres types ; les valeurs ImGui sont mises en cache dans item._cdata.
- La variable locale `previousNode` (upvalue du fichier) sert à appeler showProperties/hideProperties sur le nœud précédemment sélectionné ; self.previousNode (init) n'est pas utilisé ensuite.
- Seul le cas « un seul nœud sélectionné » affiche les propriétés du nœud.
- Les entrées sont désactivées (BeginDisabled) quand mgr.allowEditing est faux.
- Dans _drawDataTable avec keysEditable, le callback de renommage de clé appelle saveCallback avec v[k] déjà mis à nil (valeur nil).

## Classe `C`

Classe de la fenêtre (windowName 'fg_properties', windowDescription 'Properties').

| Méthode | Description | Ligne |
|---|---|---|
| `C:_drawDataTable(path, cdata, v, savePath, saveCallback, keysEditable)` | Dessine une table de données en deux colonnes clé/valeur (clés triées), ou une seule ligne si la seule clé est 'value'. | 158 |
| `C:_drawInputField(path, cdata, type, v, savePath, saveCallback, enterOnly, padRight, pin)` | Dessine un champ d'édition adapté au type de valeur et appelle saveCallback quand la saisie est validée. | 24 |
| `C:customPropertyColor(item, customName, cdata)` | Dessine un sélecteur de couleur RGBA pour une propriété personnalisée et l'écrit dans item[customName] à la fin de l'édition. | 199 |
| `C:draw(dt)` | Dessine la fenêtre : surligne les liens des nœuds sélectionnés, gère le changement de sélection, affiche le nœud sélectionné ou les propriétés du graphe. | 1020 |
| `C:drawCustomInPins(item)` | Dessine la section « Input Pins » éditable pour les nœuds à pins d'entrée personnalisés (allowCustomInPins). | 397 |
| `C:drawCustomOutPins(item)` | Dessine la section de pins de sortie éditable (allowCustomOutPins). | 610 |
| `C:drawGraphProperties(graph)` | Dessine les propriétés d'un graphe (nom, avec mise à jour du nœud intégré pour une macro, etc.). | 1156 |
| `C:drawHardTemplates(pin, item)` | Dessine le combo « ... » proposant des modèles de valeur codée en dur pour un pin (sélection de fichier si pin.allowFiles, chemin relatif au dossier du projet). | 745 |
| `C:drawInPins(item)` | Dessine la section « Input Pins » : visibilité, icône de type, nom, valeur codée en dur ou lien. | 804 |
| `C:drawItemHeader(item)` | Dessine l'en-tête coloré de l'élément avec son nom et le bouton de modification (mode_edit) du nom et des couleurs. | 231 |
| `C:drawItemProperties(itemType, item)` | Dessine la table data de l'élément puis ses pins d'entrée et de sortie (éditables ou non). | 976 |
| `C:drawOutPins(item)` | Dessine la section « Output Pins » : visibilité (masquable si non lié), type, nom et valeur courante (pin._value). | 934 |
| `C:getFirstAllowedType(types)` | Renvoie le premier type (ordre alphabétique) autorisé d'une table de types ; 'number' si types est nil, 'bool' si aucun. | 388 |
| `C:init()` | Enregistre la fenêtre (visible par défaut) et charge la texture d'en-tête art/imgui_node_header.png. | 18 |
| `C:initCustomProperties(item)` | Prépare les champs d'édition du nom et des couleurs (customColor/color, iconColor) d'un élément. | 211 |
| `C:showAvailableMacroTags()` | Liste les tags de macro du projet (mgr.macroTags) avec renommage et suppression. | 1133 |
| `C:unselect()` | Appelle hideProperties sur le nœud précédemment affiché et réinitialise les états d'édition. Appelée à la fermeture de la fenêtre. | 1124 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/properties.lua`.*
