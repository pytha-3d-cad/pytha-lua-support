---@meta pymath


---**The pymath library contains mathematical helper functions**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath)<br>
---
---See also:
---[Math functions](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/Math-functions)
pymath = {}

---@alias mat number[][]
---@class tensor: table

---@enum axis_literal
local axis_e = {
    [1] = 'x',
    [2] = 'y',
    [3] = 'z',
    [4] = '-x',
    [5] = '-y',
    [6] = '-z'
}

---A Vector or a string literal representing an axis.
---@alias axis Vector | axis_literal

---A quaternion `{x, y, z, w}`.
---@class quaternion
---@field [1] number x
---@field [2] number y
---@field [3] number z
---@field [4] number w



---**Cross product of two 3-vectors.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.cross)<br>
---@param u Vector Left vector
---@param v Vector Right vector
---@return Vector w A new 3-vector u × v, perpendicular to both u and v.
---Both arguments must be 3-vectors (arrays of length 3) — the cross product is only provided in three dimensions.
function pymath.cross(u, v) end

---**Returns the Euclidean length of a vector, or the distance between two points.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.length)<br>
---@param u Vector 
---@return number len
function pymath.length(u) end

---**Returns the Euclidean length of a vector, or the distance between two points.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.length)<br>
---@param u Point
---@param v Point
---@return number len
function pymath.length(u,v) end

---**Returns the given vector scaled to unit length**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.normalize)<br>
---@param v Vector A vector of any dimension.
---@param threshold? number Non-negative length at or below which the vector counts as too short. Default: an implementation defined tolerance.
---@return Vector? u A new vector
---@return number? len The original length of v (only on success).
---returns `nil` if the vector is too short to normalize reliably.
function pymath.normalize(v, threshold) end



---**Vector product, matrix multiplication (or more generally contraction of two tensors)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.dot)
---@param a Vector Left vector
---@param b Vector Right vector
---@return number #Scalar
---If both operands are vectors, the full contraction yields a single number (scalar dot product).
function pymath.dot(a, b) end

---**Vector product, matrix multiplication (or more generally contraction of two tensors)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.dot)
---@param a mat|tensor Left vector, matrix or tensor
---@param b mat|tensor Right vector, matrix or tensor
---@return number|mat|tensor #A new vector, matrix or tensor (rank a_rank + b_rank - 2), whose axes are the non-contracted axes of t1 (in order) followed by those of t2. If both operands are vectors, the full contraction yields a single number (scalar dot product).
function pymath.dot(a, b) end

---**Vector product, matrix multiplication (or more generally contraction of two tensors)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.dot)
---@param a mat|tensor Left vector, matrix or tensor
---@param b mat|tensor Right vector, matrix or tensor
---@param a_axis integer 1-based position of the index of a that is contracted (summed over). Default: normal vector / matrix multiplication (last axis)
---@param b_axis integer 1-based position of the index of a that is contracted (summed over). Default: normal vector / matrix multiplication (first axis)
---@return number|mat|tensor #A new vector, matrix or tensor (rank a_rank + b_rank - 2), whose axes are the non-contracted axes of t1 (in order) followed by those of t2. If both operands are vectors, the full contraction yields a single number (scalar dot product).
function pymath.dot(a, b, a_axis, b_axis) end

--**Returns a new tensor (rank ≥ 2) with two axes exchanged.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.transpose)<br>
---@param m tensor Input tensor of rank ≥ 2.
---@param axis1 integer 1-based first axis to exchange. Defaults to 1. 0 selects the default.
---@param axis2 integer 1-based second axis to exchange. Defaults to 2. 0 selects the default.
---@return tensor #A new tensor with the sizes of axis1 and axis2 swapped. If axis1 == axis2, the result is an unchanged copy of m.
---With the default axes this is the ordinary matrix transpose.
function pymath.transpose(m, axis1, axis2) end

---**Returns the determinant of a square matrix.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.determinant)<br>
---@param a mat A square matrix (n × n), represented as an array of n row-vectors.
---@return number #The determinant of A as a number.
function pymath.determinant(a) end

