# Change Log

## 0.2.1

- `repository`, `bugs` and `homepage` now point at the new dedicated `pytha-lua-support` repository instead of the API documentation repo. README links to `CHANGELOG.md` and to the bundled GIF now resolve correctly on the Marketplace page.

## 0.2.0

- Added commands **PYTHA: Open API Wiki** and **PYTHA: Open wiki for symbol under cursor** (`Ctrl+F1`, also in the Lua editor context menu).
- Added an XSD for `config.xml` (`schemas/config.xsd`) registered for the Red Hat XML extension. Provides autocomplete and validation for all known `<extension>` types.
- Added a custom linter that warns when `pyloc()` is called with a non-literal argument (`pyloc-non-literal` diagnostic).
- README badges for marketplace version, installs, rating and license.

## 0.1.0

- Added complete stubs for the `pygeo` and `pyplot` namespaces and the `pyloc` localization function.
- Added missing `pytha.*` functions: `analyze_polyline`, `analyze_polyline_ex`, `create_dado`, `create_modulated_profile`, `create_point_light_source`, `create_section`, `update_section`, `delete_section`, `open_pyo`, `set_element_face_light`, `get_group_closed`, `set_group_closed`.
- Added missing `pyio.*` parse/write helpers for CSV, JSON, line-based text and XML, plus `xml_find` / `xml_find_all`.
- Added missing `pyui.*` functions: `end_modal_ok`, `end_modal_cancel`, `reset_content` (deprecated).
- Added missing `pyux.*` functions: `get_material`, `list_materials`, `set_timer_handler`, `start_timer`.
- Introduced specialised `---@class` handles: `section_handle`, `plot_sheet_handle`, `plot_detail_handle`, `directory_handle`, `polyline_segment`, `polyline_chain`, `xml_document`, `xml_element`.
- Activation no longer rewrites workspace settings on every reload — values are only written when they differ.
- PYTHA globals (`pytha`, `pyui`, `pyio`, `pyux`, `pygeo`, `pyplot`, `pyloc`) are now added to `Lua.diagnostics.globals`.

## 0.0.1

- Initial release with stubs for `pytha.*`, `pyui.*`, `pyio.*` and `pyux.*` core functions.
