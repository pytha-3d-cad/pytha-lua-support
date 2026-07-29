---@meta control


---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class control_handle: userdata
local control = {}

---@class control_with_text
local control_with_text = {}

---@class control_list
local control_list = {}


---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class label: control_handle, control_with_text
local label = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class group_box: control_handle
local group_box = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class text_box: control_handle, control_with_text
local text_box = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class text_display: control_handle, control_with_text
local text_display = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class text_spin: control_handle, control_with_text
local text_spin = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class button: control_handle, control_with_text
local button = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class check_box: control_handle
local check_box = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class radio_button: control_handle
local radio_button = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class drop_list: control_handle, control_list
local drop_list = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class list_box: control_handle, control_with_text, control_list
local list_box = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class combo_box: control_handle, control_list
local combo_box = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class pen_list: control_handle
local pen_list = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class linetype_list: control_handle
local linetype_list = {}

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---@class layer_list: control_handle
local layer_list = {}


---**Change the enabled/disabled or active/inactive state of a control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.enable_control)
---@param control control_handle A Handle to the control item to enable
---@param enabled? boolean Optional: new enabled-state, default: `true`
function pyui.enable_control(control, enabled) end

---**Change the enabled/disabled or active/inactive state of a control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.enable_control)
---@param enabled? boolean Optional: new enabled-state, default: `true`
function control:enable_control(enabled) end



---@class popup_menu_item: table
---@field text? string Name of the popup menu item. An empty string will create a menu separator and ignore the following options.
---@field submenu? popup_menu_item A table containing the list of submenu items. It has the same structure as `items`
---@field handler? function A lua function that is invoked when clicking the item.


---**Create a popup menu for the user to select one of multiple options**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_popup_menu)<br>
---@param control control_handle Specifies the control below which the popup is created. nil will attach the popup to the mouse cursor.
---@param items popup_menu_item[] A table containing the list of popup menu items.
---Each popup menu `item` is represented by a table with the following options:<br>
---`item.text`: string - Name of the popup menu item. An empty string will create a menu separator and ignore the following options.<br>
---`item.submenu`: table - A table containing the list of submenu items. It has the same structure as `items`.<br>
---`item.handler`: function - A lua function that is invoked when clicking the item.<br><br>
---Version requirements: This function is available in V26 and above.<br>
function pyui.create_popup_menu(control, items) end


---**Create a popup menu for the user to select one of multiple options**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_popup_menu)<br>
---@param items popup_menu_item[] A table containing the list of popup menu items.
---Each popup menu `item` is represented by a table with the following options:<br>
---`item.text`: string - Name of the popup menu item. An empty string will create a menu separator and ignore the following options.<br>
---`item.submenu`: table - A table containing the list of submenu items. It has the same structure as `items`.<br>
---`item.handler`: function - A lua function that is invoked when clicking the item.<br><br>
---Version requirements: This function is available in V26 and above.<br>
function control:create_popup_menu(items) end




---**Sets the text of a control (for those controls that display text)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_text)
---@param control control_handle Control handle
---@param text string Text-content of the control
function pyui.set_control_text(control, text) end

---**Sets the text of a control (for those controls that display text)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_text)
---@param text string Text-content of the control
function control_with_text:set_control_text(text) end




---**Change the enabled/disabled or active/inactive state of a control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.enable_control)
---@param control control_handle Control handle
---@param enabled? boolean Optional: new enabled-state, default: `true`
function pyui.enable_control(control, enabled) end

---**Change the enabled/disabled or active/inactive state of a control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.enable_control)
---@param enabled? boolean Optional: new enabled-state, default: `true`
function control:enable_control(enabled) end




---**Inserts a new item into a control that displays items (e.g. combo box or drop list)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.insert_control_item)
---@param control control_handle Control handle
---@param text string Text-content of the item
---@param position? integer Optional: 1-based position of the new item. 0 (default) inserts at the end.
function pyui.insert_control_item(control, text, position) end

---**Inserts a new item into a control that displays items (e.g. combo box or drop list)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.insert_control_item)
---@param text string Text-content of the item
---@param position? integer Optional: 1-based position of the new item. 0 (default) inserts at the end.
function control_list:insert_control_item(text, position) end




---**Clears all items from the list of a combo box or a drop-down list** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.clear_control_items)
---@param control control_handle Control handle
function pyui.clear_control_items(control) end

---**Clears all items from the list of a combo box or a drop-down list** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.clear_control_items)
function control_list:clear_control_items() end




---**Selects a given item in a control (for those controls that allow item selection)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_selection)
---@param control control_handle Control handle
---@param index integer Index of the item to be selected
function pyui.set_control_selection(control, index) end

---**Selects a given item in a control (for those controls that allow item selection)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_selection)
---@param index integer Index of the item to be selected
function control_list:set_control_selection(index) end




---**Sets the checked-state of a control (for those controls that have a check state)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_checked)
---@param control control_handle Control handle
---@param state string|boolean New checked state: `true`, `false` or `"checked"`, `"unchecked"`, `"indeterminate"`
function pyui.set_control_checked(control, state) end

---**Sets the checked-state of a control (for those controls that have a check state)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_checked)
---@param state string|boolean New checked state: `true`, `false` or `"checked"`, `"unchecked"`, `"indeterminate"`
function control:set_control_checked(state) end




---**Sets the range of the spin button of an edit control with spin button** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_range)
---@param control control_handle Control handle
---@param bound_min? integer Optional: Lower limit of the spin button range
---@param bound_max? integer Optional: Upper limit of the spin button range
function pyui.set_control_range(control, bound_min, bound_max) end

