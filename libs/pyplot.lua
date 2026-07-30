---@meta pyplot

---The `pyplot.*` api functions are useful for creating, importing, modifying and deleting plot sheets and plot objects such as details, sections, text objects and codes.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot)
pyplot = {}

---@class plot_sheet : element_handle
---@class plot_detail : element_handle

---@enum graphic_flags
local graphic_flags_e = {
    [1] = "edges",
    [2] = "solid",
    [3] = "hidden_edges",
    [4] = "hatching",
    [5] = "hatching_islands",
    [6] = "shaded",
    [7] = "material",
    [8] = "shadow"
}


---**Creates a new plot sheet in the current plot album**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.create_sheet)
---Uses the default plot sheet template. If `name` is given and not empty, the sheet is renamed.
---Minimum PYTHA version: V26.
---@param name? string Optional name of the new sheet
---@return plot_sheet sheet A handle to the created sheet
function pyplot.create_sheet(name) end


---**Imports one or more sheets from a plot template file**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.import_sheet)
---Printer settings are only copied from the template if the current album is empty.
---If a non-empty `name` is given, every imported sheet is renamed to it.
---Minimum PYTHA version: V26.
---@param file file_handle The plot template file that should be imported
---@param name? string Optional: rename all imported sheets to this name
---@return plot_sheet[] sheets Imported sheet handles in import order
function pyplot.import_sheet(file, name) end


---**Deletes one or more plot sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.delete_sheet)
---Minimum PYTHA version: V26.
---@param sheet plot_sheet|plot_sheet[] One or more sheet handles to delete
function pyplot.delete_sheet(sheet) end


---@class detail_options
---@field view? "xy"|"xz"|"yz"|"-xy"|"-xz"|"-yz"|"axo"|"persp"
---@field position? [number, number] Detail center on the sheet
---@field size? [number, number] Detail size on the sheet
---@field angle? number Rotation angle of the detail on the sheet
---@field scale? number Explicit detail scale
---@field view_min? [number, number] Optional lower clipping corner in model view coordinates
---@field view_max? [number, number] Optional upper clipping corner in model view coordinates
---@field tilt? number (axo only) Axonometric tilt angle
---@field rotation? number (axo only) Axonometric rotation angle
---@field center? Point (axo/persp only) Center point
---@field eyepoint? Point (persp only) Camera position
---@field clip_near? number Near clipping distance
---@field aspect_ratio? number Width-to-height ratio
---@field aperture? number Aperture angle
---@field layer_visible? table<integer,boolean> Layer visibility mapping
---@field graphic_flags? graphic_flags[] see [graphic_flags](lua://graphic_flags)


---**Inserts one or more plot details on one or more sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_detail)
---If `elements` is omitted, the full model is used. If `scale` is omitted but `view_min`/`view_max`
---are given, the scale is derived from the clipping rectangle and the requested size.
---Default `graphic_flags`: edges, shaded, solid.
---Minimum PYTHA version: V26.
---@param sheet plot_sheet|plot_sheet[] Target plot sheet handle(s)
---@param options detail_options Options controlling view, placement, clipping, scale and appearance:
--- - `view`: string `"xy"`, `"xz"`, `"yz"`, `"-xy"`, `"-xz"`, `"-yz"`, `"axo"` or `"persp"`
--- - `position`: `{number, number}` Detail center on the sheet
--- - `size`: `{number, number}` Detail size on the sheet
--- - `angle`: `number` Rotation angle of the detail on the sheet
--- - `scale`: `number` Explicit detail scale
--- - `view_min`: `{number, number}` Optional lower clipping corner in model view coordinates
--- - `view_max`: `{number, number}` Optional upper clipping corner in model view coordinates
--- - `tilt`: `number` (axo only) Axonometric tilt angle
--- - `rotation`: `number` (axo only) Axonometric rotation angle
--- - `center`: `{number, number, number}` (axo/persp only) Center point
--- - `eyepoint`: `{number, number, number}` (persp only) Camera position
--- - `clip_near`: `number` (persp only) Near clipping distance
--- - `aspect_ratio`: `number` (persp only) Width-to-height ratio
--- - `aperture`: `number` (persp only) Aperture angle
--- - `layer_visible`: `table<integer,boolean>` Layer visibility mapping
--- - `graphic_flags`: array of Display flags, see [graphic_flags](lua://graphic_flags)
---@param elements? element_handle|element_handle[] Optional selection of parts/groups to include
---@return plot_detail[] details Created detail handles
function pyplot.insert_detail(sheet, options, elements) end


---**Deletes one or more plot details**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.delete_detail)
---If a detail is associated with a plotted section, the related plotted section object is deleted as well.
---Minimum PYTHA version: V26.
---@param detail plot_detail|plot_detail[] One or more plot detail handles
function pyplot.delete_detail(detail) end

