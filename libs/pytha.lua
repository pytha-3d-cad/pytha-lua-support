---@meta

-- Define the `pytha` namespace
pytha = {}
pyui = {}
pyio = {}
pyux = {}
pygeo = {}
pyplot = {}

---@class Origin A table with three numbers `{x, y, z}` where:
---@field  x number The X dimension.
---@field  y number The Y dimension.
---@field  z number The Z dimension.

---@class dialog_handle
---@class control_handle
---@class element_handle
---@class file_handle
---@class material_handle
---@class directory_handle
---@class section_handle : element_handle
---@class plot_sheet_handle : element_handle
---@class plot_detail_handle : element_handle

---@class polyline_segment
---@field r? number Radius of the arc (arc segments only)
---@field orientation? "cw"|"ccw" Clockwise or counter-clockwise orientation of the arc
---@field select_arc? "small"|"large" Selection of the small or large arc
---@field angle? number Angle of the arc, positive for counter-clockwise arcs
---@field radius? number Radius of the arc (input-side alternative to `r`)
---@field bulge? number Maximum distance between the secant and the arc, positive for CCW arcs
---@field segments? integer Number of edge segments used for arc segmentation

---@class polyline_chain
---@field [1] "open"|"closed" Whether the chain is closed (also accessible as `type`)
---@field [2] table Coordinates of the chain points `{{x,y,z}, ...}` (also accessible as `points`)
---@field [3]? polyline_segment[] Segment specifications (only in `_ex` variants)

---@class xml_document
---@field root xml_element The root element of the xml document

---@class xml_element
---@field local_name string The local name of the element tag
---@field prefix string The prefix of the element tag
---@field namespace_uri string The namespace URI for this element
---@field qualified_name string `prefix.local_name`
---@field attributes table<string,string> The xml attributes of the element
---@field namespaces table<string,string> All namespaces declared in this element
---@field children table The xml child nodes (also accessible via numeric index)
---@field parent xml_element The parent element
---@field text string The text between the start tag and the first child or end tag

local dialog = {}
local control = {}

local element = {}


---**Loads a lua table from PYTHA's local storage**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.load_values)
---@param name string Name under which the values have been stored
---@return table|nil A table of values if successful, otherwise `nil`
function pyio.load_values(name) end


---**Saves or stores a lua table to a local storage dedicated to this plugin** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.save_values)
---@param name string Name under which the values will be stored (see remarks)
---@param values table The table containing the values (see remarks)
---@return boolean `true` for success, `false` if the file cannot be opened
function pyio.save_values(name, values) end



---**Creates the Boolean difference of a set of parts (geometrically subtracting the parts)** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.boole_part_difference)
---@param base_element userdata The part from which others are subtracted
---@param subtract_elements table A table of element handles of all the parts that should be subtracted
---@return userdata The element handle of the resulting part
function pytha.boole_part_difference(base_element, subtract_elements) end



---**Punches a set of parts with a given template** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.boole_part_template)
---Similar to the `Part tools I -> Boolean -> Template` function in the PYTHA user interface.
---@param base_elements table A table of element handles of all the parts to be punched
---@param template_elements table A table of element handles of all the template face parts
---@param in_or_out string "inside" or "outside"
---@return nil
function pytha.boole_part_template(base_elements, template_elements, in_or_out) end



---**Creates the Boolean union of a set of parts (geometrically merging the parts). The result is a single part.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.boole_part_union)
---@param elements table A table of element handles of all the parts that should be merged
---@return userdata The element handle of the resulting part
function pytha.boole_part_union(elements) end



---**Copies a single element or a table of elements by a given distance** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.copy_element)
---@param element element_handle|table A single element handle or a table of element handles
---@param distance table Displacement of the copy in x, y, z
---@param copies? integer Optional: number of copies (default: 1)
---@return table A table containing the element handles of the newly created elements
function pytha.copy_element(element, distance, copies) end




---**Creates a block (mathematically a [cuboid](https://en.wikipedia.org/wiki/Cuboid)) in PYTHA as new part.**
---Similar to the `Parts -> Block` function in the PYTHA user interface.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_block)
---@param length number Length of the block (in x-direction)
---@param width number Width of the block (in y-direction)
---@param height number Height of the block (in z-direction)
---@param origin? table Optional: origin point of the block
---@param options? table Optional: a table that may contain the following options:
--- - `u_axis`: Local coordinate u-axis for the orientation of the block
--- - `v_axis`: Local coordinate v-axis for the orientation of the block
--- - `w_axis`: Local coordinate w-axis for the orientation of the block
---@return userdata An element handle of the newly created part
function pytha.create_block(length, width, height, origin, options) end



---**Creates a face circle in PYTHA as a new face-part**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_circle)
---@param radius number Radius of the circle
---@param origin? table Optional: center point of the circle
---@param options? table Optional: a table that may contain the following options:
---  - `u_axis`: table Local coordinate u-axis for the orientation of the circle
---  - `v_axis`: table Local coordinate v-axis for the orientation of the circle
---  - `w_axis`: table Local coordinate w-axis for the orientation of the circle
---  - `segments`: number Segments of the circle
---@return userdata An element handle of the newly created part
function pytha.create_circle(radius, origin, options) end



---**Creates an edge circle in PYTHA as a new part** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_circle_edges)
---@param radius number Radius of the circle
---@param origin? table Optional: center point of the circle
---@param options? table Optional: a table that may contain the following options:
---  - `u_axis`: table Local coordinate u-axis for the orientation of the circle
---  - `v_axis`: table Local coordinate v-axis for the orientation of the circle
---  - `w_axis`: table Local coordinate w-axis for the orientation of the circle
---  - `segments`: table Segments of the circle
---@return userdata An element handle of the newly created part
function pytha.create_circle_edges(radius, origin, options) end



---**Creates a cylinder in PYTHA as a new part**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_cylinder)
---@param height number Height of the cylinder (in z-direction)
---@param radius number Radius of the cylinder
---@param origin? table Optional: origin point of the cylinder
---@param options? table Optional: a table that may contain the following options:
---  - `u_axis`: {x, y, z} Local coordinate u-axis for the orientation of the cylinder
---  - `v_axis`: {x, y, z} Local coordinate v-axis for the orientation of the cylinder
---  - `w_axis`: {x, y, z} Local coordinate w-axis for the orientation of the cylinder
---  - `segments`: number Circle segments of the cylinder
---  - `height_segments`: number Height sections of the cylinder
---  - `top_radius`: number Top radius of the cylinder
---@return userdata An element handle of the newly created part
function pytha.create_cylinder(height, radius, origin, options) end



---**Creates a new reference point for a single element or a table of elements** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_element_ref_point)
---@param element element_handle|table A single element handle or a table of element handles
---@param coordinate table Coordinate at which the reference point will be created
---@return number The number of reference the last element in the list has assigned
function pytha.create_element_ref_point(element, coordinate) end



---**Creates a new group and puts a single element or a table of elements into this group.**
---Similar to the `Attributes -> Group` function in the PYTHA user interface.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_group)
---@param element element_handle|table A single element handle or a table of element handles
---@param options? table Optional: a table that may contain the following option:
---  - options.name: string - Name of the group to create
---@return element_handle An element handle to the newly created group
function pytha.create_group(element, options) end



---**Creates a NGO (non-geometric object)** 
---A NGO can carry attributes and will be displayed in the parts list, but has no geometric representation in the scene.
---Similar to the `Attributes -> NGO Define` function in the PYTHA user interface.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_ngo)
---@param attributes table Table of attributes with the `key` as the [attribute ID](pytha-Attributes) and the `value` as the attribute value
---@return userdata An element handle of the newly created NGO
function pytha.create_ngo(attributes) end



---**Creates a polygon face in PYTHA as a new part**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_polygon)
---
---Similar to the `Faces -> Polygon` function in the PYTHA user interface.
---
---Note: If the polygon contains holes or if the outline contains arcs, use the [`create_polygon_ex`](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_polygon_ex) function instead.
---@param points {{u,v [,w]}, ...} Coordinates of the loop points
---@param origin? {x,y,z} Optional: offset of the whole polygon
---@param options? table Optional: a table that may contain the following options:
---| `options.u_axis` {x,y,z} Local coordinate u-axis for the orientation of the plane
---| `options.v_axis` {x,y,z} Local coordinate v-axis for the orientation of the plane
---| `options.w_axis` {x,y,z} Local coordinate w-axis for the orientation of the plane-normal
---| `options.clean_face` string `"clean"` (default), `"dont_clean"`; eliminates self-intersections from polygon
---@return userdata An element handle of the newly created part
function pytha.create_polygon(points, origin, options) end



--- Similar to the `Faces -> Polygon` function in the PYTHA user interface.
--- [View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_polygon_ex)
---@param loop_points table Coordinates of the loop points: {{u,v [,w]}, ...}
---@param loop_segments? table Optional specification of the segments, where each segment may be a table to indicate the following options:
--- - `angle`: number - Angle of the arc, positive for counter-clockwise arcs
--- - `radius`: number - Radius of the arc
--- - `orientation`: "cw" or "ccw" - For radius specification: clockwise or counter-clockwise orientation
--- - `select_arc`: "small", "large" - For radius specification: selection of the small or large arc with that radius and orientation
--- - `bulge`: number - Maximum distance between the secant and the arc, positive for counter-clockwise arcs
--- - `segments`: integer - Number of edge-segments for this polyline-segment
---@param origin? table Optional: offset of the whole polyline {x,y,z}
---@param options? table Optional: a table that may contain the following options:
--- - `u_axis`: {x,y,z} - Local coordinate u-axis for the orientation of the plane
--- - `v_axis`: {x,y,z} - Local coordinate v-axis for the orientation of the plane
--- - `w_axis`: {x,y,z} - Local coordinate w-axis for the orientation of the plane-normal
---@return userdata An element handle of the newly created part
function pytha.create_polygon_ex(loop_points, loop_segments, origin, options) end




---**Creates a polyline or chain of edges in PYTHA as new part**
---Similar to the `Edges -> Polyline` function in the PYTHA user interface.
---Note: If the polyline contains arcs, use the [`create_polyline_ex`](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_polyline_ex) function instead.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_polyline)
---@param type string `"open"` or `"closed"` indicates whether the polyline is closed.
---@param points table `{{u,v [,w]}, ...}` Coordinates of the points. Note: for a closed polyline, do not supply the initial point twice. Closing is automatic.
---@param origin? table `{x,y,z}` Optional: offset for the whole polyline.
---@param options? table Optional: a table that may contain the following options:
---| `options.u_axis` `{x,y,z}` Local coordinate u-axis for the orientation of the plane.
---| `options.v_axis` `{x,y,z}` Local coordinate v-axis for the orientation of the plane.
---| `options.w_axis` `{x,y,z}` Local coordinate w-axis for the orientation of the plane-normal.
---@return userdata An element handle of the newly created part.
function pytha.create_polyline(type, points, origin, options) end



