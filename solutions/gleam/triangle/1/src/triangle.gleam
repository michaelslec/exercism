pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_valid_triangle(a, b, c) && {a == b && b == c}
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_valid_triangle(a ,b, c) && {a == b || b == c || c == a}
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_valid_triangle(a ,b, c) && {a != b && b != c && c != a}
}

pub fn is_valid_triangle(a: Float, b: Float, c: Float) -> Bool {
  a +. b >. c && b +. c >. a && c +. a >. b
}