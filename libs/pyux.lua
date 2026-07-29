---@meta pyux
pyux = {}

---Normalized viewport coordinates `{u, v}`
---@class coos_vp : table

---@class ClickInfo
---@field coos_vp? coos_vp  # Normalized viewport coordinates `{u, v}`
---@field ctrl_key boolean
---@field shift_key boolean
---@field alt_key boolean

---@alias on_click_handler fun(info:ClickInfo)


---**Removes all highlights**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.clear_highlights)
---@param options? table Optional: reserved for future use
---@overload fun()
function pyux.clear_highlights(options) end


---**Activates the cursor cross hairs and snapping circle.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.show_cursor_crosshair)
---@param state boolean Set to true to activate the cross hairs and snapping circle, false to deactivate.
---The cross hairs and snapping circle are recommended when mouse interaction in the graphics area is possible.
function pyux.show_cursor_crosshair(state) end


---Sets the `on_left_click` handler for mouse clicks in the graphics area.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.set_on_left_click_handler)
---@param func on_click_handler
function pyux.set_on_left_click_handler(func) end


---Sets the `on_right_click` handler for mouse clicks in the graphics area.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.set_on_right_click_handler)
---@param func on_click_handler
function pyux.set_on_right_click_handler(func) end


---Sets the `on_left_dragstart` handler for mouse dragging in the graphics area.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.set_on_left_dragstart_handler)
---@param func on_click_handler
function pyux.set_on_left_dragstart_handler(func) end


---Sets the `on_left_dragmove` handler for mouse dragging in the graphics area.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.set_on_left_dragmove_handler)
---@param func on_click_handler
function pyux.set_on_left_dragmove_handler(func) end


---Sets the `on_left_dragend` handler for mouse dragging in the graphics area.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.set_on_left_dragend_handler)
---@param func on_click_handler
function pyux.set_on_left_dragend_handler(func) end


---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_coordinate)
---@param coos_vp coos_vp Normalized viewport coordinates of the mouse cursor.
---@param selection_elements element_handle[]? Optional: A table of element handles that are exclusively considered in the selection.
---@param excluded_elements element_handle[]? Optional: A table of element handles that are excluded from the selection.
---@return {coos: Point, part: element_handle, normal:Vector} res #A table containing the following information about the snapped 3D coordinate:<br>
--- - `res.coos:` `{x,y,z}` Snapped coordinate
--- - `res.part:` `element_handle` An element handle to the identified part. nil if no part was snapped.
--- - `res.normal:` `{x,y,z}` Normal vector of the picked face. nil if snapped point is not on a face.
function pyux.identify_coordinate(coos_vp, selection_elements, excluded_elements) end


---Takes a list of 3D coordinates and identifies which of these coordinates is at the given cursor position.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_artificial_coordinate)<br>
---@param coos_vp coos_vp Normalized viewport coordinates of the mouse cursor.
---@param points Point[] A list of 3D coordinates.
---@return integer #Index of the identified artificial coordinate from coordinate_list. 0 if no coordinate was identified.
function pyux.identify_artificial_coordinate(coos_vp, points) end


---Identifies the part at the given cursor position.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_part)
---@param coos_vp coos_vp Normalized viewport coordinates of the mouse cursor.
---@param selection_elements element_handle[]? Optional: A table of element handles that are exclusively considered in the selection.
---@param excluded_elements element_handle[]? Optional: A table of element handles that are excluded from the selection.
---@return element_handle #An element handle of the part at the given cursor position.
function pyux.identify_part(coos_vp, selection_elements, excluded_elements) end


---Identifies the snapped plane at the given cursor position.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_plane)
---@param coos_vp coos_vp
---@param selection_elements element_handle[]? Optional: A table of element handles that are exclusively considered in the selection.
---@param excluded_elements element_handle[]? Optional: A table of element handles that are excluded from the selection.
---@return {coos:Point, normal:Vector} res #A table containing the following information about the snapped 3D plane:<br>
--- - `res.coos:` `{x,y,z}` Snapped coordinate
--- - `res.normal:` `{x,y,z}` Normal vector of the picked face. nil if snapped point is not on a face.
function pyux.identify_plane(coos_vp, selection_elements, excluded_elements) end


---Tests whether the cursor position is within a given area.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_coordinate_in_area)
---@param coos_vp coos_vp Normalized viewport coordinates of the mouse cursor.
---@param coordinate_list Point[] A list of 3D coordinates defining a polygonal area.
function pyux.identify_coordinate_in_area(coos_vp, coordinate_list) end


---Identifies the distance of the given cursor position from a coordinate along an arbitrary axis.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_distance_along_direction)
---@param coos_vp coos_vp Normalized viewport coordinates of the mouse cursor.
---@param rel_origin Point The origin coordinate of the axis.
---@param direction Vector The direction vector of the axis.
---@return number #The distance along the axis in construction units.
function pyux.identify_distance_along_direction(coos_vp, rel_origin, direction) end


---Identifies the corresponding coordinate on an arbitrary plane for the given cursor position.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_coordinate_on_plane)
---@param coos_vp coos_vp Normalized viewport coordinates of the mouse cursor.
---@param coos_on_plane Point The origin coordinate on the plane.
---@param normal Vector The normal vector of the plane.
function pyux.identify_coordinate_on_plane(coos_vp, coos_on_plane, normal) end


---**Returns the file handle to a `.pyo` in the PYTHA library folder** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.get_library_handle)
---@param lib_type string Must be 'library'. Reserved for future use.
---@param folder? string Optional: Name of a folder in the PYTHA library.
---@param subfolder? string Optional: Name of a subfolder in `folder`
---@return file_handle #The first `.pyo` file in the specified folder. `nil` if no `.pyo` file is found at the given location.
function pyux.get_library_handle(lib_type, folder, subfolder) end