---**Creates a polyline or a chain of edges** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_polyline_ex)
---Similar to the `Edges -> Polyline` function in the PYTHA user interface.
---@param type string `"open"` or `"closed"` indicates whether the polyline is closed
---@param points table `{{u,v [,w]}, ...}` Coordinates of the points
---@param segments? table `{segment_1, segment_2, ...}` Optional: specification of the segments, where each segment may be a table to indicate the following parameters:
--- - `segment.angle` number Angle of the arc, positive for counter-clockwise arcs
--- - `segment.radius` number Radius of the arc (if the radius is given, `orientation` and `select_arc` should be used to specify the arc uniquely)
--- - `segment.orientation` string `"cw"` or `"ccw"` When `radius` is specified: clockwise or counter-clockwise orientation
--- - `segment.select_arc` string `"small"`, `"large"` When `radius` is specified: selection of the small or large arc with that radius and orientation
--- - `segment.bulge` number Maximum distance between the secant and the arc, positive for counter-clockwise arcs
--- - `segment.normal` table `{x,y,z}` Only relevant for `type = "open"`: Normal direction for the arc
---@param origin? table `{x,y,z}` Optional: offset for the whole polyline
---@param options? table `{...}` Optional: a table that may contain the following options:
--- - `options.u_axis` table `{x,y,z}` Local coordinate u-axis for the orientation of the plane
--- - `options.v_axis` table `{x,y,z}` Local coordinate v-axis for the orientation of the plane
--- - `options.w_axis` table `{x,y,z}` Local coordinate w-axis for the orientation of the plane-normal
---@return userdata An element handle of the newly created part
function pytha.create_polyline_ex(type, points, segments, origin, options) end



---**Creates a profile (mathematically a [straight prism](https://en.wikipedia.org/wiki/Prism_(geometry))) in PYTHA as new part.** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_profile)
---@param base_part element_handle The face (or faces) in the base part is used as the cross section of the profile
---@param height number Height of the profile, perpendicular to the face orientation
---@param options? table Optional: reserved for future use.
---@return table A table containing the element handles of the newly created parts (Often it is just one)
function pytha.create_profile(base_part, height, options) end



---**Creates a rectangle in PYTHA as new face-part** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_rectangle)
---@param length number Length of the rectangle (in u direction)
---@param width number Width of the rectangle (in v direction)
---@param origin? table Optional: lower left corner of the rectangle
---@param options? table Optional: a table that may contain the following options:
---  - `u_axis`: table Local coordinate u-axis for the orientation of the plane
---  - `v_axis`: table Local coordinate v-axis for the orientation of the plane
---  - `w_axis`: table Local coordinate w-axis for the orientation of the plane-normal
---@return userdata An element handle of the newly created part
function pytha.create_rectangle(length, width, origin, options) end



---**Creates a rectangle in PYTHA as new edge-part**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_rectangle_edges)
---@param length number Length of the rectangle (in u direction)
---@param width number Width of the rectangle (in v direction)
---@param origin? table Optional: lower left corner of the rectangle
---@param options? table Optional: a table that may contain the following options:
---| `u_axis` {x,y,z} Local coordinate u-axis for the orientation of the plane
---| `v_axis` {x,y,z} Local coordinate v-axis for the orientation of the plane
---| `w_axis` {x,y,z} Local coordinate w-axis for the orientation of the plane-normal
---@return userdata An element handle of the newly created part
function pytha.create_rectangle_edges(length, width, origin, options) end



---**Creates a sphere in PYTHA as a new part**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_sphere)
---@param radius number Radius of the sphere
---@param origin? table Optional: center point of the sphere
---@param options? table Optional: a table that may contain the following options:
---  - `u_axis` `{x,y,z}`: Local coordinate u-axis for the orientation of the sphere
---  - `v_axis` `{x,y,z}`: Local coordinate v-axis for the orientation of the sphere
---  - `w_axis` `{x,y,z}`: Local coordinate w-axis for the orientation of the sphere
---  - `segments` `{x,y,z}`: Longitude segments of the sphere
---  - `latitude_segments` `{x,y,z}`: Latitude segments of the sphere
--- Returns elements from the positive or negative hemisphere depending on `options.type`.
---@return userdata An element handle of the newly created part
function pytha.create_sphere(radius, origin, options) end



---**Creates a sweep along a line in PYTHA as a new part**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_sweep)
---@param base_part element_handle The face (or faces) in the base part is used as the cross section of the profile
---@param cross_section element_handle|table Either an element handle to a face-part or a table specifying the cross section:
--- - `type`: string Specifies the shape of the cross section: `"rectangle"` or `"circle"`
--- - `length`: number For rectangles: Length
--- - `width`: number For rectangles: Width
--- - `radius`: number For circles: Radius
--- - `segments`: number For circles: Optional: Number of segments
---@param options? table Optional: a table that may contain the following options:
--- - `keep_vertical`: number `0` (default), `1`: Keeps the cross section upright (relative to the z-axis)
--- - `single_parts`: number `0` (default), `1`: Creates separate parts for each edge of `base_part`
---@return element_handle[] A table containing the element handles of the newly created parts (Often it is just one).
function pytha.create_sweep(base_part, cross_section, options) end



---**Cuts a single element or a table of elements at a given plane into two parts**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.cut_element)
---@param element element_handle|table A single element handle or a table of element handles
---@param origin table Coordinates giving the position of the cutting plane
---@param axis table Normal vector of the cutting plane
---@param options? table Optional: may contain:
---| options.type string `"keep_both"` (default), `"keep_front"`, or `"keep_back"`
---@return element_handle[] A table of element handles
function pytha.cut_element(element, origin, axis, options) end



---**Deletes a single element or a table of elements**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.delete_element)
---@param element element_handle|table A single element handle or a table of element handles
function pytha.delete_element(element) end



---**Deletes a reference point for a single element or a table of elements**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.delete_element_ref_point)
---@param element element_handle|table A single element handle or a table of element handles
---@param index? integer Optional: Index of the reference point to delete
---@return nil
---If `index` is not specified or set to `-1`, all reference points of `element` will be deleted.
---Deleting a reference point will shift all higher indices one forward.
function pytha.delete_element_ref_point(element, index) end



---**Dissolves a single group or a table of groups without deleting their members** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.dissolve_group)
---@param group element_handle|table A single element handle or a table of element handles
---@return nil
function pytha.dissolve_group(group) end



---**Enumerates all parts in the model** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.enumerate_parts)
---This function should be used in a lua `for ... in ... do` loop.
---@return userdata An element handle of each part
function pytha.enumerate_parts() end



---**Extends a single element or a table of elements to a given size** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.extend_element)
---@param element element_handle|table A single element handle or a table of element handles
---@param displacement table Table giving the displacement in each direction
---@param options? table Optional: a table that may contain the following options:
--- - `u_axis`: Local coordinate u-axis for the extension
--- - `v_axis`: Local coordinate v-axis for the extension
--- - `w_axis`: Local coordinate w-axis for the extension
--- - `pivot`: Table giving the orientation of the pivot point. The values can be `"mid"` (default), `"low"` or `"high"`
--- - `u_divisions`: A single value or a table of values giving the division coordinates in the `u`-direction
--- - `v_divisions`: A single value or a table of values giving the division coordinates in the `v`-direction
--- - `w_divisions`: A single value or a table of values giving the division coordinates in the `w`-direction
function pytha.extend_element(element, displacement, options) end



---**Retrieves the predefined list values for an attribute** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_attribute_list_values)
---@param attribute attribute_ID The [Attribute ID](pytha-Attributes)
---@return table A table containing the list values of the attributes
function pytha.get_attribute_list_values(attribute) end

-- Remarks:
-- The list values can contain comments separated by a semicolon `;`. These comments are not part of the attribute suggestions, e.g. `Attribute Value 1; this is a comment` should be trimmed to `Attribute Value 1` prior to assignment to an element.



---**Retrieves an attribute of an element** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_element_attribute)
---@param element element_handle|table A single element handle or a table of element handles
---@param attribute attribute_ID The Attribute ID
---@return string The value of the attribute of element
function pytha.get_element_attribute(element, attribute) end

function element:get_element_attribute(attribute) end



---**Gets the bounding box coordinates for a single element or a table of elements**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_element_bounding_box)
---@param element element_handle|table A single element handle or a table of element handles
---@param options? table Optional: a table that may contain the following options:
---  - options.u_axis: {x, y, z} Local coordinate u-axis for the orientation of the bounding box
---  - options.v_axis: {x, y, z} Local coordinate v-axis for the orientation of the bounding box
---  - options.w_axis: {x, y, z} Local coordinate w-axis for the orientation of the bounding box
---@return table {{x, y, z}, {x, y, z}} A table with two point coordinates: the minimal x/y/z coordinates and the maximal x/y/z coordinates
function pytha.get_element_bounding_box(element, options) end



---**Gets the smallest group containing all given elements**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_element_common_group)
---@param elements element_handle|table A single element handle or a table of element handles
---@return userdata|nil common_group An element handle of the group. `nil` if no such group exists.
---`common_group` may well be included in `elements`, as this allows to find the topmost group of e.g. an imported pyo.
function pytha.get_element_common_group(elements) end



---**Gets the history information from an element. The history information must have been set with [set_element_history](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_element_history).**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_element_history)
---@param element element_handle|table A single element handle or a table of element handles
---@return table Table containing the history information
---@return string|nil id supplied to get_element_history or nil if the id is empty
function pytha.get_element_history(element) end

function element:get_element_history() end



---**Gets the parent group of an element** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_element_parent_group)
---@param element element_handle A single element handle
---@return element_handle The element handle of the parent group. `nil` if the element has no parent group.
function pytha.get_element_parent_group(element) end



---**Gets the reference point coordinates for a single element or a table of elements** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_element_ref_point_coordinates)
---@param element element_handle|table A single element handle or a table of element handles
---@return table A table of point coordinates
function pytha.get_element_ref_point_coordinates(element) end



---**Gets the name of the element type** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_element_type)
---@param element element_handle Element handle to the element of question
---@return string One of the following values `"part"`, `"group"`, `"ngo"`
function pytha.get_element_type(element) end



---**Gets the physical volume of a single element or a table of elements in construction units** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_element_volume)
---@param element element_handle|table A single element handle or a table of element handles
---@return number The physical volume of the element
function pytha.get_element_volume(element) end



---**Gets all descendants of a group, both parts and groups** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_group_descendants)
---@param group element_handle A single element handle to a group
---@return table A table containing the element handles of the descendants of `group`.
function pytha.get_group_descendants(group) end



---**Gets all members of a group, both parts and groups** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_group_members)
---@param group element_handle A single element handle to a group
---@return table A table containing the element handles of the members of `group`.
function pytha.get_group_members(group) end



