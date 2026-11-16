# `ui_popup`

*Fichier : `lua/ge/extensions/ui/popup.lua` · VM : Game Engine (GE) · 234 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_popup` : `extensions.load("ui_popup")`, puis la globale `ui_popup`

Extension GE qui ouvre les popups de tutoriel de l'interface (hook UI OpenTutorialPopup). Un popup est décrit par un dossier de contenu (par défaut /gameplay/tutorials/pages/<id>/) contenant content.json (titre, texte, image, lignes, composant Vue) ou content.html. Le module lit ces fichiers, traduit les textes et envoie la liste d'entrées à l'UI. Il propose aussi des popups prédéfinis (aides à la conduite, choix de défi, contrat, drag).

## Exemple

```lua
ui_popup.openPopupById('v2/dragStripTimeslipIntro')
ui_popup.openPopupsByIds({'dragTreeStages','dragTreeCountdown'}, {root='/gameplay/tutorials/pages/v2/'})
ui_popup.closeTutorialPopup()
```

## Remarques

- Dans openDragTimeslipTutorialPopup, la variable `slip` n'est jamais définie (globale nil) : entry.slip reste nil. De plus, si le contenu 'v2/dragStripTimeslipIntro' est introuvable, entry vaut nil et la liste {entry} est vide.
- Pour un content.json dont vueComponent vaut DragTimeslipTutorialPopup, entry.slip vient de options.slip ou de gameplay_drag_dragBridge.createTimeslipData(). Pour ApmOnboardingPopup, entry.startingMoney (défaut 0) et entry.endMoney (défaut 10000) viennent des options.
- Si content.json existe, content.html est ignoré. Les images relatives sont résolues par rapport au dossier du popup ; un chemin commençant par '/' est gardé tel quel.
- L'option options.context permet de traduire title/text via core_locales.contextTranslate ; les textes de rows utilisent toujours _tr.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_popup.closeTutorialPopup()` | Ferme le popup de tutoriel affiché (hook UI CloseTutorialPopup). | 104 |
| `ui_popup.collectPopupIdsFromRoot(root)` | Parcourt récursivement une racine et renvoie les noms de sous-dossiers contenant content.json ou content.html, triés alphabétiquement. | 109 |
| `ui_popup.openAllPopupsFromRoot(options)` | Ouvre tous les popups trouvés sous une racine (utile pour tout prévisualiser). | 138 |
| `ui_popup.openContractSignPopup(options, additionalIds)` | Ouvre le popup de signature de contrat (composant Vue ContractSign), avec titre, texte, nom du joueur, somme et image configurables, puis d'éventuels popups supplémentaires. | 193 |
| `ui_popup.openDragTimeslipTutorialPopup(options, additionalIds)` | Ouvre l'intro du ticket de chronométrage drag ('v2/dragStripTimeslipIntro') suivie éventuellement d'autres popups. Voir la note sur le bug de la variable slip. | 171 |
| `ui_popup.openDrivingAssistsPopup(options)` | Ouvre le popup « aides à la conduite » (composant Vue GearboxSelect, id 'drivingAssists'). | 152 |
| `ui_popup.openOptionalChallengeSelectionPopup(options)` | Ouvre le popup de sélection de défi facultatif (composant Vue OptionalChallengeSelect). | 162 |
| `ui_popup.openPopupById(id, options)` | Lit puis ouvre un seul popup. | 85 |
| `ui_popup.openPopupEntries(entries, options)` | Envoie des entrées déjà construites à l'UI via guihooks.trigger('OpenTutorialPopup', {popups = entries}). | 77 |
| `ui_popup.openPopupsByIds(ids, options)` | Lit plusieurs popups (en ignorant ceux introuvables) et les ouvre ensemble, dans l'ordre donné. | 91 |
| `ui_popup.readPopupEntryById(id, options)` | Lit le contenu d'un popup : content.json (prioritaire) ou content.html, et renvoie une entrée {id, type='info', isPopup=true, title, text, image, aspectRatio, vueComponent, topics, rows…} ou {id, content, …} pour le HTML. | 15 |
| `ui_popup.resolveAssetPath(basePath, assetPath)` | Construit le chemin d'une ressource : renvoie assetPath tel quel s'il commence par '/', sinon basePath concaténé avec assetPath. | 7 |
| `ui_popup.showDragTreeStagesPopup(options)` | Ouvre en série les popups dragStripStageCar, dragTreeStages, dragTreeCountdown et dragStripTimeslipIntro. | 218 |

### Détail des paramètres

#### `ui_popup.closeTutorialPopup()`

Ferme le popup de tutoriel affiché (hook UI CloseTutorialPopup).

- **renvoie** : boolean Toujours true.

#### `ui_popup.collectPopupIdsFromRoot(root)`

Parcourt récursivement une racine et renvoie les noms de sous-dossiers contenant content.json ou content.html, triés alphabétiquement.

