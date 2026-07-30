---@meta pygeo

---The pygeo.* api functions contain geometry-processing helpers for 2D polygonal data.
---
---These functions operate on geometric loop or chain data and return cleaned or modified loops.
---They do not create PYTHA parts themselves.
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo)
pygeo = {}


---**Cleans a single 2D polygon loop and returns the cleaned result as one or more loops**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.clean_polygon_2d)<br>
---Resolves self-intersections, overlaps and similar invalid configurations in the local `u/v` plane.
---Outer loops are returned counter-clockwise, inner loops clockwise. Arc information is not preserved.
---For multi-loop input with holes, use `pygeo.clean_polygon_2d_ex`.
---Minimum PYTHA version: V26.
---@param points Point[] Input loop points in 2D `{{u,v}, ...}`. Treated as closed
---@return Point[][] loops Cleaned result `{{{u,v}, ...}, ...}`
function pygeo.clean_polygon_2d(points) end



---**Cleans one or more 2D polygon loops and returns the cleaned result as loops**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.clean_polygon_2d_ex)<br>
---Input format follows the loop structure of `pytha.create_polygon_ex` (point table + optional segment table).
---Arc definitions are segmented internally before cleanup. Returned loops contain only point coordinates.
---Outer loops CCW, inner loops CW. Minimum PYTHA version: V26.
---@param loops [Point[], polyline_segment[]][] Loops as `{{loop_points_1, loop_segments_1}, {loop_points_2, loop_segments_2}, ...}`
---@return table loops Cleaned result `{{{u,v}, ...}, ...}`
function pygeo.clean_polygon_2d_ex(loops) end



---**Computes a 2D (constrained) Delaunay triangulation of a set of input points**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.create_triangulation)<br>
---Operates in the local `u/v` plane. At least three pairwise-distinct points required.
---Constraint edges may reference any pair of points and must not cross each other.
---Triangulation covers the convex hull of the points.
---Minimum PYTHA version: V27.
---@param points Point[] Input points `{{u,v}, ...}`. At least three, pairwise distinct
---@param edges? [integer, integer][] Optional constraint edges as pairs of 1-based indices `{{i1,i2}, ...}`
---@return table triangles `{{p1,p2,p3}, ...}` triples of 1-based vertex indices (CCW)
---@return table triangle_edges `{{k1,k2,k3}, ...}` edge index triples; edge `k_j` lies opposite vertex `p_j`
---@return table triangle_neighbours `{{n1,n2,n3}, ...}` 1-based neighbour triangle indices; `n_j` is the neighbour opposite vertex `p_j` (sharing edge `k_j`); `0` means boundary
function pygeo.create_triangulation(points, edges) end


---@alias offset_corner_type "sharp"|"rounded"|"chamfer"

---**Offsets a polyline chain by a given distance and returns the result as a plain point list**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.offset_polyline)<br>
---Arc segments in the input are detected automatically using PYTHA's 2D analysis settings.
---Arcs in the offset result are returned as their endpoints only. For arc-preserving offset use `offset_polyline_ex`.
---For closed chains a positive offset moves the contour outward.
---Minimum PYTHA version: V26.
---@param chain polyline_chain Input chain `{type, points}` (as returned by `analyze_polyline`)
---@param offset number Offset distance
---@param corner_type? offset_corner_type `"sharp"` (default), `"rounded"` or `"chamfer"`
---@param corner_angle? number Angle threshold in degrees for corner treatment (default `0`)
---@return Point[] points Offset contour as a flat list of 3D points `{{x,y,z}, ...}`
function pygeo.offset_polyline(chain, offset, corner_type, corner_angle) end



---**Offsets a polyline chain and returns the result with reconstructed arc segments**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.offset_polyline_ex)<br>
---Result has the same shape as `analyze_polyline_ex` and is directly compatible with `create_polyline_ex`.
---For closed chains a positive offset moves the contour outward.
---Minimum PYTHA version: V26.
---@param chain polyline_chain Input chain `{type, points}`
---@param offset number Offset distance
---@param corner_type? offset_corner_type `"sharp"` (default), `"rounded"` or `"chamfer"`
---@param corner_angle? number Angle threshold in degrees for corner treatment (default `0`)
---@return polyline_chain chain Offset contour as `{type, points, segments}`
function pygeo.offset_polyline_ex(chain, offset, corner_type, corner_angle) end


---**Tests whether a 2D point lies inside a polygon loop.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.is_in_polygon)<br>
---@param point Point The test point in 2D.
---@param polygon Point[] Coordinates of the polygon loop points in 2D. The loop is automatically closed.
---@return boolean inside if the point lies inside the polygon (positive winding number).
---@return integer winding The winding number of the polygon around the test point.
function pygeo.is_in_polygon(point, polygon) end

---**Tests whether a 2D point lies on the boundary of a polygon loop within a given tolerance.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.is_on_polygon_boundary)<br>
---@param point Point The test point in 2D.
---@param polygon Point[] Coordinates of the polygon loop points in 2D. The loop is treated as closed.
---@param tolerance number Maximum spatial distance to the boundary.
---@return "edge" | "point" | nil #The point lies on an edge or a point of the polygon.
---@return integer index The index of the edge or point in the polygon
function pygeo.is_on_polygon_boundary(point, polygon, tolerance) end

---**Computes the parallel offset of a 2D polygon and returns both the offset polygon and the mantle faces between the original and the offset boundary.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.offset_polygon)<br>
---@param points Point[] Coordinates of the input polygon as a single closed loop in 2D. The loop must contain at least 3 points and is treated as implicitly closed.
---@param distance number Offset distance. Positive values move the contour outward, negative values move it inward.
---@return Point[][] offset_loops `{{loop_points_1} [, {loop_points_2}, ...]}`
---@return [Point[], integer][] mantle_faces `{{loop_points_1, original_segment_index=integer} [, ...]}`
function pygeo.offset_polygon(points, distance) end



---**Computes the parallel offset of a 2D polygon with optional holes and arc segments, and returns both the offset polygon and the mantle faces between the original and the offset boundary.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pygeo.offset_polygon_ex)<br>
---@param loops [Point[], polyline_segment[]][] Array of polygon loops `{{loop_points_1, loop_segments_1},...}
---@param distance number Offset distance. Positive values move the contour outward, negative values move it inward.
---@return [Point[], polyline_segment[]][] offset_loops `{{loop_points_1} [, {loop_points_2}, ...]}`
---@return [Point[]][] mantle_faces `{{loop_points_1} [, {loop_points_2}, ...]}`
function pygeo.offset_polygon_ex(loops, distance) end