---**Gets the replace properties for a group**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_group_replace_properties)
---@param element element_handle A single element handle to a group
---@return table A table with the following key-value pairs:
--- - `origin_u`: `low`, `mid` or `high` - Orientation of the replacement origin in u-direction: `mid`: (default) center, `low`: left, `high`: right
--- - `origin_v`: `low`, `mid` or `high` - Orientation of the replacement origin in v-direction: `mid`: (default) center, `low`: front, `high`: back
--- - `origin_w`: `low`, `mid` or `high` - Orientation of the replacement origin in w-direction: `mid`: (default) center, `low`: bottom, `high`: top
--- - `zoom_u`: `boolean` - A boolean that specifies whether the group can be stretched in u-direction: `false` (default) or `true`
--- - `zoom_v`: `boolean` - A boolean that specifies whether the group can be stretched in v-direction: `false` (default) or `true`
--- - `zoom_w`: `boolean` - A boolean that specifies whether the group can be stretched in w-direction: `false` (default) or `true`
function pytha.get_group_replace_properties(element) end



---**Retrieves the length unit and the conversion factor to meters set in the PYTHA user interface**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_length_unit)
---@return string, number The name of the length unit and the conversion factor to meters.
---To persistently store and load length values with load_values and save_values it is recommended to convert these values to a standard unit when saving and to the active length unit when loading.
function pytha.get_length_unit() end



---**Gets a line from the PYTHA project header** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_project_header)
---@param line integer Project header line number to retrieve. Must be between 1 and 12.
---@return string, string The name and the value of the project header line
function pytha.get_project_header(line) end



---**Get the evaluated value of a user variable** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_user_variable)
---@param name string The name of the user variable. The name must be a valid lua identifier.
---@return string|number|nil Evaluated value of the variable. The result `value` may be a string or a number. If the variable does not exist or if it cannot be evaluated, `nil` is returned.
function pytha.get_user_variable(name) end



---**Imports a `.pyo` file into the project** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.import_pyo)
---@param file file_handle A handle to a .pyo file
---@param origin? table Optional: origin point where part is placed
---@param options? table Optional: a table that may contain the following options:
---  - `u_axis`: Local coordinate u-axis for the orientation of `file`
---  - `v_axis`: Local coordinate v-axis for the orientation of `file`
---  - `w_axis`: Local coordinate w-axis for the orientation of `file`
---@param parametrics? table Table of parametrics with the `key` as the parametric specifier and the `value` as the value
---@return table A table containing the element handles of the newly imported parts
---@overload fun(file: file_handle): table
function pytha.import_pyo(file, origin, options, parametrics) end



---**Get a table of the evaluated values of all user variables** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.list_user_variables)
---@return table A table with the following key-value pairs:
--- - 'key': The name of the user variable.
--- - 'value': The value of the variable, which may be a string or a number.
--- If the variable does not exist or if it cannot be evaluated, `nil` is returned.
function pytha.list_user_variables() end



---**The `pytha.*` APIs contain all functions related to creating and modifying parts, groups, and other elements in PYTHA.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.*)
---
---A full list can be found in the sidebar on the right. You can also browse through the overview pages, which are organized along the lines of the PYTHA user interface.
---
--- - [Parts](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha-Parts-Functions)
--- - [Faces](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha-Faces-Functions)
--- - [Edges](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha-Edges-Functions)
--- - [Part Tools I and II](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha-Part-Tools-Functions)
--- - [Attributes](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha-Attributes-Functions)
---
---You may also want to read about the following important concepts:
---
--- - [Element Handles](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha-Element-Handles)
--- - [Groups](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha-Groups)
---
---## See also:
---
--- - [pyio](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio)
--- - [pyui](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui)



---**Merges single parts into one part**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.merge_parts)
---@param elements element_handle A single element or a table of elements
---@param options? table Optional: a table that may contain the following options:
---@return element_handle An element handle of the newly created part
function pytha.merge_parts(elements, options) end



---**Mirrors a single element or a table of elements** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.mirror_element)
---@param element element_handle|table A single element handle or a table of element handles
---@param origin table Coordinates of the center of rotation
---@param axis table Normal vector of the mirror plane
---@return userdata An element handle or table of element handles of the mirrored elements
function pytha.mirror_element(element, origin, axis) end



---**Moves a single element or a table of elements by a given distance** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.move_element)
---@param element element_handle|table A single element handle or a table of element handles
---@param distance table Displacement in x, y, z
---@return nil
function pytha.move_element(element, distance) end



---**Deactivates the currently active local coordinate system** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.pop_local_coordinates)
---Similar to unchecking `Environment -> Local coo system` in the PYTHA user interface. 
---Note: This function does not deactivate the user-specified local coordinate system in PYTHA.
---@param token? integer Optional: The token returned by the matching `push_local_coordinates` call. Alternatively, the number of nested local coordinate systems to be popped, default: 1
function pytha.pop_local_coordinates(token) end



---**Replaces the active coordinate system with a new local coordinate frame** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.push_local_coordinates)
---@param origin table Origin of the local coordinate system
---@param axis table A table that may contain the following options:
---@field u_axis table u-axis of the local coordinate system
---@field v_axis table v-axis of the local coordinate system
---@field w_axis table w-axis of the local coordinate system
---@return integer Token that can be passed to `pop_local_coordinates` to ensure that the correct coordinate system is popped
function pytha.push_local_coordinates(origin, axis) end



---Rotates a single element or a table of elements.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.rotate_element)
---@param element element_handle|table A single element handle or a table of element handles
---@param origin table Coordinates of the center of rotation
---@param axis table Axis of the rotation
---@param angle number Rotational angle (degree)
---@return nil
function pytha.rotate_element(element, origin, axis, angle) end




---**Assigns a table of attributes to a single element or a table of elements**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_element_attributes)
---@param element element_handle|table A single element handle or a table of element handles
---@param attributes table Table of attributes with the `key` as the attribute ID and the `value` as the attribute value
---@return nil
---### Remarks:
---If the function raises the error `-8004` a certain attribute cannot be assigned to the element type. Please check the PYTHA attributes dialog to get a list of the attributes for each element type.
function pytha.set_element_attributes(element, attributes) end



---**Adds a single element or a table of elements to an existing group** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_element_group)
---@param element element_handle|table A single element handle or a table of element handles
---@param group element_handle|nil An element handle to a group or `nil`
function pytha.set_element_group(element, group) end



---**Assigns history information to a group or part created by the plugin.** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_element_history)
---@param element element_handle|table A single element handle or a table of element handles
---@param history table Table containing the history information
---@param id? string Optional: the id to select the relevant edit extension
function pytha.set_element_history(element, history, id) end

---**Assigns history information to a group or part created by the plugin.** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_element_history)
---@param history table Table containing the history information
---@param id? string Optional: the id to select the relevant edit extension
function element:set_element_history(history, id) end



---**Puts a single element or a table of elements into a layer** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_element_layer)
---@param element element_handle|table A single element handle or a table of element handles
---@param layer integer Layer number. Must be between 1 and 256
function pytha.set_element_layer(element, layer) end




---**Assigns a linetype to a single element or a table of elements** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_element_linetype)
---@param element element_handle|table A single element handle or a table of element handles
---@param linetype number Linetype number. Must be between 0 and 10
---Setting the linetype to `0` will assign the currently active linetype.
---As groups do not have a linetype property, the function will assign the linetype to all parts descending from that group.
function pytha.set_element_linetype(element, linetype) end



---**Sets the material of a single element or a table of elements** 
---Similar to the `Materials-> Assign` function in the PYTHA user interface.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_element_material)
---@param element element_handle|table A single element handle or a table of element handles
---@param material material_handle Handle to a material. The `material` handle has to be retrieved via [select_material](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.select_material).
function pytha.set_element_material(element, material) end



---**Assigns a name to a single element or a table of elements** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_element_name)
---@param element element_handle|table A single element handle or a table of element handles
---@param name string Name to be assigned
function pytha.set_element_name(element, name) end



---**Assigns a pen to a single element or a table of elements**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_element_pen)
---@param element element_handle|table A single element handle or a table of element handles
---@param pen number Pen number. Must be between 0 and 128
---Setting the pen to `0` will assign the currently active pen.
---As groups do not have a pen property, the function will assign the pen to all parts descending from that group.
function pytha.set_element_pen(element, pen) end



---**Sets the replace properties for groups**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_group_replace_properties)
---@param element element_handle A single element handle to a group
---@param properties table A table that can contain the following keys:
--- - `origin_u`: `low`, `mid` or `high` - Orientation of the replacement origin in u-direction: `low`: left, `mid`: center, `high`: right
--- - `origin_v`: `low`, `mid` or `high` - Orientation of the replacement origin in v-direction: `low`: front, `mid`: center, `high`: back
--- - `origin_w`: `low`, `mid` or `high` - Orientation of the replacement origin in w-direction: `low`: bottom, `mid`: center, `high`: top
--- - `zoom_u`: `boolean` - A boolean that specifies whether the group can be stretched in u-direction: `false` (default) or `true`
--- - `zoom_v`: `boolean` - A boolean that specifies whether the group can be stretched in v-direction: `false` (default) or `true`
--- - `zoom_w`: `boolean` - A boolean that specifies whether the group can be stretched in w-direction: `false` (default) or `true`
function pytha.set_group_replace_properties(element, properties) end



---**Sets the value of a line from the PYTHA project header**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_project_header)
---@param line integer Project header line number. Must be between 1 and 12.
---@param value string Text to set in the project header.
function pytha.set_project_header(line, value) end



---**Create/set/delete a PYTHA user variable from within the plugin** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_user_variable)
---@param name string The name of the user variable. The name must be a valid lua identifier.
---@param value number|string|nil New value of the variable. `nil` removes the variable.
function pytha.set_user_variable(name, value) end



---**Stretches a single element or a table of elements to a given size**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.stretch_element)
---@param element element_handle|table A single element handle or a table of element handles
---@param dimensions table Table giving the new dimensions
---@param options? table Optional: a table that may contain the following options:
---  - `u_axis`: Local coordinate u-axis for the zooming
---  - `v_axis`: Local coordinate v-axis for the zooming
---  - `w_axis`: Local coordinate w-axis for the zooming
---  - `pivot`: Table giving the orientation of the pivot point. The values can be `"mid"` (default), `"low"`, `"high"` or absolute coordinates.
---@return nil
function pytha.stretch_element(element, dimensions, options) end



---[Scales](https://en.wikipedia.org/wiki/Scaling_(geometry)) a single element or a table of elements uniformly by a given factor.
---Similar to the `Part tools -> Zoom` function in the PYTHA user interface.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.zoom_element)
---@param element element_handle|table A single element handle or a table of element handles
---@param factor table Table giving the new dimensions
---@param options? table Optional: a table that may contain the following options:
---| options.u_axis table Local coordinate u-axis for the zooming
---| options.v_axis table Local coordinate v-axis for the zooming
---| options.w_axis table Local coordinate w-axis for the zooming
---| options.pivot table Table giving the orientation of the pivot point. The values can be `"mid"` (default), `"low"`, `"high"` or absolute coordinates.
function pytha.zoom_element(element, factor, options) end