---**Creates the n × n identity matrix.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.identity)<br>
---@param n integer The size of the (square) identity matrix. Must be ≥ 1.
---@return mat I A new n × n identity matrix (1 on the diagonal, 0 elsewhere).
---For n ≤ 10 a dense matrix is returned.<br>
---For larger n a [sparse matrix](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath#sparse-matrices) is returned (a size field plus one entry per row);<br>
---both forms are accepted as input by the other pymath functions.
function pymath.identity(n) end

---**Returns the trace of a square tensor: the sum of its diagonal elements.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.trace)<br>
---@param A mat|tensor
---@return number #The sum of the diagonal elements as a number.
function pymath.trace(A) end

---**Returns the inverse of a square matrix, or nil if the matrix is not invertible.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.inverse)<br>
---@param m mat A square matrix (n × n), represented as an array of n row-vectors.
---@return mat|nil #A new n × n matrix, the inverse of m, or nil if m is singular (not invertible).
---`m` must be square, otherwise an error is raised.
function pymath.inverse(m) end

---**Like [pymath.dot](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.dot), but stores the product back into `a`**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.dot_inplace)<br>
---@param a Vector Left vector
---@param b Vector Right vector
---@return number #Scalar
---If both operands are vectors, the full contraction yields a single number (scalar dot product).
function pymath.dot_inplace(a, b) end

---**Like [pymath.dot](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.dot), but stores the product back into `a`**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.dot_inplace)<br>
---@param a mat|tensor Left vector, matrix or tensor
---@param b mat|tensor Right vector, matrix or tensor
---@return number|mat|tensor #A new vector, matrix or tensor (rank a_rank + b_rank - 2), whose axes are the non-contracted axes of t1 (in order) followed by those of t2. If both operands are vectors, the full contraction yields a single number (scalar dot product).
function pymath.dot_inplace(a, b) end

---**Like [pymath.dot](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.dot), but stores the product back into `a`**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.dot_inplace)<br>
---@param a mat|tensor Left vector, matrix or tensor
---@param b mat|tensor Right vector, matrix or tensor
---@param a_axis integer 1-based position of the index of a that is contracted (summed over). Default: normal vector / matrix multiplication (last axis)
---@param b_axis integer 1-based position of the index of a that is contracted (summed over). Default: normal vector / matrix multiplication (first axis)
---@return number|mat|tensor #A new vector, matrix or tensor (rank a_rank + b_rank - 2), whose axes are the non-contracted axes of t1 (in order) followed by those of t2. If both operands are vectors, the full contraction yields a single number (scalar dot product).
function pymath.dot_inplace(a, b, a_axis, b_axis) end


---**Like pymath.transpose, but does not allocate a new tensor**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.transpose_inplace)<br>
---@param m tensor Input tensor of rank ≥ 2.
---@param axis1 integer 1-based first axis to exchange. Defaults to 1. 0 selects the default.
---@param axis2 integer 1-based second axis to exchange. Defaults to 2. 0 selects the default.
---@return tensor #A new tensor with the sizes of axis1 and axis2 swapped. If axis1 == axis2, the result is an unchanged copy of m.
---With the default axes this is the ordinary matrix transpose.
function pymath.transpose_inplace(m, axis1, axis2) end

---**In-place variant of [pymath.normalize](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.normalize)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.normalize_inplace)<br>
---@param v Vector A vector of any dimension.
---@param threshold? number Non-negative length at or below which the vector counts as too short. Default: an implementation defined tolerance.
---@return Vector? v Vector v
---@return number? len The original length of v (only on success).
---returns `nil` if the vector is too short to normalize reliably.
function pymath.normalize_inplace(v, threshold) end

---**Solves the square linear system `A . x == b`, returning the solution vector `x`, or `nil` if `A` is (close to) singular.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.solve_linear)<br>
---@param A mat A square matrix `(n x n)`, represented as an array of n row-vectors.
---@param b Vector The right-hand side, a table read as a vector of length n (missing entries read as 0).
function pymath.solve_linear(A, b) end

---**Solves the least-squares problem min |A . x - b|***
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.least_squares)<br>
---@param A mat An `m x n` matrix (`m` rows, `n` columns), represented as an array of `m` row-vectors.
---@param b Vector The right-hand side, a table read as a vector of length `m` (missing entries read as 0).
---@return Vector|nil #A new vector of length `n` minimizing the residual, or `nil` if `A` is (close to) rank-deficient.
function pymath.least_squares(A, b) end

---**Solves the least-squares problem min |A . x - b|**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.least_squares_box_constrained)<br>
---@param A mat An `m x n` matrix (m rows, n columns), represented as an array of `m` row-vectors.
---@param b Vector The right-hand side, a table read as a vector of length m (missing entries read as 0).
---@param constraints {upper:number?, lower:number?}[]
function pymath.least_squares_box_constrained(A, b, constraints) end