---@class section_options
---@field position? Point
---@field size? [number, number]
---@field angle? number
---@field scale? number
---@field layer_visible? table<integer, boolean> Layer visibility mapping
---@field graphic_flags? graphic_flags[] Display flags (see [insert_detail](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_detail))

---**Inserts one or more plotted section details on one or more sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_section)
---If `scale` is omitted, a fitting scale is computed from the section bounding box and `size`.
---Default `graphic_flags`: edges, shaded, solid.
---Minimum PYTHA version: V26.
---@param sheet plot_sheet|plot_sheet[] Target plot sheet handle(s)
---@param section section_handle A section handle created with `pytha.create_section`
---@param options? section_options Optional options table:
--- - position: {number, number} Section detail center on the sheet
--- - size: {number, number} Requested section detail size on the sheet
--- - angle: number Rotation angle of the plotted section on the sheet
--- - scale: number Explicit plot scale
--- - layer_visible: table<integer,boolean> Layer visibility mapping
--- - graphic_flags: string[] Display flags (see [insert_detail](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_detail))
---@return plot_detail[] details Created plotted section detail handles
function pyplot.insert_section(sheet, section, options) end

---@class code_options
---@field size? [number, number] Width and height of the code on the plot sheet
---@field position? [number, number] Origin on the sheet
---@field angle? number Rotation angle

---**Inserts a bar code on one or more plot sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_bar_code)
---If `size` is omitted, the default bar code size from the current plot settings is used.
---The bar code text must not be empty.
---Minimum PYTHA version: V26.
---@param sheet plot_sheet|plot_sheet[] Target plot sheet handle(s)
---@param text string The text encoded in the bar code
---@param options? code_options Optional options table:
--- - `size`: `{number, number}` Width and height of the bar code on the sheet
--- - `position`: `{number, number}` Origin on the plot sheet
    --- - `angle`: `number`  Rotation angle
---@return plot_detail[]|nil details Created bar code detail handles, or `nil` on failure
function pyplot.insert_bar_code(sheet, text, options) end



---**Inserts a QR code on one or more plot sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_qr_code)
---If `size` is omitted, the default QR code size from the current plot settings is used.
---The QR code text must not be empty.
---Minimum PYTHA version: V26.
---@param sheet plot_sheet|plot_sheet[] Target plot sheet handle(s)
---@param text string The text encoded in the QR code
---@param options? code_options Optional options table:
--- - `size`: `{number, number}` Width and height of the QR code on the plot sheet
--- - `position`: `{number, number}` Origin on the sheet
--- - `angle`: `number` Rotation angle
---@return plot_detail[]|nil details Created QR code detail handles, or `nil` on failure
function pyplot.insert_qr_code(sheet, text, options) end


---@class text_options
---@field size? number number Text height
---@field position? [number, number] Text origin on the sheet
---@field width? number Fixed text width
---@field angle? number Rotation angle of text in degrees
---@field aspect_ration? number Text width-to-height ratio
---@field orientation? "left"|"center"|"right" Horizontal alignment
---@field font? string Font family name
---@field bold? boolean Bold text
---@field italic? boolean Italic text
---@field underline? boolean Underlined text
---@field pen? integer Pen number


---**Inserts a text object on one or more plot sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_text)
---If `width` is omitted, the text width is determined automatically from content and font settings.
---Minimum PYTHA version: V26.
---@param sheet plot_sheet|plot_sheet[] Target plot sheet handle(s)
---@param text string The text to insert
---@param options? text_options Optional text formatting and placement options:
--- - size: number Text height
--- - position: {number, number} Text origin on the sheet
--- - width: number Fixed text width
--- - angle: number Rotation angle of text in degrees
--- - aspect_ratio: number Text width-to-height ratio
--- - orientation: string Horizontal alignment: `"left"`, `"center"` or `"right"`
--- - font: string Font family name
--- - bold: boolean Bold text
--- - italic: boolean Italic text
--- - underline: boolean Underlined text
--- - pen: integer Pen number
---@return plot_detail[]|nil details Created text detail handles, or `nil` on failure
function pyplot.insert_text(sheet, text, options) end