---**Displays a simple message to the user with an OK button to dismiss the message window** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.alert)
---@param message string The message to be displayed
function pyui.alert(message) end



---**Play a beep sound to the user**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.beep)
---Note that this function exists because it is sometimes useful during development but that we strongly recommend against its use in production code.
function pyui.beep() end



---**Clears all items from the list of a combo box or a drop-down list** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.clear_control_items)
---@param control control_handle Control handle
function pyui.clear_control_items(control) end

---**Clears all items from the list of a combo box or a drop-down list** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.clear_control_items)
---@param control control_handle Control handle
function control:clear_control_items() end



---**Aligns all following items for the specified columns in one row** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_align)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec table Specification of the column-span that will be aligned
---@return control_handle A handle to the newly created control
function pyui.create_align(dialog, col_spec) end



---**Create a button that the user can press**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_button)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Optional: Initial text-content of the control
---@return control_handle A handle to the newly created control
function pyui.create_button(dialog, col_spec, text) end

---**Create a button that the user can press**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_button)
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text string Initial text-content of the control
---@return control_handle A handle to the newly created control
function dialog:create_button(col_spec, text) end



---**Create the Cancel button. When the user presses the Cancel button, the plugin is terminated and control returns to PYTHA.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_cancel_button)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Optional: Should be left out to get a consistent translation of "Cancel"
---@return control_handle A handle to the newly created control
function pyui.create_cancel_button(dialog, col_spec, text) end



---**Create a check box for the user to select an option (yes or no)** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_check_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed
---@param text? string Initial text-content of the control
---@return control_handle A handle to the newly created control
function pyui.create_check_box(dialog, col_spec, text) end

---**Create a check box for the user to select an option (yes or no)** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/dialog.create_check_box)
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed
---@param text? string Initial text-content of the control
---@return control_handle A handle to the newly created control
function dialog:create_check_box(col_spec, text) end



---**Create a combo box where the user can either select a predefined option from a list or enter a custom text** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_combo_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text string Initial text content of the control
---@return control_handle A handle to the newly created control
function pyui.create_combo_box(dialog, col_spec, text) end

---**Events**
---When the user types text or changes the selected option in the drop list, the on_change handler is called `on_change_handler(text, new_index)` with one string argument of the current text and one integer argument for the index of the currently selected option (`nil` if the text does not match any option).




---**Create a drop-down list for the user to select one of multiple options**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_drop_list)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@return control_handle A handle to the newly created control
function pyui.create_drop_list(dialog, col_spec) end

---**Events**
---When the user changes the selected option of a drop list, the [on_change handler](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler) is called `on_change_handler(text, new_index)` with one string argument of the selected text and one integer argument for the index of the newly selected option.




---**Creates a placeholder dialog item to space values in a dialog**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_empty)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the empty control is placed
---@return control_handle A handle to the newly created control
function pyui.create_empty(dialog, col_spec) end



---**Create a foldable group box to present related controls under a common caption** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_foldable_group_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Optional: Initial text-content of the control
---@return control_handle A handle to the newly created control
function pyui.create_foldable_group_box(dialog, col_spec, text) end



---**Create a group box to present related controls under a common caption** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_group_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Optional: Initial text-content of the control
---@return control_handle A handle to the newly created control
function pyui.create_group_box(dialog, col_spec, text) end



---**Create a label or static text** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_label)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Initial text-content of the control
---@param options? table Optional: a table that may contain the following options:
--- - `align`: Optional alignment of the text `"left"`, `"center"` or `"right"`
---@return control_handle A handle to the newly created control
---@overload fun(text: string, options?: table): control_handle
function pyui.create_label(dialog, col_spec, text, options) end

---**Create a label or static text** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_label)
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Initial text-content of the control
---@param options? table Optional: a table that may contain the following options:
--- - `align`: Optional alignment of the text `"left"`, `"center"` or `"right"`
---@return control_handle A handle to the newly created control
function dialog:create_label(col_spec, text, options) end



---**Create a drop-down list for the user to select a layer. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_layer_list)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@return control_handle A handle to the newly created control
function pyui.create_layer_list(dialog, col_spec) end

---**Create a drop-down list for the user to select a layer. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/dialog.create_layer_list)
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@return control_handle A handle to the newly created control
function dialog:create_layer_list(col_spec) end



---**Create a drop-down list for the user to select a linetype. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_linetype_list)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@return control_handle A handle to the newly created control
function pyui.create_linetype_list(dialog, col_spec) end

---**Create a drop-down list for the user to select a linetype. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_linetype_list)
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@return control_handle A handle to the newly created control
function dialog:create_linetype_list(col_spec) end

---**Events**
---When the user changes the selected linetype in the drop-list, the [on_change handler](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler) is called `on_change_handler(text, new_index)` with one string argument of the selected linetype and one integer argument for the index of the newly selected linetype.




---**Create a radio button for the user to select one of multiple options.** 
---The radio button for the first option must have been created with the [create_radio_button](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_radio_button) function. 
---The radio buttons for the other options should be created with this function. 
---Use the [set_control_checked](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_checked) function to initialize the radio button state.
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Initial text-content of the control
---@return control_handle A handle to the newly created control
function pyui.create_linked_radio_button(dialog, col_spec, text) end

---**Events**
---When the user changes the selected option of a radio button group, (e.g. by clicking on one button), the [on_click handler](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_click_handler) for the newly selected option is called.



---**Create a list box for the user to select one of multiple options.**
---Use `insert_control_item` to populate the list box with options and `reset_content` to clear the list box.
---Call `set_control_selection` to initialize the selection status.
---Note that radio buttons and drop lists are another way to present multiple options to the user.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_list_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@return control_handle A handle to the newly created control
function pyui.create_list_box(dialog, col_spec) end

---**Remarks:**
---The length of a list box is calculated from the number of adjacent rows.
---Fine-tuning of the length can be achieved by inserting alignments and empty elements.

---**Events:**
---When the user changes the selected option of a list box, the `on_change_handler(text, new_index)` is called
---with one string argument of the selected text and one integer argument for the index of the newly selected option.

---**Version requirements:**
---This function is available in V26 and above.

---**See also:**
---[Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
---[insert_control_item](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.insert_control_item), 
---[set_control_selection](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_selection), 
---[reset_content](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.reset_content), 
---[set_on_change_handler](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler), 
---[create_drop_list](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_drop_list), 
---[create_radio_button](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_radio_button), 
---[create_align](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_align), 
---[create_empty](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_empty)



---**Create the Ok button** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_ok_button)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Optional: Should be left out to get a consistent translation of "Ok"
---@return control_handle A handle to the newly created control
function pyui.create_ok_button(dialog, col_spec, text) end

---**Create the Ok button** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_ok_button)
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Optional: Should be left out to get a consistent translation of "Ok"
---@return control_handle A handle to the newly created control
function dialog:create_ok_button(col_spec, text) end



---**Create a drop-down list for the user to select a pen. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_pen_list)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@return control_handle A handle to the newly created control
function pyui.create_pen_list(dialog, col_spec) end

---**Create a drop-down list for the user to select a pen. This list cannot be modified.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/dialog.create_pen_list)
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@return control_handle A handle to the newly created control
function dialog:create_pen_list(col_spec) end



---**Create a popup menu for the user to select one of multiple options**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_popup_menu)
---@param control control_handle|nil Specifies the control below which the popup is created. `nil` will attach the popup to the mouse cursor.
---@param item_table table A table containing the list of popup menu items.
---Each popup menu `item` is represented by a table with the following options:
---`item.text`: string - Name of the popup menu item. An empty string will create a menu separator and ignore the following options.
---`item.submenu`: table - A table containing the list of submenu items. It has the same structure as `item_table`.
---`options.handler`: function - A lua function that is invoked when clicking the item.
---Version requirements: This function is available in V26 and above.
function pyui.create_popup_menu(control, item_table) end

function control:create_popup_menu(item_table) end



---**Create a radio button for the user to select one of multiple options** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_radio_button)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Optional: Initial text-content of the control
---@return control_handle A handle to the newly created control
function pyui.create_radio_button(dialog, col_spec, text) end



---**Create a scrollable group box to present related controls under a common caption.**
---This type of control is useful to present a list of controls that would be too long to display on the screen.
---Every scrollable group box must be closed with a call to `end_group_box`.
---All controls created between `create_scrollable_group_box` and `end_group_box` are placed inside the group.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_scrollable_group_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Initial text-content of the control
---@return control_handle A handle to the newly created control
function pyui.create_scrollable_group_box(dialog, col_spec, text) end



---**Create a label or static text that is not related to the next control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_standalone_label)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Initial text-content of the control
---@param options? table Optional: a table that may contain the following options:
--- - `align`: Optional alignment of the text `"left"`, `"center"` or `"right"`
---@return control_handle A handle to the newly created control
function pyui.create_standalone_label(dialog, col_spec, text, options) end

---**Create a label or static text that is not related to the next control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_standalone_label)
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Initial text-content of the control
---@param options? table Optional: a table that may contain the following options:
--- - `align`: Optional alignment of the text `"left"`, `"center"` or `"right"`
---@return control_handle A handle to the newly created control
function dialog:create_standalone_label(col_spec, text, options) end



---**Create an editable text box or edit control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_text_box)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Optional: Initial text-content of the control
---@return control_handle A handle to the newly created control
function pyui.create_text_box(dialog, col_spec, text) end



---**Create a read-only text box** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_text_display)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed.
---@param text? string Optional: Initial text-content of the control
---@return control_handle A handle to the newly created control
function pyui.create_text_display(dialog, col_spec, text) end



---**Create an editable text box or edit control with spin buttons**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_text_spin)
---@param dialog dialog_handle Dialog where the control is created
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed
---@param text? string Optional: Initial text-content of the control
---@return control_handle A handle to the newly created control
function pyui.create_text_spin(dialog, col_spec, text) end

---**Create an editable text box or edit control with spin buttons**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/dialog.create_text_spin)
---@param col_spec integer|table Index of the column or specification of the column-span, where the control is placed
---@param text? string Optional: Initial text-content of the control
---@return control_handle A handle to the newly created control
function dialog:create_text_spin(col_spec, text) end



---**Change the enabled/disabled or active/inactive state of a control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.enable_control)
---@param control control_handle Control handle
---@param enabled? boolean Optional: new enabled-state, default: `true`
function pyui.enable_control(control, enabled) end

---**Change the enabled/disabled or active/inactive state of a control** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.enable_control)
---@param enabled? boolean Optional: new enabled-state, default: `true`
function control:enable_control(enabled) end



---**Ends or closes a group box created with `create_group_box`, `create_foldable_group_box`, or `create_scrollable_group_box`** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.end_group_box)
---@param dialog dialog_handle Dialog where the control is created
---@return control_handle A handle to the newly created control
function pyui.end_group_box(dialog) end