---**Solves the quadratic equation a x² + b x + c == 0**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.solve_quadratic)<br>
---@param a number Coefficient of x².
---@param b number Coefficient of x.
---@param c number The constant term.
---@param tolerance? number Non-negative bound on the imaginary part below which a complex pair still counts as a (double) real root. Default: an implementation defined tolerance.
---@return number|nil r_small The root of smaller absolute value, or nil if the equation has no real root at all.
---@return number|nil r_large The root of larger absolute value, or nil if there is no second finite root.
function pymath.solve_quadratic(a, b, c, tolerance) end

---**Solves for the real roots of a polynomial of arbitrary degree, optionally restricted to an interval.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.solve_polynomial)<br>
---@param coeff number[] The coefficients in descending power order
---@param interval {min:number, max:number} The interval to search. Either bound may be `nil` or omitted, in which case that side is unbounded. Default: unbounded on both sides.
---@param tolerance number Small positive bound below which a barely-touching or barely-complex root pair still counts as a real root. Default: an implementation defined tolerance.
---@return number[] roots A new array of the real roots in ascending order. Empty if the polynomial has no real root in the interval
function pymath.solve_polynomial(coeff, interval, tolerance) end

---**Builds a rotation  3×3 matrix (rotation about an axis in space) or 2×2 (rotation in the plane)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.rotation_matrix)<br>
---@param axis axis (3×3 form only) Rotation axis, given as a 3-vector or as an axis keyword string ("x", "y", "z", "-x", "-y", "-z"), as for local coordinate systems. Normalized internally.
---@param angle number 	Rotation angle in degrees.
---@return mat m A new rotation matrix, represented as an array of row-vectors. 3×3 when an axis is given, 2×2 when only an angle is given.
function pymath.rotation_matrix(axis, angle) end

---**Builds a rotation 2×2 (rotation in the plane)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.rotation_matrix)<br>
---@param angle number 	Rotation angle in degrees.
---@return mat m A new rotation matrix, represented as an array of row-vectors. 3×3 when an axis is given, 2×2 when only an angle is given.
function pymath.rotation_matrix(angle) end


---**Builds the unit quaternion that represents a rotation by `angle` about `axis`.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.quat_from_rotation)<br>
---@param axis axis Rotation axis, given either as a 3-vector or as an axis keyword string ("x", "y", "z", "-x", "-y", "-z"), exactly as for local coordinate systems. It is normalized internally, so it need not be a unit vector.
---@param angle number Rotation angle in degrees.
---@return quaternion q A new unit quaternion {x, y, z, w} describing the rotation.
function pymath.quat_from_rotation(axis, angle) end

---**Computes the quaternion corresponding to a 3×3 rotation matrix.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.quat_from_matrix)<br>
---@param mat mat A 3×3 rotation matrix, represented as an array of three row-vectors. Missing or non-numeric entries are read as 0.
---@return quaternion q A new unit quaternion `{x, y, z, w}` describing the same rotation as `mat`.
function pymath.quat_from_matrix(mat) end


---**Extracts the rotation axis and angle from a quaternion.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.rotation_from_quat)<br>
---@param q quaternion A quaternion {x, y, z, w}. It is normalized internally, so it need not be a unit quaternion.
---@return Vector axis #A new unit 3-vector, the rotation axis.
---@return number angle The rotation angle in degrees.
function pymath.rotation_from_quat(q) end

---**Computes the 3×3 rotation matrix corresponding to a quaternion.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.matrix_from_quat)<br>
---@param q quaternion A quaternion `{x, y, z, w}`. It is normalized internally if necessary, so it need not be a unit quaternion.
---@return mat mat A new 3×3 rotation matrix, represented as an array of three row-vectors.
function pymath.matrix_from_quat(q) end


---**Multiplies two quaternions, composing the rotations they represent.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.multiply_quat)<br>
---@param q1 quaternion Left quaternion `{x, y, z, w}`.
---@param q2 quaternion Right quaternion `{x, y, z, w}`.
---@return quaternion q A new quaternion, the product `q1 * q2`.
function pymath.multiply_quat(q1, q2) end


