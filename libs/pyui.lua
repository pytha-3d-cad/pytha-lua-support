---@meta pyui 
pyui = {}




---@class ClickInfo
---@field coos_vp? table  # Normalized viewport coordinates `{u, v}`
---@field ctrl_key boolean
---@field shift_key boolean
---@field alt_key boolean

---@alias callback_function fun(info: ClickInfo)


---**Displays a simple message to the user with an OK button to dismiss the message window** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.alert)
---@param message string The message to be displayed
function pyui.alert(message) end


---**Play a beep sound to the user**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.beep)
---Note that this function exists because it is sometimes useful during development but that we strongly recommend against its use in production code.
function pyui.beep() end





---**Formats a numeric value to a string. This function is preferentially useful to display length values.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.format_length)
---@param number number Numeric value to be formatted
---@return string The formatted string
function pyui.format_length(number) end




---**Formats a numeric value to a string**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.format_number)
---@param number number Numeric value to be formatted
---@param decimals? integer Optional: Number of decimals to be displayed
---@return string The formatted string
function pyui.format_number(number, decimals) end




---**Parses a string containing one or multiple length values to numbers** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.parse_length)
---@param string string String to be parsed
---@return number, number, ... The parsed numbers
function pyui.parse_length(string) end


---**Parses a string containing one or multiple numeric values to numbers** 
---Note: Multiple numbers that are separated by commata will result in multiple return values.
---To parse length values the use of pyui.parse_length is preferred.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.parse_number)
---@param string string String to be parsed
---@return number, number, ... The parsed numbers
function pyui.parse_number(string) end

---@alias init_func fun(dialog: dialog_handle, ...)

---**Creates and displays a dialog window to enable user interaction with the plugin** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.run_modal_dialog)
---@param init_func init_func An initialization function
---@param ... any Arbitrary additional parameters that are passed to the initialization function
---@return boolean Success status of the dialog execution
---**Note:** The initialization function is invoked as `init_func(dialog, ...)` where `dialog` is a handle for the newly created dialog and `...` are the additional parameters from above.
function pyui.run_modal_dialog(init_func, ...) end


---**Creates and displays a subdialog window to enable user interaction with the plugin** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.run_modal_subdialog)
---@param init_func init_func An initialization function
---@vararg any Arbitrary additional parameters that are passed to the initialization function
---@return string `ok` (default), `cancel` if the dialog has been canceled
---**Remarks:**
---In contrast to [[pyui.run_modal_dialog]], ending the dialog with the close button or [Cancel button](pyui.create_cancel_button) will not raise an error.
---**See also:**
---[[pytha]], [[element handles|pytha Element Handles]], [[pyui.run_modal_dialog]]
function pyui.run_modal_subdialog(init_func, ...) end



---**Wait for the specified amount of time** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.wait)
---This may be useful to display an intermediate (geometric) state to the user. Note that the user can cancel the plugin execution even during wait.
---@param duration? number Waiting time in seconds
function pyui.wait(duration) end


---**Identifies which coordinate is at the given cursor position from a list of 3D coordinates**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.identify_artificial_coordinate)
---@param coos_vp table Normalized viewport coordinates of the mouse cursor. {u, v}
---@param coordinate_list table A list of 3D coordinates. {{x,y,z}, ...}
---@return integer Index of the identified artificial coordinate from `coordinate_list`. `0` if no coordinate was identified.
function pyui.identify_artificial_coordinate(coos_vp, coordinate_list) end


---**Identifies the snapped 3D coordinate at the given cursor position** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.identify_coordinate)
---@param coos_vp table Normalized viewport coordinates of the mouse cursor.
---@param selection_elements? table Optional: A table of element handles that are exclusively considered in the selection. May be `nil`.
---@param excluded_elements? table Optional: A table of element handles that are excluded from the selection. May be `nil`.
---@return table res A table containing the following information about the snapped 3D coordinate:
--- - `res.coos`: `{x,y,z}` Snapped coordinate.
--- - `res.part`: `element_handle` An element handle to the identified part. `nil` if no part was snapped.
--- - `res.normal`: `{x,y,z}` Normal vector of the picked face. `nil` if snapped point is not on a face.
function pyui.identify_coordinate(coos_vp, selection_elements, excluded_elements) end


---**Tests whether the cursor position is within a given area** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.identify_coordinate_in_area)
---@param coos_vp table {u, v} Normalized viewport coordinates of the mouse cursor.
---@param coordinate_list table {{x,y,z}, ...} A list of 3D coordinates defining a polygonal area.
---@return boolean `true` if the projection of `coos_vp` is within the given area, `false` if outside of the area.
function pyui.identify_coordinate_in_area(coos_vp, coordinate_list) end


---**Identifies the corresponding coordinate on an arbitrary plane for the given cursor position** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.identify_coordinate_on_plane)
---@param coos_vp table {u, v} Normalized viewport coordinates of the mouse cursor.
---@param coos_on_plane table {x, y, z} The origin coordinate on the plane.
---@param normal table {x, y, z} The normal vector of the plane.
---@return table {x, y, z} Result coordinate on the given plane.
function pyui.identify_coordinate_on_plane(coos_vp, coos_on_plane, normal) end