---**Ends or closes a group box created with `create_group_box`, `create_foldable_group_box`, or `create_scrollable_group_box`** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.end_group_box)
---@return control_handle A handle to the newly created control
function dialog:end_group_box() end



---**Ensures that the layout procedure assigns equal widths to a set of columns in the dialog layout**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.equalize_column_widths)
---@param dialog dialog_handle Dialog where the control is created
---@param columns table Table of `integer` column indices
function pyui.equalize_column_widths(dialog, columns) end

---**Ensures that the layout procedure assigns equal widths to a set of columns in the dialog layout**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.equalize_column_widths)
---@param columns table Table of `integer` column indices
function dialog:equalize_column_widths(columns) end



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
function control:insert_control_item(text, position) end



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



---**Creates and displays a dialog window to enable user interaction with the plugin** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.run_modal_dialog)
---@param init_func function An initialization function
---@param ... any Arbitrary additional parameters that are passed to the initialization function
---@return boolean Success status of the dialog execution
---**Note:** The initialization function is invoked as `init_func(dialog, ...)` where `dialog` is a handle for the newly created dialog and `...` are the additional parameters from above.
---@overload fun(dialog: table): boolean
function pyui.run_modal_dialog(init_func, ...) end



---**Creates and displays a subdialog window to enable user interaction with the plugin** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.run_modal_subdialog)
---@param init_func function An initialization function
---@vararg any Arbitrary additional parameters that are passed to the initialization function
---@return string `ok` (default), `cancel` if the dialog has been canceled
---**Remarks:**
---In contrast to [[pyui.run_modal_dialog]], ending the dialog with the close button or [Cancel button](pyui.create_cancel_button) will not raise an error.
---**See also:**
---[[pytha]], [[element handles|pytha Element Handles]], [[pyui.run_modal_dialog]]
function pyui.run_modal_subdialog(init_func, ...) end



---**Sets the stretch factor for columns which determines how much columns expand when the dialog is wider than their natural width** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_column_stretch)
---@param dialog dialog_handle Dialog where the control is created
---@param columns integer|table Column index or table of integer column indices
---@param stretch number Stretch factor, default: 1.0
function pyui.set_column_stretch(dialog, columns, stretch) end

---**Sets the stretch factor for columns which determines how much columns expand when the dialog is wider than their natural width** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_column_stretch)
---@param columns integer|table Column index or table of integer column indices
---@param stretch number Stretch factor, default: 1.0
function dialog:set_column_stretch(columns, stretch) end



---**Sets the checked-state of a control (for those controls that have a check state)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_checked)
---@param control control_handle Control handle
---@param state string|boolean New checked state: `true`, `false` or `"checked"`, `"unchecked"`, `"indeterminate"`
function pyui.set_control_checked(control, state) end

---**Sets the checked-state of a control (for those controls that have a check state)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_checked)
---@param state string|boolean New checked state: `true`, `false` or `"checked"`, `"unchecked"`, `"indeterminate"`
function control:set_control_checked(state) end

-- Note: The on_change handler is not invoked when the text is changed programmatically with this function.

-- See also:
-- [Control Gallery](pyui-control-gallery)
-- [set_control_text](pyui.set_control_text)
-- [set_control_selection](pyui.set_control_selection)
-- [set_on_click_handler](pyui.set_on_click_handler)
-- [create_check_box](pyui.create_check_box)
-- [create_radio_button](pyui.create_radio_button)



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
function control:set_control_range(bound_min, bound_max) end



---**Selects a given item in a control (for those controls that allow item selection)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_selection)
---@param control control_handle Control handle
---@param index integer Index of the item to be selected
function pyui.set_control_selection(control, index) end

---**Selects a given item in a control (for those controls that allow item selection)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_selection)
---@param index integer Index of the item to be selected
function control:set_control_selection(index) end

-- Note: The on_change handler is not invoked when the index is changed programmatically with this function.

-- See also: [Control Gallery](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui-control-gallery), 
-- [insert_control_item](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.insert_control_item), 
-- [set_control_text](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_text), 
-- [set_on_change_handler](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler), 
-- [create_text_box](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_text_box), 
-- [create_label](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.create_label)



---**Sets the text of a control (for those controls that display text)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_text)
---@param control control_handle Control handle
---@param text string Text-content of the control
function pyui.set_control_text(control, text) end

---**Sets the text of a control (for those controls that display text)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_control_text)
---@param text string Text-content of the control
function control:set_control_text(text) end




---**Sets the `on_change` handler for controls that support it.** 
---The change event is usually invoked when the user changes the (text-) content of a control. 
---The handler is not invoked if the content is changed by the lua script.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler)
---@param control control_handle A control handle returned by one of the `pyui.create_xxx` control creation functions
---@param func function A lua function that is invoked for every change event
---@return control_handle The `control` handle is returned again
function pyui.set_on_change_handler(control, func) end

---**Sets the `on_change` handler for the control.**
---The change event is usually invoked when the user changes the (text-) content of a control.
---The handler is not invoked if the content is changed by the lua script.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_change_handler)
---@param func function A lua function that is invoked for every change event
---@return control_handle The `control` handle is returned again
function control:set_on_change_handler(func) end

---**Note:**
---This handler is specific to the current modal environment / dialog and can only be set within a dialog.
---The parameters to the `on_change` handler differ slightly depending on the control on which it is used.
---
---function on_change_handler(text [, index])
---
---@param text string The new content text
---@param index? integer The newly selected item index if applicable
function on_change_handler(text, index) end

---**Version requirements**
---This function is available in V26 and above.



---**Sets the `on_click` handler function for controls that support this event.**  
---The click event is usually invoked when the user clicks (presses and releases a pointing device) on the control.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_click_handler)
---@param control control_handle A control handle returned by one of the `pyui.create_xxx` control creation functions
---@param func function A lua function that is invoked for every change event
---@return control_handle The `control` handle is returned again
function pyui.set_on_click_handler(control, func) end

---**Sets the `on_click` handler function for controls that support this event.**  
---The click event is usually invoked when the user clicks (presses and releases a pointing device) on the control.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_click_handler)
---@param func function A lua function that is invoked for every change event
---@return control_handle The `control` handle is returned again
function control:set_on_click_handler(func) end

---**Note:**  
---This handler is specific to the current modal environment / dialog and can only be set within a dialog.
---The parameters to the `on_click` handler differ slightly depending on the control on which it is used.
---
---function on_click_handler([state])
---
---@param state? boolean The new state of the control (if applicable)

---**Version requirements:**  
---This function is available in V26 and above.

---**See also:**  
---[Control Gallery](pyui-control-gallery), [set_on_change_handler](pyui.set_on_change_handler), [create_button](pyui.create_button), [create_check_box](pyui.create_check_box), [create_radio_button](pyui.create_radio_button)



---**Change the text displayed as the window caption of the dialog** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_window_title)
---@param dialog dialog_handle Dialog whose title is to be changed
---@param text string The new title
function pyui.set_window_title(dialog, text) end

---**Change the text displayed as the window caption of the dialog** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_window_title)
---@param text string The new title
function dialog:set_window_title(text) end



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



---**Updates the dialog layout after the dialog has been initialized by `run_modal_dialog`** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.update_dialog_layout)
---@param dialog dialog_handle Dialog to be updated
function pyui.update_dialog_layout(dialog) end

---**Updates the dialog layout after the dialog has been initialized by `run_modal_dialog`** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.update_dialog_layout)
---@param dialog dialog_handle Dialog to be updated
function dialog:update_dialog_layout() end



---**Wait for the specified amount of time** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.wait)
---This may be useful to display an intermediate (geometric) state to the user. Note that the user can cancel the plugin execution even during wait.
---@param duration? number Waiting time in seconds
function pyui.wait(duration) end



---**Removes all highlights**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.clear_highlights)
---@param options? table Optional: reserved for future use
---@overload fun()
function pyux.clear_highlights(options) end



---**Returns the file handle to a `.pyo` in the PYTHA library folder** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.get_library_handle)
---@param lib_type string Must be 'library'. Reserved for future use.
---@param folder? string Optional: Name of a folder in the PYTHA library.
---@param subfolder? string Optional: Name of a subfolder in `folder`
---@return file_handle The first `.pyo` file in the specified folder. `nil` if no `.pyo` file is found at the given location.
---@overload fun(): file_handle
function pyux.get_library_handle(lib_type, folder, subfolder) end



---**Highlights a coordinate in the scene**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.highlight_coordinate)
---@param coordinate table 3D coordinate to be highlighted
---@param options? table Optional: reserved for future use
---@overload fun()
function pyux.highlight_coordinate(coordinate, options) end



---**Highlights a single element or a table of elements** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.highlight_element)
---@param element element_handle|table A single element handle or a table of element handles
---@param options? table Optional: reserved for future use
---@overload fun()
function pyux.highlight_element(element, options) end



---**Highlights a line given by two 3D coordinates in the scene in the color of the decoration pens**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.highlight_line)
---@param coordinate1 table 3D start coordinate of the line
---@param coordinate2 table 3D end coordinate of the line
---@param options? table Optional: a table that may contain the following options:
---| `options.pen` integer The index of the decoration pen. The values can be `1` (default), `2` or `3`.
---| `options.arrow` boolean A boolean that specifies whether the line is drawn with an arrow at its end coordinate: `false` (default) or `true`.
---| `options.tics` boolean A boolean that specifies whether the line is drawn with tic marks similar to a ruler: `false` (default) or `true`.
---| `options.text` string A string to be displayed above the line, intended to indicate the distance between two points. May be 'nil'.
---@overload fun()
function pyux.highlight_line(coordinate1, coordinate2, options) end



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



---**Opens the file selector and returns a list of handles to all `.pyo` files in the given folder** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.list_pyos)
---@param folder? file_handle Optional: handle to a directory or file
---@param rebrowse? boolean Optional: open the folder selection dialog also when `folder` is specified
---@return table|nil Table containing file handles to all `.pyo` files in the selected folder. `nil` if selection was cancelled.
---@overload fun(): table|nil
function pyux.list_pyos(folder, rebrowse) end



---**Allows the interaction of the user with objects in the scene**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.show_cursor_crosshair)
function pyux.show_cursor_crosshair() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.set_on_left_click_handler)
function pyux.set_on_left_click_handler() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.set_on_right_click_handler)
function pyux.set_on_right_click_handler() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.set_on_left_dragstart_handler)
function pyux.set_on_left_dragstart_handler() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.set_on_left_dragmove_handler)
function pyux.set_on_left_dragmove_handler() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.set_on_left_dragend_handler)
function pyux.set_on_left_dragend_handler() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_coordinate)
function pyux.identify_coordinate() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_artificial_coordinate)
function pyux.identify_artificial_coordinate() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_part)
function pyux.identify_part() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_plane)
function pyux.identify_plane() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_coordinate_in_area)
function pyux.identify_coordinate_in_area() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_distance_along_direction)
function pyux.identify_distance_along_direction() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.identify_coordinate_on_plane)
function pyux.identify_coordinate_on_plane() end



