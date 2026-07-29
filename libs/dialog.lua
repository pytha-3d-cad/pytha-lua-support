---@meta dialog

---@class first: integer
---@class last: integer

---a table containing 2 integers {first, last}
---@class span
---@field [1] first
---@field [2] last

---A Handle to a dialogue
---@class dialog_handle
local dialog = {}



---**Change the text displayed as the window caption of the dialog** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_window_title)
---@param dialog dialog_handle Dialog whose title is to be changed
---@param text string The new title
function pyui.set_window_title(dialog, text) end

---**Change the text displayed as the window caption of the dialog** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_window_title)
---@param text string The new title
function dialog:set_window_title(text) end




---**Updates the dialog layout after the dialog has been initialized by `run_modal_dialog`** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.update_dialog_layout)
---@param dialog dialog_handle Dialog to be updated
function pyui.update_dialog_layout(dialog) end

---**Updates the dialog layout after the dialog has been initialized by `run_modal_dialog`** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.update_dialog_layout)
function dialog:update_dialog_layout() end




---**Aligns all following items for the specified columns in one row** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_align)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column index or [span](lua://span), describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function pyui.create_align(dialog, col_spec) end

---**Aligns all following items for the specified columns in one row** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_align)
---@param col_spec col_spec The Column index or [span](lua://span), describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function dialog:create_align(col_spec) end




---**Create a button that the user can press**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_button)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function pyui.create_button(dialog, col_spec, text) end

---**Create a button that the user can press**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_button)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text-content of the control
---@return control_handle #A handle to the newly created control
function dialog:create_button(col_spec, text) end




---**Create a check box for the user to select an option (yes or no)** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_check_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text-content of the control
---@return control_handle #A handle to the newly created control
function pyui.create_check_box(dialog, col_spec, text) end

---**Create a check box for the user to select an option (yes or no)** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/dialog.create_check_box)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text-content of the control
---@return control_handle #A handle to the newly created control
function dialog:create_check_box(col_spec, text) end


---@class label_options: table
---@field align? ("left" | "center" | "right")

---**Create a label or static text** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_label)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text-content of the control
---@param options? label_options Optional: a table that may contain the following options:
--- - `align`: Optional alignment of the text `"left"`, `"center"` or `"right"`
---@return control_handle #A handle to the newly created control
function pyui.create_label(dialog, col_spec, text, options) end

---**Create a label or static text** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_label)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text-content of the control
---@param options? label_options Optional: a table that may contain the following options:
--- - `align`: Optional alignment of the text `"left"`, `"center"` or `"right"`
---@return control_handle #A handle to the newly created control
function dialog:create_label(col_spec, text, options) end




---**Create a label or static text that is not related to the next control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_standalone_label)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text-content of the control
---@param options? label_options Optional: a table that may contain the following options:
--- - `align`: Optional alignment of the text `"left"`, `"center"` or `"right"`
---@return control_handle #A handle to the newly created control
function pyui.create_standalone_label(dialog, col_spec, text, options) end

---**Create a label or static text that is not related to the next control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_standalone_label)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text-content of the control
---@param options? label_options Optional: a table that may contain the following options:
--- - `align`: Optional alignment of the text `"left"`, `"center"` or `"right"`
---@return control_handle #A handle to the newly created control
function dialog:create_standalone_label(col_spec, text, options) end




---**Create a combo box where the user can either select a predefined option from a list or enter a custom text** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_combo_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text content of the control
---@return control_handle #A handle to the newly created control
function pyui.create_combo_box(dialog, col_spec, text) end

---**Create a combo box where the user can either select a predefined option from a list or enter a custom text** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_combo_box)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text content of the control
---@return control_handle #A handle to the newly created control
function dialog:create_combo_box(col_spec, text) end



---**Create a drop-down list for the user to select one of multiple options**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_drop_list)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function pyui.create_drop_list(dialog, col_spec) end