---**Computes the inverse of a quaternion, i.e. the inverse rotation.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.invert_quat)<br>
---@param q quaternion A quaternion {x, y, z, w}.
---@return quaternion q_inv A new quaternion, the inverse of `q`.
function pymath.invert_quat(q) end

---**Interpolates between two quaternions along the shortest arc.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.interpolate_quat)<br>
---@param q1 quaternion Start quaternion `{x, y, z, w}` (returned for `t = 0`).
---@param q2 quaternion End quaternion `{x, y, z, w}` (returned for `t = 1`).
---@param t number Interpolation parameter in `[0, 1]`.
---@return quaternion q	A new quaternion interpolated between `q1` and `q2`.
function pymath.interpolate_quat(q1, q2, t) end

---**Rotates a 3-vector with the rotation being represented as a quaternion.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.rotate_by_quat)<br>
---@param v Vector The 3-vector to rotate.
---@param q quaternion The rotation quaternion `{x, y, z, w}`.
---@return Vector w #A new 3-vector, v rotated by q
function pymath.rotate_by_quat(v, q) end

---**Rotates a 3-vector with the rotation being represented as a quaternion.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.rotate_by_quat)<br>
---@param v Vector The 3-vector to rotate.
---@param q quaternion The rotation quaternion `{x, y, z, w}`.
---@param center Vector Center of rotation. When given, the result is center + rot · (v - center)
---@return Vector w #A new 3-vector, v rotated by q around center
function pymath.rotate_by_quat(v, q, center) end


---**Builds the 3×3 rotation matrix for a set of ZXZ Euler angles.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.matrix_from_euler_angles)<br>
---@param alpha number First rotation about the z-axis, in **degrees**.
---@param beta number Rotation about the (rotated) x-axis, in **degrees**.
---@param gamma number Final rotation about the (rotated) z-axis, in **degrees**.
---@return mat #A new 3×3 rotation matrix rot(z, alpha) · rot(x, beta) · rot(z, gamma), represented as an array of three row-vectors.
function pymath.matrix_from_euler_angles(alpha, beta, gamma) end

---**Extracts the three ZXZ Euler angles from a 3×3 rotation matrix.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.euler_angles_from_matrix)<br>
---@param mat mat A 3×3 rotation matrix, represented as an array of three row-vectors. Missing or non-numeric entries are read as 0.
---@return number alpha First z-rotation, in **degrees**.
---@return number beta x-rotation, in degrees; returned in the range `[0, 180]`.
---@return number gamma Final z-rotation, in **degrees**.
function pymath.euler_angles_from_matrix(mat) end


---**Evaluates a Bézier curve at parameter t, given its control points.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.eval_bezier)<br>
---@param t number Curve parameter, typically in `[0, 1].`
---@param p1 number
---@param p2 number
---@param ... number The control points (at least two). n points define a Bézier curve of degree n - 1.
---@return number #The curve point at t
---
---See also
---[`pymath.eval_bezier_deriv`](Https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.eval_bezier_deriv)
---[`pymath.interpolate_cubic`](Https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.interpolate_cubic)
function pymath.eval_bezier(t, p1, p2, ...) end

---**Evaluates a Bézier curve at parameter t, given its control points.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.eval_bezier)<br>
---@param t number Curve parameter, typically in `[0, 1].`
---@param p1 Point
---@param p2 Point
---@param ... Point The control points (at least two). n points define a Bézier curve of degree n - 1.
---@return Point #The curve point at t: a point of the same dimension as the control points
---
---See also
---[`pymath.eval_bezier_deriv`](Https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.eval_bezier_deriv)
---[`pymath.interpolate_cubic`](Https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.interpolate_cubic)
function pymath.eval_bezier(t, p1, p2, ...) end


---**Evaluates the derivative of a Bézier curve at parameter t (its tangent).**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.eval_bezier_deriv)<br>
---@param t number Curve parameter, typically in `[0, 1].`
---@param p1 number
---@param p2 number
---@param ... number The control points (at least two).
---@return number #The curve point at t
---
---See also
---[`pymath.eval_bezier`](Https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.eval_bezier)
---[`pymath.interpolate_cubic`](Https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.interpolate_cubic)
function pymath.eval_bezier_deriv(t, p1, p2, ...) end