---**Pick a coordinate in the scene** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.select_coordinate)
---@param points_only? boolean `true`: function only returns when an object point was picked. `false`: any coordinate can be picked (default)
---@param text? string Text that will be displayed in the input prompt during the selection
---@param options? table Optional: reserved for future use
---@return table|nil {x,y,z} Coordinate of the picked point. `nil` if operation was cancelled.
---@overload fun(): table|nil
function pyux.select_coordinate(points_only, text, options) end



---Opens the material selector and returns a handle to a material.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.select_material)
---@param old_material? material_handle Optional: handle to a material
---@return material_handle The new material handle
---@overload fun(): material_handle
function pyux.select_material(old_material) end



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
---@return file_handle The new file handle. `nil` if selection was cancelled.
---@overload fun(): file_handle
function pyux.select_pyo(old_file) end



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

---**Callback**
---The parameters to the handler function are as follows:
---@param info table A table containing the following key-value pairs:
---`info.coos_vp` `{u, v}`: Normalized viewport coordinates of the mouse cursor. Can be `nil`.
---`info.ctrl_key` `boolean`: Status of the virtual CTRL key.
---`info.shift_key` `boolean`: Status of the virtual SHIFT key.
---`info.alt_key` `boolean`: Status of the virtual ALT key.
function on_click_handler(info) end

---**Note:**
---This handler is specific to the current modal environment / dialog and can only be set within a dialog.
---In order to retrieve `on_left_dragmove` and `on_left_dragend` events, the `on_left_dragstart` handler has to be set.

---**Version requirements**
---This function is available in V26 and above.

---**See also**
---[Control Gallery](pyui-control-gallery), [set_on_left_dragstart_handler](pyux.set_on_left_dragstart_handler), [set_on_left_dragmove_handler](pyux.set_on_left_dragmove_handler), [set_on_left_click_handler](pyux.set_on_left_click_handler), [set_on_right_click_handler](pyux.set_on_right_click_handler), [show_cursor_crosshair](pyux.show_cursor_crosshair)



---**Sets the `on_left_dragmove` handler for mouse dragging in the graphics area**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_left_dragmove_handler)
---@param func function A lua function that is invoked when the mouse is moved during dragging. `nil` will remove the handler.
function pyui.set_on_left_dragmove_handler(func) end

---**Callback: The parameters to the handler function are as follows:**
---@param info table A table containing the following key-value pairs:
--- - `info.coos_vp`: `{u, v}` Normalized viewport coordinates of the mouse cursor. Can be `nil`.
--- - `info.ctrl_key`: `boolean` Status of the virtual CTRL key.
--- - `info.shift_key`: `boolean` Status of the virtual SHIFT key.
--- - `info.alt_key`: `boolean` Status of the virtual ALT key.
function on_click_handler(info) end

---**Note:**
---This handler is specific to the current modal environment / dialog and can only be set within a dialog.
---In order to retrieve `on_left_dragmove` and `on_left_dragend` events, the `on_left_dragstart` handler has to be set.

---**Version requirements:**
---This function is available in V26 and above.

---**See also:**
--- - [Control Gallery](pyui-control-gallery)
--- - [set_on_left_dragstart_handler](pyux.set_on_left_dragstart_handler)
--- - [set_on_left_dragend_handler](pyux.set_on_left_dragend_handler)
--- - [set_on_left_click_handler](pyux.set_on_left_click_handler)
--- - [set_on_right_click_handler](pyux.set_on_right_click_handler)
--- - [show_cursor_crosshair](pyux.show_cursor_crosshair)



---**Sets the `on_left_dragstart` handler for mouse dragging in the graphics area.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_left_dragstart_handler)
---@param func function A lua function that is invoked when dragging is started. `nil` will remove the handler.
function pyui.set_on_left_dragstart_handler(func) end

---**Callback**
---The parameters to the handler function are as follows:
---@param info table A table containing the following key-value pairs:
--- - `info.coos_vp`: `{u, v}` Normalized viewport coordinates of the mouse cursor. Can be `nil`.
--- - `info.ctrl_key`: `boolean` Status of the virtual CTRL key.
--- - `info.shift_key`: `boolean` Status of the virtual SHIFT key.
--- - `info.alt_key`: `boolean` Status of the virtual ALT key.
function on_click_handler(info) end

---**Note:**
---This handler is specific to the current modal environment / dialog and can only be set within a dialog.
---In order to retrieve `on_left_dragmove` and `on_left_dragend` events, the `on_left_dragstart` handler has to be set.

---**Version requirements**
---This function is available in V26 and above.

---**See also**
--- - [Control Gallery](pyui-control-gallery)
--- - [set_on_left_dragmove_handler](pyux.set_on_left_dragmove_handler)
--- - [set_on_left_dragend_handler](pyux.set_on_left_dragend_handler)
--- - [set_on_left_click_handler](pyux.set_on_left_click_handler)
--- - [set_on_right_click_handler](pyux.set_on_right_click_handler)
--- - [show_cursor_crosshair](pyux.show_cursor_crosshair)



---@class ClickInfo
---@field coos_vp? table  # Normalized viewport coordinates `{u, v}`
---@field ctrl_key boolean
---@field shift_key boolean
---@field alt_key boolean

---@alias callback_function fun(info: ClickInfo)

---**Sets the `on_right_click` handler for mouse clicks in the graphics area** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.set_on_right_click_handler)
---@param func callback_function|nil A lua function that is invoked for every mouse click. `nil` will remove the handler.
function pyui.set_on_right_click_handler(func) end


---**Note:**
---This handler is specific to the current modal environment / dialog and can only be set within a dialog.

---**Version requirements**
---This function is available in V26 and above.




---**Activates the cursor cross hairs and snapping circle** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.show_cursor_crosshair)
---@param state boolean Set to `true` to activate the cross hairs and snapping circle, `false` to deactivate.
function pyui.show_cursor_crosshair(state) end

-- Note: The cross hairs and snapping circle are recommended when mouse interaction in the graphics area is possible.

-- Version requirements: This function is available in V26 and above.

-- See also: 
-- [Control Gallery](pyui-control-gallery)
-- [set_on_left_click_handler](pyux.set_on_left_click_handler)
-- [set_on_right_click_handler](pyux.set_on_right_click_handler)
-- [set_on_left_dragstart_handler](pyux.set_on_left_dragstart_handler)
-- [set_on_left_dragmove_handler](pyux.set_on_left_dragmove_handler)
-- [set_on_left_dragend_handler](pyux.set_on_left_dragend_handler)
-- [set_on_left_click_handler](pyux.set_on_left_click_handler)
-- [set_on_right_click_handler](pyux.set_on_right_click_handler)



---**Starts dragging with the left mouse button in the graphics area** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.start_left_drag)
---
---This function will call the `on_left_dragstart` handler as soon as the mouse is in the graphics area.
---This function is specific to the current modal environment / dialog and can only be set within a dialog.
---Set the `on_left_dragstart`, `on_left_dragmove` and `on_left_dragend` handler before calling `start_left_drag`.
function pyui.start_left_drag() end



-- =====================================================================
-- pytha.* (additions)
-- =====================================================================


---**Analyzes the edges of a part and returns them as one or more polyline chains**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.analyze_polyline)
---Inverse operation to `create_polyline`. Each chain entry has the form `{type, points}` where
---`type` is `"open"` or `"closed"`. For closed chains the first point is not repeated at the end.
---Minimum PYTHA version: V27.
---@param element element_handle Element handle of a part whose edges shall be analyzed
---@return polyline_chain[] chains A table of chains, each `{type, points}`
function pytha.analyze_polyline(element) end



---**Analyzes the edges of a part and returns them as polyline chains with reconstructed arc segments**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.analyze_polyline_ex)
---Inverse operation to `create_polyline_ex`. Each chain entry has the form `{type, points, segments}`.
---A line segment is reported as an empty table `{}`. Arc segments contain `r`, `orientation`, `select_arc`.
---The arc analysis is carried out in the local `u/w` plane (returned points have `v = 0`).
---Minimum PYTHA version: V27.
---@param element element_handle Element handle of a part whose edges shall be analyzed
---@return polyline_chain[] chains A table of chains, each `{type, points, segments}`
function pytha.analyze_polyline_ex(element) end



---**Creates a dado connection for two parts**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_dado)
---Similar to the `Generators -> Dado` function in the PYTHA user interface.
---The interpretation of `options.position` is influenced by the group vector of the parent group.
---Minimum PYTHA version: V26.
---@param element1 element_handle First part of the dado connection
---@param element2 element_handle Second part of the dado connection
---@param options? table Optional options table:
--- - depth_groove: number Depth of the rabbet groove. Ignored if `depth_type == "full"`
--- - depth_tolerance: number Extra clearance added to the pocket depth
--- - depth_type: string `"relative"`, `"absolute"` or `"full"`
--- - distance_back: number Dado offset from the back edge
--- - distance_front: number Dado offset from the front edge
--- - maximum_distance: number Maximum air gap between elements for which a dado is still created
--- - number: number Number of dados
--- - overlap_groove: number Extra length of the dado machining pocket
--- - overlap_pocket: number Extra length of the rabbet pocket
--- - position: string `"center"`, `"inside"`, `"outside"`, `"bottom"`, `"top"`, `"left"`, `"right"`, `"front"`, `"back"`
--- - thickness: number Thickness of the dado. Ignored if `thickness_type == "full"`
--- - thickness_tolerance: number Extra clearance added to the dado width
--- - thickness_type: string `"relative"`, `"absolute"` or `"full"`
---@return boolean created `true` if dado was created, `false` if parts don't touch
function pytha.create_dado(element1, element2, options) end



---**Creates a modulated profile in PYTHA as a new part**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_modulated_profile)
---Uses a face-part as the base cross section and a 2D modulation curve as the profile cross section.
---The reference point of the modulation profile is fixed at `0,0`. At least two modulation points are required.
---The `base_part` is not deleted. If it contains multiple faces, profiles over all faces will be created.
---Minimum PYTHA version: V26.
---@param base_part element_handle The face (or faces) used as the base cross section
---@param options table Table with modulation settings:
--- - modulation_points: {{u,v}, ...} Coordinates of the modulation curve (origin at `0,0`)
--- - closed: string|boolean `"closed"`, `"open"`, `true` or `false`
--- - modulation_type?: string `"multiplicative"` (default) or `"additive"`
--- - name?: string Name of the new part
--- - material?: material_handle Material of the new part
--- - pen?: integer Pen of the new part
---@return element_handle[] elements A table containing the element handles of the newly created parts
function pytha.create_modulated_profile(base_part, options) end