---**Sets the range of the spin button of an edit control with spin button** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_range)
---@param bound_min? integer Optional: Lower limit of the spin button range
---@param bound_max? integer Optional: Upper limit of the spin button range
function text_spin:set_control_range(bound_min, bound_max) end




---**Sets the `on_change` handler for controls that support it.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler)<br>
---The change event is usually invoked when the user changes the (text-) content of a control. 
---The handler is not invoked if the content is changed by the lua script.
---@param control control_handle A control handle returned by one of the `pyui.create_xxx` control creation functions
---@param func fun(text:string, index?:integer) A lua function that is invoked for every change event
---@return control_handle #The `control` handle is returned again
function pyui.set_on_change_handler(control, func) end

---**Sets the `on_change` handler for the control.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler)<br>
---The change event is usually invoked when the user changes the (text-) content of a control.
---The handler is not invoked if the content is changed by the lua script.
---@param func fun(text:string) A lua function that is invoked for every change event
---@return text_box #The `control` handle is returned again
function text_box:set_on_change_handler(func) end

---**Sets the `on_change` handler for the control.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler)<br>
---Called when the user changes the selected option of a list box<br>
---The handler is not invoked if the content is changed by the lua script.
---@param func fun(text:string, new_index:integer) A lua function that is invoked for every change event
---@return list_box #The `control` handle is returned again
function list_box:set_on_change_handler(func) end

---**Sets the `on_change` handler for the control.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler)<br>
---Called when the user types text or changes the selected option in the drop list
---The handler is not invoked if the content is changed by the lua script.
---@param func fun(text:string, new_index:integer) A lua function that is invoked for every change event
---@return combo_box #The `control` handle is returned again
function combo_box:set_on_change_handler(func) end

---**Sets the `on_change` handler for the control.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler)<br>
---Called when the user changes the selected option of a drop list<br>
---The handler is not invoked if the content is changed by the lua script.
---@param func fun(text:string, new_index:integer) A lua function that is invoked for every change event
---@return drop_list #The `control` handle is returned again
function drop_list:set_on_change_handler(func) end

---**Sets the `on_change` handler for the control.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler)<br>
---Called when the user changes the text in the control.
---The handler is not invoked if the content is changed by the lua script.
---@param func fun(text:string) A lua function that is invoked for every change event
---@return text_spin #The `control` handle is returned again
function text_spin:set_on_change_handler(func) end

---**Sets the `on_change` handler for the control.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler)<br>
---Called when the user changes the selected pen in the drop-list<br>
---The handler is not invoked if the content is changed by the lua script.
---@param func fun(text:string, new_index:integer) A lua function that is invoked for every change event
---@return pen_list #The `control` handle is returned again
function pen_list:set_on_change_handler(func) end

---**Sets the `on_change` handler for the control.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler)<br>
---Called when the user changes the selected linetype in the drop-list<br>
---The handler is not invoked if the content is changed by the lua script.
---@param func fun(text:string, new_index:integer) A lua function that is invoked for every change event
---@return linetype_list #The `control` handle is returned again
function linetype_list:set_on_change_handler(func) end

---**Sets the `on_change` handler for the control.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler)<br>
---Called when the user changes the selected layer in the drop-list<br>
---The handler is not invoked if the content is changed by the lua script.
---@param func fun(text:string, new_index:integer) A lua function that is invoked for every change event
---@return layer_list #The `control` handle is returned again
function layer_list:set_on_change_handler(func) end




---**Sets the `on_click` handler function for controls that support this event.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_click_handler)<br>
---The click event is usually invoked when the user clicks (presses and releases a pointing device) on the control.
---@param control control_handle A control handle returned by one of the `pyui.create_xxx` control creation functions
---@param func fun(state?:boolean) A lua function that is invoked for every change event
---@return control_handle #The `control` handle is returned again
function pyui.set_on_click_handler(control, func) end

---**Sets the `on_click` handler function for controls that support this event.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_click_handler)<br>
---Called when the user clicks a button
---@param func fun() A lua function that is invoked for every change event
---@return button #The `control` handle is returned again
function button:set_on_click_handler(func) end

---**Sets the `on_click` handler function for controls that support this event.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_click_handler)<br>
---Called when the user changes the state of a check box
---@param func fun(state: boolean) A lua function that is invoked for every change event
---@return check_box #The `control` handle is returned again
function check_box:set_on_click_handler(func) end

---**Sets the `on_click` handler function for controls that support this event.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_click_handler)<br>
---When the user changes the selected option of a radio button group,<br>
---the on_click handler for the newly selected option is called.
---@param func fun(state: boolean) A lua function that is invoked for every change event
---@return radio_button #The `control` handle is returned again
function radio_button:set_on_click_handler(func) end




---**Change the visibility of a control (hide and show)** 
---Note that a hidden control still takes space in the dialog layout.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.show_control)
---@param control control_handle Control handle
---@param visibility? boolean Optional: new visibility, default: `true`
function pyui.show_control(control, visibility) end

---**Change the visibility of a control (hide and show)** 
---Note that a hidden control still takes space in the dialog layout.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.show_control)
---@param visibility? boolean Optional: new visibility, default: `true`
function control:show_control(visibility) end




---**Deprecated alias for `pyui.clear_control_items`**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.reset_content)
---@deprecated Use `pyui.clear_control_items` instead.
---@param control control_handle The control whose items shall be cleared
function pyui.reset_content(control) end