---**Identifies the distance of the given cursor position from a coordinate along an arbitrary axis** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.identify_distance_along_direction)
---@param coos_vp table Normalized viewport coordinates of the mouse cursor.
---@param rel_origin table The origin coordinate of the axis.
---@param direction table The direction vector of the axis.
---@return number The distance along the axis in construction units.
function pyui.identify_distance_along_direction(coos_vp, rel_origin, direction) end


---**Identifies the part at the given cursor position** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.identify_part)
---@param coos_vp table Normalized viewport coordinates of the mouse cursor.
---@param selection_elements? table Optional: A table of element handles that are exclusively considered in the selection. May be `nil`.
---@param excluded_elements? table Optional: A table of element handles that are excluded from the selection. May be `nil`.
---@return userdata An element handle of the part at the given cursor position.
function pyui.identify_part(coos_vp, selection_elements, excluded_elements) end


---**Identifies the snapped plane at the given cursor position**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.identify_plane)
---@param coos_vp table Normalized viewport coordinates of the mouse cursor.
---@param selection_elements? table Optional: A table of element handles that are exclusively considered in the selection. May be `nil`.
---@param excluded_elements? table Optional: A table of element handles that are excluded from the selection. May be `nil`.
---@return table res A table containing the following information about the snapped 3D plane:
--- - `res.coos`: `{x,y,z}` Snapped coordinate.
--- - `res.normal`: `{x,y,z}` Normal vector of the picked face. `{0,0,1}` if no face was selected.
function pyui.identify_plane(coos_vp, selection_elements, excluded_elements) end


---**Cancels a modal (sub-) dialog. Equivalent to pressing the Cancel button**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.end_modal_cancel)
---Specific to the current modal environment / dialog and can only be called within a (sub-) dialog.
function pyui.end_modal_cancel() end


---**Ends a modal (sub-) dialog. Equivalent to pressing the OK button**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.end_modal_ok)
---Specific to the current modal environment / dialog and can only be called within a (sub-) dialog.
function pyui.end_modal_ok() end



---**Starts dragging with the left mouse button in the graphics area** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.start_left_drag)
---
---This function will call the `on_left_dragstart` handler as soon as the mouse is in the graphics area.
---This function is specific to the current modal environment / dialog and can only be set within a dialog.
---Set the `on_left_dragstart`, `on_left_dragmove` and `on_left_dragend` handler before calling `start_left_drag`.
function pyui.start_left_drag() end


---**Activates the cursor cross hairs and snapping circle** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.show_cursor_crosshair)
---@param state boolean Set to `true` to activate the cross hairs and snapping circle, `false` to deactivate.
function pyui.show_cursor_crosshair(state) end


---**Sets the `on_right_click` handler for mouse clicks in the graphics area** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_right_click_handler)
---@param func callback_function|nil A lua function that is invoked for every mouse click. `nil` will remove the handler.
function pyui.set_on_right_click_handler(func) end


---**Sets the `on_left_dragstart` handler for mouse dragging in the graphics area.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_left_dragstart_handler)
---@param func function A lua function that is invoked when dragging is started. `nil` will remove the handler.
function pyui.set_on_left_dragstart_handler(func) end


---**Sets the `on_left_click` handler for mouse clicks in the graphics area**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_left_click_handler)
---@param func function A lua function that is invoked for every mouse click. `nil` will remove the handler.
---### Callback
---The parameters to the handler function are as follows:
---`info` table A table containing the following key-value pairs:
---`info.coos_vp` {u, v} Normalized viewport coordinates of the mouse cursor. Can be `nil`.
---`info.ctrl_key` boolean Status of the virtual CTRL key.
---`info.shift_key` boolean Status of the virtual SHIFT key.
---`info.alt_key` boolean Status of the virtual ALT key.
---### Note:
---This handler is specific to the current modal environment / dialog and can only be set within a dialog.
---## Version requirements
---This function is available in V26 and above.
---## See also
---[Control Gallery](pyui-control-gallery), [set_on_right_click_handler](pyux.set_on_right_click_handler), [set_on_left_dragstart_handler](pyux.set_on_left_dragstart_handler), [set_on_left_dragmove_handler](pyux.set_on_left_dragmove_handler), [set_on_left_dragend_handler](pyux.set_on_left_dragend_handler), [show_cursor_crosshair](pyux.show_cursor_crosshair)
function pyui.set_on_left_click_handler(func) end


---**Sets the `on_left_dragend` handler for mouse dragging in the graphics area**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_left_dragend_handler)
---@param func function A lua function that is invoked when dragging is stopped. `nil` will remove the handler.
function pyui.set_on_left_dragend_handler(func) end


---**Sets the `on_left_dragmove` handler for mouse dragging in the graphics area**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_left_dragmove_handler)
---@param func function A lua function that is invoked when the mouse is moved during dragging. `nil` will remove the handler.
function pyui.set_on_left_dragmove_handler(func) end