---**Creates a new point light source as a new part at the given position**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_point_light_source)
---Depending on the flags in `options`, the same function also creates spot, extended (area) and infinite lights.
---The `spot`, `extended` and `infinite` flags are independent and may be combined.
---Minimum PYTHA version: V26.
---@param position table Position `{x, y, z}` of the light source
---@param options? table Optional options table:
--- - aperture: number Cone aperture in degrees (`[0, 180]`). Only used if `spot = true`
--- - cast_shadow: boolean Whether this light casts shadows
--- - color_srgb: {r,g,b} Light color as sRGB, each component in `[0,1]`
--- - color_temperature: number Color temperature in Kelvin. `0` means use `color_srgb`
--- - direction: {x,y,z} Light direction (defaults to `{0,0,-1}`). Spot/infinite only
--- - extended: boolean `true` makes the light an area-style (extended) light source
--- - infinite: boolean `true` makes the light an infinite (directional) light
--- - intensity: number Light intensity, `>= 0`
--- - name: string Name of the new part (UTF-8)
--- - radius: number Radius of the light source. Only used if `extended = true`
--- - spot: boolean `true` makes the light a spot light
--- - state: boolean `true` switches the light on, `false` off
---@return element_handle light An element handle of the newly created light source part
function pytha.create_point_light_source(position, options) end



---**Creates a section from a selection of parts and groups**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_section)
---The created section can be inserted on a plot page. If `elements` resolves to an empty selection,
---all model parts are used. If `name` is omitted, an automatic section name is generated.
---Minimum PYTHA version: V26.
---@param elements element_handle|element_handle[] Parts and groups that define the section scope
---@param options? table Optional section options:
--- - plane: string Section plane: `"xy"`, `"xz"`, `"yz"`, `"-xy"`, `"-xz"` or `"-yz"`
--- - position: {number,number,number} A point through which the section plane passes
--- - angle: number Additional section angle to rotate the plane around
--- - rotation: number Rotation of the section representation in 90 degree steps
--- - name: string Section name
---@return section_handle|nil section A handle to the created section, or `nil` if operation failed
function pytha.create_section(elements, options) end



---**Deletes one or more sections**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.delete_section)
---Deletion also removes section-related generated parts.
---Minimum PYTHA version: V26.
---@param section section_handle|section_handle[] One or more section handles
---@return nil
function pytha.delete_section(section) end



---**Gets the closed-state properties for a group**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.get_group_closed)
---Similar to the properties in the `Attributes -> Edit Group` dialog under "Keep closed".
---Minimum PYTHA version: V26.
---@param element element_handle A single element handle to a group
---@return table properties Table with fields:
--- - parts_list: boolean Group is closed in parts list
--- - functions: boolean Group is closed in functions
--- - geometry: boolean Group geometry is rigid
function pytha.get_group_closed(element) end



---**Opens a `.pyo` file as a new project, discarding the current project**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.open_pyo)
---Similar to the `File -> Open` function in the PYTHA user interface.
---Opens a project including all of its presets, such as plot sheets and pen and layer settings.
---In contrast, `pytha.import_pyo` will import a file into the current project.
---@param file file_handle A handle to a `.pyo` file, retrieved via `pyux.select_pyo`
---@return table elements A table containing the element handles of the newly imported parts
function pytha.open_pyo(file) end



---**Assigns a face light source to a single part or a table of parts**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_element_face_light)
---The part's faces emit light. If a part is already a face light, its existing settings are reused
---as baseline and only the fields in `options` are overwritten. Otherwise sensible defaults are used
---(intensity `1000`, white color, shadows on, state on).
---Minimum PYTHA version: V26.
---@param element element_handle|element_handle[] A single element handle or a table of element handles
---@param options? table Optional options table:
--- - cast_shadow: boolean Whether this light casts shadows
--- - color_srgb: {r,g,b} Light color as sRGB, each component in `[0,1]`
--- - color_temperature: number Color temperature in Kelvin. `0` means use `color_srgb`
--- - intensity: number Light intensity, `>= 0`
--- - state: boolean `true` switches the light on, `false` off
function pytha.set_element_face_light(element, options) end



---**Sets the closed-state properties for groups**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.set_group_closed)
---Similar to the properties in the `Attributes -> Edit Group` dialog under "Keep closed".
---Minimum PYTHA version: V26.
---@param element element_handle A single element handle to a group
---@param properties table Table containing the following keys:
--- - parts_list: boolean Keep group closed in parts list
--- - functions: boolean Keep group closed in functions
--- - geometry: boolean Treat group geometry as rigid
function pytha.set_group_closed(element, properties) end



---**Updates one or more sections (forces a regeneration)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.update_section)
---Useful after model changes when dependent section geometry should be regenerated.
---Minimum PYTHA version: V26.
---@param section section_handle|section_handle[] One or more section handles
---@return nil
function pytha.update_section(section) end



-- =====================================================================
-- pyio.* (additions)
-- =====================================================================


---**Parses the fields of a CSV file to tables of strings**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.parse_csv)
---Default field separator is `,`. Quoted fields are supported (RFC4180).
---Encodings UTF-8, UTF-8 with BOM, UTF-16LE with BOM and ASCII are auto-detected.
---Minimum PYTHA version: V26.
---@param file file_handle The file that should be read
---@return string[][] rows A table that, for each row, contains a table of strings
function pyio.parse_csv(file) end



---**Parses a JSON file to a basic Lua data structure**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.parse_json)
---JSON objects become Lua tables with string keys, JSON arrays become tables with integer keys starting at 1.
---Strings, numbers and booleans map directly; `null` becomes `nil`.
---Minimum PYTHA version: V26.
---@param file file_handle The file that should be read
---@return any value The parsed value (typically a table)
function pyio.parse_json(file) end



---**Parses the lines of a text file to a table of strings**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.parse_lines)
---Encodings UTF-8, UTF-8 with BOM, UTF-16LE with BOM and ASCII are auto-detected.
---Windows and Unix line endings (CR+LF and LF) are equally supported.
---Minimum PYTHA version: V26.
---@param file file_handle The file that should be read
---@return string[] lines A table of strings, one per line
function pyio.parse_lines(file) end



---**Parses an XML file to an element tree (lightweight Lua data structure inspired by Python eTree)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.parse_xml)
---The returned `xml_document` has a `root` of type `xml_element`. Comments and processing
---instructions are not preserved. Attribute keys with prefixes use the `{namespace_uri}local_name` form.
---Minimum PYTHA version: V26.
---@param file file_handle The file that should be read
---@return xml_document document The parsed xml document
function pyio.parse_xml(file) end



---**Writes a table of rows to a CSV file**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.write_csv)
---Fields are automatically quoted when they contain commas, quotes or line breaks; quotes are doubled.
---Default encoding is UTF-8.
---Minimum PYTHA version: V26.
---@param path string The file path where the CSV should be written
---@param rows string[][] A table of rows; each row is a table of strings (fields)
---@param encoding? string Optional output encoding: `"utf8"`, `"utf8-bom"`, `"utf16le"`, `"utf16be"`, `"ascii"`
---@return nil
function pyio.write_csv(path, rows, encoding) end



---**Writes a Lua data structure to a JSON file (UTF-8)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.write_json)
---Tables with consecutive integer keys starting at 1 are written as JSON arrays, otherwise as objects.
---Only string keys are written. Unsupported types (functions, userdata) are written as `null`.
---Minimum PYTHA version: V26.
---@param path string The file path where the JSON should be written
---@param value any A Lua value (typically a table) that should be serialized to JSON
---@return nil
function pyio.write_json(path, value) end



---**Writes a table of strings to a text file, one entry per line**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.write_lines)
---A newline is appended after every line. Default encoding is UTF-8.
---Minimum PYTHA version: V26.
---@param path string The file path where the text should be written
---@param lines string[] A table of strings, one entry per line
---@param encoding? string Optional output encoding: `"utf8"`, `"utf8-bom"`, `"utf16le"`, `"utf16be"`, `"ascii"`
---@return nil
function pyio.write_lines(path, lines, encoding) end



---**Writes a Lua table as an XML file (UTF-8, formatted with indentation)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.write_xml)
---Each element table has `local_name`, `prefix`, `namespace_uri`, optional `_attributes`,
---optional `_namespaces`, and numeric child entries (strings as text nodes, tables as nested elements).
---Minimum PYTHA version: V26.
---@param path string The file path where the XML should be written
---@param element table A Lua table describing the XML element tree
---@return nil
function pyio.write_xml(path, element) end



---**Finds the first XML node inside an XML tree that matches the given location path**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.xml_find)
---The path syntax supports a subset of XPath 1.0: `/`, `//`, `*`, `name`, `pre:name`, `text()`, `@attr`, `[n]`.
---Also callable as `start_element:xml_find(path, namespaces)`.
---Minimum PYTHA version: V26.
---@param start_element xml_document|xml_element The XML node from where to navigate the path
---@param path string Relative path (XPath 1.0 subset)
---@param namespaces? table<string,string> Optional `{prefix = namespace_uri, ...}` table
---@return xml_element|string|nil result Matching node (element or text/attribute string), or `nil` if no match
function pyio.xml_find(start_element, path, namespaces) end



---**Finds all XML nodes inside an XML tree that match the given location path**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.xml_find_all)
---Uses the same path syntax as `pyio.xml_find`. Returns every match in document order.
---Also callable as `start_element:xml_find_all(path, namespaces)`.
---Minimum PYTHA version: V26.
---@param start_element xml_document|xml_element The XML node from where to navigate the path
---@param path string Relative path (XPath 1.0 subset)
---@param namespaces? table<string,string> Optional `{prefix = namespace_uri, ...}` table
---@return (xml_element|string)[] results Array of matching nodes. Empty if nothing matches
function pyio.xml_find_all(start_element, path, namespaces) end



-- =====================================================================
-- pygeo.*
-- =====================================================================


---**Cleans a single 2D polygon loop and returns the cleaned result as one or more loops**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.clean_polygon_2d)
---Resolves self-intersections, overlaps and similar invalid configurations in the local `u/v` plane.
---Outer loops are returned counter-clockwise, inner loops clockwise. Arc information is not preserved.
---For multi-loop input with holes, use `pygeo.clean_polygon_2d_ex`.
---Minimum PYTHA version: V26.
---@param points table Input loop points in 2D `{{u,v}, ...}`. Treated as closed
---@return table loops Cleaned result `{{{u,v}, ...}, ...}`
function pygeo.clean_polygon_2d(points) end



---**Cleans one or more 2D polygon loops and returns the cleaned result as loops**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.clean_polygon_2d_ex)
---Input format follows the loop structure of `pytha.create_polygon_ex` (point table + optional segment table).
---Arc definitions are segmented internally before cleanup. Returned loops contain only point coordinates.
---Outer loops CCW, inner loops CW. Minimum PYTHA version: V26.
---@param loops table Loops as `{{loop_points_1, loop_segments_1}, {loop_points_2, loop_segments_2}, ...}`
---@return table loops Cleaned result `{{{u,v}, ...}, ...}`
function pygeo.clean_polygon_2d_ex(loops) end