---**Create a drop-down list for the user to select one of multiple options**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_drop_list)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function dialog:create_drop_list(col_spec) end




---**Creates a placeholder dialog item to space values in a dialog**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_empty)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function pyui.create_empty(dialog, col_spec) end

---**Creates a placeholder dialog item to space values in a dialog**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_empty)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function dialog:create_empty(col_spec) end




---**Create a foldable group box to present related controls under a common caption** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_foldable_group_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function pyui.create_foldable_group_box(dialog, col_spec, text) end

---**Create a foldable group box to present related controls under a common caption** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_foldable_group_box)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function dialog:create_foldable_group_box(col_spec, text) end




---**Create a group box to present related controls under a common caption** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_group_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function pyui.create_group_box(dialog, col_spec, text) end

---**Create a group box to present related controls under a common caption** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_group_box)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function dialog:create_group_box(dialog, col_spec, text) end




---**Ends or closes a group box created with `create_group_box`, `create_foldable_group_box`, or `create_scrollable_group_box`** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.end_group_box)
---@param dialog dialog_handle Dialog where the control is created
---@return control_handle #A handle to the newly created control
function pyui.end_group_box(dialog) end

---**Ends or closes a group box created with `create_group_box`, `create_foldable_group_box`, or `create_scrollable_group_box`** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.end_group_box)
---@return control_handle #A handle to the newly created control
function dialog:end_group_box() end




---**Create a drop-down list for the user to select a layer. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_layer_list)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function pyui.create_layer_list(dialog, col_spec) end

---**Create a drop-down list for the user to select a layer. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_layer_list)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function dialog:create_layer_list(col_spec) end




---**Create a drop-down list for the user to select a linetype. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_linetype_list)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function pyui.create_linetype_list(dialog, col_spec) end

---**Create a drop-down list for the user to select a linetype. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_linetype_list)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function dialog:create_linetype_list(col_spec) end



---**Create a radio button for the user to select one of multiple options.** 
---The radio button for the first option must have been created with the [create_radio_button](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_radio_button) function. 
---The radio buttons for the other options should be created with this function. 
---Use the [set_control_checked](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_checked) function to initialize the radio button state.
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text-content of the control
---@return control_handle #A handle to the newly created control
function pyui.create_linked_radio_button(dialog, col_spec, text) end

---**Create a radio button for the user to select one of multiple options.** 
---The radio button for the first option must have been created with the [create_radio_button](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_radio_button) function. 
---The radio buttons for the other options should be created with this function. 
---Use the [set_control_checked](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_checked) function to initialize the radio button state.
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text-content of the control
---@return control_handle #A handle to the newly created control
function dialog:create_linked_radio_button(col_spec, text) end




---**Create a list box for the user to select one of multiple options.**
---Use `insert_control_item` to populate the list box with options and `reset_content` to clear the list box.
---Call `set_control_selection` to initialize the selection status.
---Note that radio buttons and drop lists are another way to present multiple options to the user.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_list_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function pyui.create_list_box(dialog, col_spec) end

---**Create a list box for the user to select one of multiple options.**
---Use `insert_control_item` to populate the list box with options and `reset_content` to clear the list box.
---Call `set_control_selection` to initialize the selection status.
---Note that radio buttons and drop lists are another way to present multiple options to the user.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_list_box)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function dialog.create_list_box(col_spec) end




---**Create the Ok button** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_ok_button)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Should be left out to get a consistent translation of "Ok"
---@return control_handle #A handle to the newly created control
function pyui.create_ok_button(dialog, col_spec, text) end

---**Create the Ok button** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_ok_button)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Should be left out to get a consistent translation of "Ok"
---@return control_handle #A handle to the newly created control
function dialog:create_ok_button(col_spec, text) end




