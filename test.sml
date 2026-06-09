infix >>=
fun op>>= (SOME a, f) = f a
  | op>>= (NONE, _) = NONE

val result =
  SOME 1 >>= (fn a =>
  SOME 2 >>= (fn b =>
  let
    val c = 3
    val d = 4
  in
  SOME 5 >>= (fn e =>
  SOME (a + b + c + d + e))
  end))