---**Evaluates the derivative of a Bézier curve at parameter t (its tangent).**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.eval_bezier_deriv)<br>
---@param t number Curve parameter, typically in `[0, 1].`
---@param p1 Point
---@param p2 Point
---@param ... Point The control points (at least two). n points define a Bézier curve of degree n - 1.
---@return Point #The curve point at t: a point of the same dimension as the control points
---
---See also
---[`pymath.eval_bezier`](Https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.eval_bezier)
---[`pymath.interpolate_cubic`](Https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.interpolate_cubic)
function pymath.eval_bezier_deriv(t, p1, p2, ...) end

---**Interpolates a smooth cubic curve (B-Spline) through a list of points, returned as cubic Bézier segments.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.interpolate_cubic)<br>
---@param type "open" | "closed" `"open"` or `"closed"` (as in [`pytha.create_polyline`](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_polyline)).
---@param points (Point|number)[] Array of points to interpolate. Each point can be either an array of length d for d-dimensional space or a number in 1D.
---@param start_tangent? Vector For an `"open"` curve only, the tangent direction at the first point — the same shape as a point
---@param end_tangent? Vector For an `"open"` curve only, the tangent direction at the last point.
---@param knot_spans? number[] The parameter interval of each segment, replacing the default chord-length spacing: `n` positive numbers for `"closed"`, `n - 1` for `"open"`.
---@return (Point|number)[] | nil #A flat list of control points describing the cubic Bézier segments, or `nil` if the curve could not be built (see Notes). Each control point has the same shape as an input point (a `d`-vector, or a plain number when `points` was given as a flat list of numbers). Successive segments share their joint control point: points `1..4` are the first segment, `4..7` the second, and so on. An `"open"` curve returns `3 * (n - 1) + 1` control points, a `"closed"` curve `3 * n` (its last segment closes back to the first point).
function pymath.interpolate_cubic(type, points, start_tangent, end_tangent, knot_spans) end

---**Linear interpolation between two numbers**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.interpolate_linear)<br>
---@param v number Start value (returned for t == 0).
---@param w number End value (returned for t == 1); the same shape as v.
---@param t number Interpolation parameter.
---@return number #`v + (w - v) * t`
function pymath.interpolate_linear(v, w, t) end

---**Linear interpolation between two vectors.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.interpolate_linear)<br>
---@param v Vector Start value (returned for t == 0).
---@param w Vector End value (returned for t == 1); the same shape as v.
---@param t number Interpolation parameter.
---@return Vector #`v + (w - v) * t`
function pymath.interpolate_linear(v, w, t) end


---**Clamps a number to an interval.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.clamp)<br>
---@param t number The value to clamp.
---@param min? number Lower bound. nil means no lower bound.
---@param max? number Upper bound, like min.
---@return number #The clamped number.
function pymath.clamp(t, min, max) end


---**Clamps a vector to an interval, component-wise.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.clamp)<br>
---@param t Vector The value to clamp.
---@param min? number|Vector Lower bound. A number applies to every component, a vector bounds each component individually. nil (as the argument, or as a single vector entry) means no lower bound.
---@param max? number|Vector Upper bound, like min.
---@return Vector #A new vector with each component clamped.
function pymath.clamp(t, min, max) end


---**Clamps a number to `[0, 1]`**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.clamp)<br>
---@param t number The value to clamp.
---@return number #The clamped number.
function pymath.clamp(t) end

---**Clamps a Vector to `[0, 1]`**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.clamp)<br>
---@param t Vector The value to clamp.
---@return Vector #A new vector with each component clamped.
function pymath.clamp(t) end


--**Smoothly ramps from 0 to 1 as t crosses an interval — a smooth replacement for a hard step or a plain [pymath.clamp](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.clamp)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.smooth_step)<br>
---@param t number Input value.
---@param t_min? number Start of the ramp: the result is `0` for `t <= t_min`. Default `0`.
---@param t_max? number End of the ramp: the result is `1` for `t >= t_max`. Default `1`. Must differ from `t_min`.
---@return number #A number in `[0, 1]` that increases smoothly (with zero slope at both ends) as t runs from `t_min` to `t_max`, and is constant outside the interval.
---The ramp is the cubic Hermite smoothstep `s = 3u² - 2u³`, where `u` is `t` rescaled to `[0, 1]` and clamped.<br>
---Unlike pymath.interpolate_linear, the result is clamped: `0` below `t_min`, `1` above `t_max`.<br>
--Swapping the bounds `(t_min > t_max)` yields a descending ramp from `1` down to `0`.<br>
--smooth_step operates on numbers only.<br>
function pymath.smooth_step(t, t_min, t_max) end