---**Highlights a coordinate in the scene**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.highlight_coordinate)
---@param coordinate table 3D coordinate to be highlighted
---@param options? table Optional: reserved for future use
function pyux.highlight_coordinate(coordinate, options) end


---**Highlights a single element or a table of elements** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.highlight_element)
---@param element element_handle|table A single element handle or a table of element handles
---@param options? table Optional: reserved for future use
function pyux.highlight_element(element, options) end


---@class highlight_line_options
---@field pen? 1|2|3 #The index of the decoration pen. The values can be `1` (default), `2` or `3`.
---@field arrow? boolean A boolean that specifies whether the line is drawn with an arrow at its end coordinate: `false` (default) or `true`.
---@field tics? boolean A boolean that specifies whether the line is drawn with tic marks similar to a ruler: `false` (default) or `true`.
---@field text? string A string to be displayed above the line, intended to indicate the distance between two points. May be 'nil'.


---**Highlights a line given by two 3D coordinates in the scene in the color of the decoration pens**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.highlight_line)
---@param start_point Point 3D start coordinate of the line
---@param end_point Point 3D end coordinate of the line
---@param options? highlight_line_options Optional: a table that may contain the following [options](lua://highlight_line_options):
--- - `options.pen` integer The index of the decoration pen. The values can be `1` (default), `2` or `3`.
--- - `options.arrow` A boolean that specifies whether the line is drawn with an arrow at its end coordinate: `false` (default) or `true`.
--- - `options.tics` A boolean that specifies whether the line is drawn with tic marks similar to a ruler: `false` (default) or `true`.
--- - `options.text` A string to be displayed above the line, intended to indicate the distance between two points. May be 'nil'.
function pyux.highlight_line(start_point, end_point, options) end


---**Pick a coordinate in the scene** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.select_coordinate)
---@param points_only? boolean `true`: function only returns when an object point was picked. `false`: any coordinate can be picked (default)
---@param text? string Text that will be displayed in the input prompt during the selection
---@param options? table Optional: reserved for future use
---@return Point|nil {x,y,z} Coordinate of the picked point. `nil` if operation was cancelled.
function pyux.select_coordinate(points_only, text, options) end


---Opens the material selector and returns a handle to a material.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.select_material)
---@param old_material? material_handle Optional: handle to a material
---@return material_handle The new material handle
function pyux.select_material(old_material) end


---**Lists all materials from a material file and returns them as material element handles**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.list_materials)
---The function loads the material file if necessary and returns only those materials whose
---stored material path matches the given material file.
---@param material_file_handle directory_handle Handle to a material file (`.pymat`)
---@return material_handle[] materials Array of element handles of all materials in the material file
function pyux.list_materials(material_file_handle) end


---**Returns a material element handle for a material with the given name from a material file**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.get_material)
---If multiple loaded materials share the same name, only a material whose stored material path
---matches the given material file is returned.
---@param material_file_handle directory_handle Handle to a material file (`.pymat`)
---@param material_name string Name of the material inside the material file
---@return material_handle|nil material Element handle of the material, or `nil` if not found
function pyux.get_material(material_file_handle, material_name) end


---**Allows the user to select one or multiple parts in the scene**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.select_part)
---@param allow_multi_selection boolean `false`: a single part can be selected. `true`: multiple parts can be selected
---@param text? string Text that will be displayed in the input prompt during the selection
---@param options? table Optional: reserved for future use
---@return table|nil A table containing the element handles of the selected parts or nil if operation was cancelled
---@overload fun(): table|nil
function pyux.select_part(allow_multi_selection, text, options) end


---**Opens the file selector and returns a handle to a `.pyo` file** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.select_pyo)
---@param old_file? file_handle Optional: handle to a `.pyo` file
---@return file_handle #The new file handle. `nil` if selection was cancelled.
---By passing old_file to the function, the file explorer will open the directory containing old_file.
function pyux.select_pyo(old_file) end


---**Opens the file selector and returns a list of handles to all `.pyo` files in the given folder** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.list_pyos)
---@param folder? file_handle Optional: handle to a directory or file
---@param rebrowse? boolean Optional: open the folder selection dialog also when `folder` is specified
---@return file_handle[]|nil #Table containing file handles to all `.pyo` files in the selected folder. `nil` if selection was cancelled.
---By passing `folder` to the function, the file explorer will list all .pyo files in folder.<br>
---Otherwise, the folder selection dialog will open.
function pyux.list_pyos(folder, rebrowse) end


---**Sets the `timer` handler for timer events in the graphics area**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.set_timer_handler)
---Specific to the current modal environment / dialog and can only be set within a dialog.
---Passing `nil` will remove the handler and also stop a running timer for the given id.
---Use `pyux.start_timer` to start the timer.
---Callback signature: `function on_timer_handler(info)` where `info` is `{timer_id, tick}`.
---Available from V26.
---@param func fun(info: {timer_id: integer, tick: integer})|nil A Lua function invoked on timer events. `nil` removes the handler
---@param id? integer Optional timer id (default `0`)
function pyux.set_timer_handler(func, id) end



---**Starts a timer that periodically triggers the `timer` event**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.start_timer)
---The timer runs until it is stopped by removing the handler via `pyux.set_timer_handler(nil, id)`.
---Available from V26.
---@param seconds number Timer interval in seconds. Must be `> 0`
---@param id? integer Optional timer id (default `0`)
function pyux.start_timer(seconds, id) end
