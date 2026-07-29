---@meta pymath


---**The pymath library contains mathematical helper functions**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath)<br>
---
---See also:
---[Math functions](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/Math-functions)
pymath = {}
---@alias mat number[][]
---@alias tensor mat[]


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
---[View documents]()<br>
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


---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.dot_inplace)<br>
function pymath.dot_inplace() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.transpose_inplace)<br>
function pymath.transpose_inplace() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.normalize_inplace)<br>
function pymath.normalize_inplace() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.solve_linear)<br>
function pymath.solve_linear() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.least_squares)<br>
function pymath.least_squares() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.least_squares_box_constrained)<br>
function pymath.least_squares_box_constrained() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.solve_quadratic)<br>
function pymath.solve_quadratic() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.solve_polynomial)<br>
function pymath.solve_polynomial() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.rotation_matrix)<br>
function pymath.rotation_matrix() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.quat_from_rotation)<br>
function pymath.quat_from_rotation() end
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.quat_from_matrix)<br>
function pymath.quat_from_matrix() end
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.rotation_from_quat)<br>
function pymath.rotation_from_quat() end
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.matrix_from_quat)<br>
function pymath.matrix_from_quat() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.multiply_quat)<br>
function pymath.multiply_quat() end
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.invert_quat)<br>
function pymath.invert_quat() end
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.interpolate_quat)<br>
function pymath.interpolate_quat() end
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.rotate_by_quat)<br>
function pymath.rotate_by_quat() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.matrix_from_euler_angles)<br>
function pymath.matrix_from_euler_angles() end
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.euler_angles_from_matrix)<br>
function pymath.euler_angles_from_matrix() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.eval_bezier)<br>
function pymath.eval_bezier() end
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.eval_bezier_deriv)<br>
function pymath.eval_bezier_deriv() end
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.interpolate_cubic)<br>
function pymath.interpolate_cubic() end

---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.interpolate_linear)<br>
function pymath.interpolate_linear() end
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.clamp)<br>
function pymath.clamp() end
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pymath.smooth_step)<br>
function pymath.smooth_step() end