- `root` (*string|nil*) : Dossier racine (défaut '/gameplay/tutorials/pages/v2/') ; un '/' final est ajouté si absent.
- **renvoie** : string[] Liste d'identifiants triée.
- **renvoie** : string La racine normalisée.

#### `ui_popup.openAllPopupsFromRoot(options)`

Ouvre tous les popups trouvés sous une racine (utile pour tout prévisualiser).

- `options` (*table|nil*) : options.root pour la racine ; les autres options sont transmises à openPopupsByIds.
- **renvoie** : boolean false si aucun popup trouvé.

#### `ui_popup.openContractSignPopup(options, additionalIds)`

Ouvre le popup de signature de contrat (composant Vue ContractSign), avec titre, texte, nom du joueur, somme et image configurables, puis d'éventuels popups supplémentaires.

- `options` (*table|nil*) : id, title, text, contractTitle, contractText, userName, money (défaut 10000), image, root ; textes par défaut issus des clés ui.career.tutorial.popup.contractSign.*.
- `additionalIds` (*string[]|nil*) : Popups à ajouter à la suite.
- **renvoie** : boolean Résultat de openPopupEntries.

#### `ui_popup.openDragTimeslipTutorialPopup(options, additionalIds)`

Ouvre l'intro du ticket de chronométrage drag ('v2/dragStripTimeslipIntro') suivie éventuellement d'autres popups. Voir la note sur le bug de la variable slip.

- `options` (*table|nil*) : Passé à openPopupEntries.
- `additionalIds` (*string[]|nil*) : Identifiants de popups à ajouter à la suite.
- **renvoie** : boolean Résultat de openPopupEntries.

#### `ui_popup.openDrivingAssistsPopup(options)`

Ouvre le popup « aides à la conduite » (composant Vue GearboxSelect, id 'drivingAssists').

- `options` (*table|nil*) : Non utilisé.
- **renvoie** : boolean true.

#### `ui_popup.openOptionalChallengeSelectionPopup(options)`

Ouvre le popup de sélection de défi facultatif (composant Vue OptionalChallengeSelect).

- `options` (*table|nil*) : Non utilisé.
- **renvoie** : boolean true.

#### `ui_popup.openPopupById(id, options)`

Lit puis ouvre un seul popup.

- `id` (*string*) : Identifiant du popup.
- `options` (*table|nil*) : Voir readPopupEntryById.
- **renvoie** : boolean false si le contenu est introuvable.

#### `ui_popup.openPopupEntries(entries, options)`

Envoie des entrées déjà construites à l'UI via guihooks.trigger('OpenTutorialPopup', {popups = entries}).

- `entries` (*table[]|nil*) : Liste d'entrées de popup.
- `options` (*table|nil*) : Non utilisé.
- **renvoie** : boolean false si la liste est vide ou nil, sinon true.

#### `ui_popup.openPopupsByIds(ids, options)`

Lit plusieurs popups (en ignorant ceux introuvables) et les ouvre ensemble, dans l'ordre donné.

- `ids` (*string[]*) : Identifiants des popups.
- `options` (*table|nil*) : Voir readPopupEntryById.
- **renvoie** : boolean false si ids est vide/invalide ou si aucun contenu n'a été trouvé.

#### `ui_popup.readPopupEntryById(id, options)`

Lit le contenu d'un popup : content.json (prioritaire) ou content.html, et renvoie une entrée {id, type='info', isPopup=true, title, text, image, aspectRatio, vueComponent, topics, rows…} ou {id, content, …} pour le HTML.

- `id` (*string*) : Identifiant du popup (sous-dossier de la racine).
- `options` (*table|nil*) : root (défaut '/gameplay/tutorials/pages/'), context (contexte de traduction), slip, startingMoney/startMoney, endMoney/money.
- **renvoie** : table|nil L'entrée, ou nil si aucun des deux fichiers n'existe.

#### `ui_popup.resolveAssetPath(basePath, assetPath)`

Construit le chemin d'une ressource : renvoie assetPath tel quel s'il commence par '/', sinon basePath concaténé avec assetPath.

- `basePath` (*string*) : Dossier de base (avec '/' final).
- `assetPath` (*string|nil*) : Chemin relatif ou absolu.
- **renvoie** : string|nil nil si assetPath est nil ou vide.

#### `ui_popup.showDragTreeStagesPopup(options)`

Ouvre en série les popups dragStripStageCar, dragTreeStages, dragTreeCountdown et dragStripTimeslipIntro.

- `options` (*table|nil*) : options.root (défaut '/gameplay/tutorials/pages/v2/').
- **renvoie** : boolean Résultat de openPopupsByIds.

**Évènements UI (guihooks.trigger) :** `CloseTutorialPopup`, `OpenTutorialPopup`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/popup.lua`.*