---**Create the Cancel button. When the user presses the Cancel button, the plugin is terminated and control returns to PYTHA.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_cancel_button)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Should be left out to get a consistent translation of "Cancel"
---@return control_handle #A handle to the newly created control
function pyui.create_cancel_button(dialog, col_spec, text) end

---**Create the Cancel button. When the user presses the Cancel button, the plugin is terminated and control returns to PYTHA.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_cancel_button)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Should be left out to get a consistent translation of "Cancel"
---@return control_handle #A handle to the newly created control
function dialog:create_cancel_button(col_spec, text) end




---**Create a drop-down list for the user to select a pen. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_pen_list)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function pyui.create_pen_list(dialog, col_spec) end

---**Create a drop-down list for the user to select a pen. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/dialog.create_pen_list)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@return control_handle #A handle to the newly created control
function dialog:create_pen_list(col_spec) end




---**Create a radio button for the user to select one of multiple options** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_radio_button)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function pyui.create_radio_button(dialog, col_spec, text) end

---**Create a radio button for the user to select one of multiple options** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_radio_button)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function dialog:create_radio_button(col_spec, text) end




---**Create a scrollable group box to present related controls under a common caption.**
---This type of control is useful to present a list of controls that would be too long to display on the screen.
---Every scrollable group box must be closed with a call to `end_group_box`.
---All controls created between `create_scrollable_group_box` and `end_group_box` are placed inside the group.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_scrollable_group_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text-content of the control
---@return control_handle #A handle to the newly created control
function pyui.create_scrollable_group_box(dialog, col_spec, text) end

---**Create a scrollable group box to present related controls under a common caption.**
---This type of control is useful to present a list of controls that would be too long to display on the screen.
---Every scrollable group box must be closed with a call to `end_group_box`.
---All controls created between `create_scrollable_group_box` and `end_group_box` are placed inside the group.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_scrollable_group_box)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Initial text-content of the control
---@return control_handle #A handle to the newly created control
function dialog:create_scrollable_group_box(col_spec, text) end




---**Create an editable text box or edit control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_text_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function pyui.create_text_box(dialog, col_spec, text) end

---**Create an editable text box or edit control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_text_box)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function dialog:create_text_box(col_spec, text) end




---**Create a read-only text box** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_text_display)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function pyui.create_text_display(dialog, col_spec, text) end

---**Create a read-only text box** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_text_display)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function dialog:create_text_display(col_spec, text) end




---**Create an editable text box or edit control with spin buttons**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_text_spin)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function pyui.create_text_spin(dialog, col_spec, text) end

---**Create an editable text box or edit control with spin buttons**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/dialog.create_text_spin)
---@param col_spec col_spec The Column `index` or `{first, last}`, describing the placement of the Control item
---@param text? string Optional: Initial text-content of the control
---@return control_handle #A handle to the newly created control
function dialog:create_text_spin(col_spec, text) end




---**Ensures that the layout procedure assigns equal widths to a set of columns in the dialog layout**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.equalize_column_widths)
---@param dialog dialog_handle Dialog where the control is created
---@param columns integer[] Table of `integer` column indices
function pyui.equalize_column_widths(dialog, columns) end

---**Ensures that the layout procedure assigns equal widths to a set of columns in the dialog layout**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.equalize_column_widths)
---@param columns integer[] Table of `integer` column indices
function dialog:equalize_column_widths(columns) end




---**Sets the stretch factor for columns which determines how much columns expand when the dialog is wider than their natural width** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_column_stretch)
---@param dialog dialog_handle Dialog where the control is created
---@param columns integer|integer[] Column index or table of integer column indices
---@param stretch number Stretch factor, default: 1.0
function pyui.set_column_stretch(dialog, columns, stretch) end

---**Sets the stretch factor for columns which determines how much columns expand when the dialog is wider than their natural width** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_column_stretch)
---@param columns integer|integer[] Column index or table of integer column indices
---@param stretch number Stretch factor, default: 1.0
function dialog:set_column_stretch(columns, stretch) end