---**Computes a 2D (constrained) Delaunay triangulation of a set of input points**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.create_triangulation)
---Operates in the local `u/v` plane. At least three pairwise-distinct points required.
---Constraint edges may reference any pair of points and must not cross each other.
---Triangulation covers the convex hull of the points.
---Minimum PYTHA version: V27.
---@param points table Input points `{{u,v}, ...}`. At least three, pairwise distinct
---@param edges? table Optional constraint edges as pairs of 1-based indices `{{i1,i2}, ...}`
---@return table triangles `{{p1,p2,p3}, ...}` triples of 1-based vertex indices (CCW)
---@return table triangle_edges `{{k1,k2,k3}, ...}` edge index triples; edge `k_j` lies opposite vertex `p_j`
---@return table triangle_neighbours `{{n1,n2,n3}, ...}` neighbour triangle indices; `0` means boundary
function pygeo.create_triangulation(points, edges) end



---**Offsets a polyline chain by a given distance and returns the result as a plain point list**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.offset_polyline)
---Arc segments in the input are detected automatically using PYTHA's 2D analysis settings.
---Arcs in the offset result are returned as their endpoints only. For arc-preserving offset use `offset_polyline_ex`.
---For closed chains a positive offset moves the contour outward.
---Minimum PYTHA version: V26.
---@param chain polyline_chain Input chain `{type, points}` (as returned by `analyze_polyline`)
---@param offset number Offset distance
---@param corner_type? string `"sharp"` (default), `"rounded"` or `"chamfer"`
---@param corner_angle? number Angle threshold in degrees for corner treatment (default `0`)
---@return table points Offset contour as a flat list of 3D points `{{x,y,z}, ...}`
function pygeo.offset_polyline(chain, offset, corner_type, corner_angle) end



---**Offsets a polyline chain and returns the result with reconstructed arc segments**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.offset_polyline_ex)
---Result has the same shape as `analyze_polyline_ex` and is directly compatible with `create_polyline_ex`.
---For closed chains a positive offset moves the contour outward.
---Minimum PYTHA version: V26.
---@param chain polyline_chain Input chain `{type, points}`
---@param offset number Offset distance
---@param corner_type? string `"sharp"` (default), `"rounded"` or `"chamfer"`
---@param corner_angle? number Angle threshold in degrees for corner treatment (default `0`)
---@return polyline_chain chain Offset contour as `{type, points, segments}`
function pygeo.offset_polyline_ex(chain, offset, corner_type, corner_angle) end



-- =====================================================================
-- pyplot.*
-- =====================================================================
-- Sheet units are mm or inch (depending on plot settings). Origin: lower-left corner.
-- Coordinates inside plotted views/details use the model construction units.


---**Creates a new plot sheet in the current plot album**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.create_sheet)
---Uses the default plot sheet template. If `name` is given and not empty, the sheet is renamed.
---Minimum PYTHA version: V26.
---@param name? string Optional name of the new sheet
---@return plot_sheet_handle sheet A handle to the created sheet
function pyplot.create_sheet(name) end



---**Deletes one or more plot details**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.delete_detail)
---If a detail is associated with a plotted section, the related plotted section object is deleted as well.
---Minimum PYTHA version: V26.
---@param detail plot_detail_handle|plot_detail_handle[] One or more plot detail handles
---@return nil
function pyplot.delete_detail(detail) end



---**Deletes one or more plot sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.delete_sheet)
---Minimum PYTHA version: V26.
---@param sheet plot_sheet_handle|plot_sheet_handle[] One or more sheet handles to delete
---@return nil
function pyplot.delete_sheet(sheet) end



---**Imports one or more sheets from a plot template file**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.import_sheet)
---Printer settings are only copied from the template if the current album is empty.
---If a non-empty `name` is given, every imported sheet is renamed to it.
---Minimum PYTHA version: V26.
---@param file file_handle The plot template file that should be imported
---@param name? string Optional: rename all imported sheets to this name
---@return plot_sheet_handle[] sheets Imported sheet handles in import order
function pyplot.import_sheet(file, name) end



---**Inserts a bar code on one or more plot sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_bar_code)
---If `size` is omitted, the default bar code size from the current plot settings is used.
---The bar code text must not be empty.
---Minimum PYTHA version: V26.
---@param sheet plot_sheet_handle|plot_sheet_handle[] Target plot sheet handle(s)
---@param text string The text encoded in the bar code
---@param options? table Optional options table:
--- - size: {number, number} Width and height of the bar code on the sheet
--- - position: {number, number} Origin on the plot sheet
--- - angle: number Rotation angle
---@return plot_detail_handle[]|nil details Created bar code detail handles, or `nil` on failure
function pyplot.insert_bar_code(sheet, text, options) end



---**Inserts one or more plot details on one or more sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_detail)
---If `elements` is omitted, the full model is used. If `scale` is omitted but `view_min`/`view_max`
---are given, the scale is derived from the clipping rectangle and the requested size.
---Default `graphic_flags`: edges, shaded, solid.
---Minimum PYTHA version: V26.
---@param sheet plot_sheet_handle|plot_sheet_handle[] Target plot sheet handle(s)
---@param options table Options controlling view, placement, clipping, scale and appearance:
--- - view: string `"xy"`, `"xz"`, `"yz"`, `"-xy"`, `"-xz"`, `"-yz"`, `"axo"` or `"persp"`
--- - position: {number, number} Detail center on the sheet
--- - size: {number, number} Detail size on the sheet
--- - angle: number Rotation angle of the detail on the sheet
--- - scale: number Explicit detail scale
--- - view_min: {number, number} Optional lower clipping corner in model view coordinates
--- - view_max: {number, number} Optional upper clipping corner in model view coordinates
--- - tilt: number (axo only) Axonometric tilt angle
--- - rotation: number (axo only) Axonometric rotation angle
--- - center: {number, number, number} (axo/persp only) Center point
--- - eyepoint: {number, number, number} (persp only) Camera position
--- - clip_near: number (persp only) Near clipping distance
--- - aspect_ratio: number (persp only) Width-to-height ratio
--- - aperture: number (persp only) Aperture angle
--- - layer_visible: table<integer,boolean> Layer visibility mapping
--- - graphic_flags: string[] Display flags: `"edges"`, `"solid"`, `"hidden_edges"`, `"hatching"`, `"hatching_islands"`, `"shaded"`, `"material"`, `"shadow"`
---@param elements? element_handle|element_handle[] Optional selection of parts/groups to include
---@return plot_detail_handle[] details Created detail handles
function pyplot.insert_detail(sheet, options, elements) end



---**Inserts a QR code on one or more plot sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_qr_code)
---If `size` is omitted, the default QR code size from the current plot settings is used.
---The QR code text must not be empty.
---Minimum PYTHA version: V26.
---@param sheet plot_sheet_handle|plot_sheet_handle[] Target plot sheet handle(s)
---@param text string The text encoded in the QR code
---@param options? table Optional options table:
--- - size: {number, number} Width and height of the QR code on the plot sheet
--- - position: {number, number} Origin on the sheet
--- - angle: number Rotation angle
---@return plot_detail_handle[]|nil details Created QR code detail handles, or `nil` on failure
function pyplot.insert_qr_code(sheet, text, options) end



---**Inserts one or more plotted section details on one or more sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_section)
---If `scale` is omitted, a fitting scale is computed from the section bounding box and `size`.
---Default `graphic_flags`: edges, shaded, solid.
---Minimum PYTHA version: V26.
---@param sheet plot_sheet_handle|plot_sheet_handle[] Target plot sheet handle(s)
---@param section section_handle A section handle created with `pytha.create_section`
---@param options? table Optional options table:
--- - position: {number, number} Section detail center on the sheet
--- - size: {number, number} Requested section detail size on the sheet
--- - angle: number Rotation angle of the plotted section on the sheet
--- - scale: number Explicit plot scale
--- - layer_visible: table<integer,boolean> Layer visibility mapping
--- - graphic_flags: string[] Display flags (see `insert_detail`)
---@return plot_detail_handle[] details Created plotted section detail handles
function pyplot.insert_section(sheet, section, options) end



---**Inserts a text object on one or more plot sheets**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyplot.insert_text)
---If `width` is omitted, the text width is determined automatically from content and font settings.
---Minimum PYTHA version: V26.
---@param sheet plot_sheet_handle|plot_sheet_handle[] Target plot sheet handle(s)
---@param text string The text to insert
---@param options? table Optional text formatting and placement options:
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
---@return plot_detail_handle[]|nil details Created text detail handles, or `nil` on failure
function pyplot.insert_text(sheet, text, options) end



-- =====================================================================
-- pyloc (function, not a namespace) — Marks a string as translatable
-- =====================================================================


---**Marks a string as translatable / fetches the translated string**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyloc)
---The parameter must be a **literal string** (written with quotation marks in the source file) so that
---it appears in the translation base file. See "Localization and Translation" in the wiki.
---Advanced two-argument variants exist (see `@overload`s) to preserve translations across string edits.
---@param translatable_string string String that might need translation
---@return string translated The translated string, or `translatable_string` if no translation exists
---@overload fun(translatable_string: string, original_string: string): string
---@overload fun(translatable_string: string, translation_id: integer): string
function pyloc(translatable_string) end



-- =====================================================================
-- pyui.* (additions)
-- =====================================================================


---**Cancels a modal (sub-) dialog. Equivalent to pressing the Cancel button**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.end_modal_cancel)
---Specific to the current modal environment / dialog and can only be called within a (sub-) dialog.
function pyui.end_modal_cancel() end



---**Ends a modal (sub-) dialog. Equivalent to pressing the OK button**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.end_modal_ok)
---Specific to the current modal environment / dialog and can only be called within a (sub-) dialog.
function pyui.end_modal_ok() end



---**Deprecated alias for `pyui.clear_control_items`**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyui.reset_content)
---@deprecated Use `pyui.clear_control_items` instead.
---@param control control_handle The control whose items shall be cleared
function pyui.reset_content(control) end



-- =====================================================================
-- pyux.* (additions)
-- =====================================================================


---**Returns a material element handle for a material with the given name from a material file**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.get_material)
---If multiple loaded materials share the same name, only a material whose stored material path
---matches the given material file is returned.
---@param material_file_handle directory_handle Handle to a material file (`.pymat`)
---@param material_name string Name of the material inside the material file
---@return material_handle|nil material Element handle of the material, or `nil` if not found
function pyux.get_material(material_file_handle, material_name) end



---**Lists all materials from a material file and returns them as material element handles**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyux.list_materials)
---The function loads the material file if necessary and returns only those materials whose
---stored material path matches the given material file.
---@param material_file_handle directory_handle Handle to a material file (`.pymat`)
---@return material_handle[] materials Array of element handles of all materials in the material file
function pyux.list_materials(material_file_handle) end



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


