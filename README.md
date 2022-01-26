Themes are used to configure the look and feel of login pages and the account management console. It is not recommended
to modify the existing built-in themes, instead you should create a new theme that extends a built-in theme. See the
theme section in the documentation for more details.

## Migration guide for themes (_for future reference_)

### Generalized updating:

1. Keep custom theme folder such as `lahendus` and delete other KeyCloak installation default (e.g. `base`, `keycloak`
   and `keycloak.v2`) folders.
2. Download new [KeyCloak](https://www.keycloak.org/downloads) version and extract `themes` folder.
3. Add content of extracted `themes` folder into this repository (keep the structure).
4. Compare contents of the added folders with the contents of `lahendus` (and other custom themes). Specifically
   compare `account` with `account`, `email` with `email` and `login` with `login`.
5. Do not git commit before finishing migration.

### More specific updating instructions:

* Usually need to compare `lahendus` contents with `base` or `keycloak`.
* Since everything is version controlled, find changed files and lines in `base` or `keycloak` and find out if these
  changes also need to be carried under `lahendus`. You should only check files that also exist under `lahendus`.
* Usually, it is optimal only to edit/add translations that are actually used for message translations. Sometimes there
  might be also new key-value pairs that are not used in our custom theme. Run the KeyCloak and check if any part of the
  UI is only in English (not Estonian) after migration.
* Usually have to migrate existing templates files under `lahendus`. Now the custom edits should* be commented
  everywhere. Therefore, you could replace template file content directly from `base` and/or `keycloak`, inspect
  differences and **reject changes with custom comments** and accept everything else. * Sometimes maybe the developer
  has forgotten to comment custom edits... Migrate with care...
* `theme.properties` and `.css` are the most time-consuming to migrate. Both of the types are dependent on the
  templates.
* For `theme.properties`, check if CSS references are changed: are there any new references in the `base` or `keycloak`
  version? Note that if custom theme has custom CSS reference, then that is also considered a difference. Keep the
  custom reference. It is also possible that template has edited such that it reads a custom property
  from `theme.properties` such as `stylesExternal` in `lahendus/theme.properties`.
* For `theme.properties`, check if there are any new relevant key-value property pairs? For example, version 15
  introduced defining `.css` class names for specific UI elements, and it was required to add it for proper rendering.
* Finally, for custom CSS such as `lahendus/login/resources/css/easy-login.css` check if  `base` or `keycloak` default
  CSS such as `keycloak/login/resources/css/login.css` do not have any changes in existing class names. If there is, you
  might also need to edit these class names in custom CSS. Sometimes class names are refactored and then the old become
  obsolete, e.g. they have no effect.

### Useful tips

* IntelliJ code formatting can make file comparing easier.
* IntelliJ version control via git can also make comparing differences easier.
* Please comment custom edits, otherwise it is really difficult to migrate in the future as it is very difficult to
  distinguish KeyCloak update and custom edit.
* Similar guide for updating KeyCloak itself can be seen [here](https://easy.myjetbrains.com/youtrack/issue/EZ-1338).

