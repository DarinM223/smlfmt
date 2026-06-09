infix >>=
fun op>>= (SOME a, f) = f a
  | op>>= (NONE, _) = NONE

(* Nested twice, so moves to do-notation style to prevent indentation *)
val result =
  SOME 1 >>= (fn a =>
  SOME 2 >>= (fn b =>
  let
    val c = 3
    val d = 4
  in
    SOME 5 >>= (fn e =>
    SOME 6 >>= (fn f =>
    SOME (a + b + c + d + e + f)))
  end))


val _ =
  Vector.foreach (v1, fn a =>
  Vector.foreach (v2, fn b =>
  print ("v1: " ^ a ^ " v2: " ^ b ^ "\n")))

(* Only a single continuation, so remains the same *)
val unchanged = SOME 1 >>= (fn a => SOME (a + 1))
(* Not nested, so remains the same *)
val unchanged = SOME 1 >>= (fn a => SOME (a + 1)) >>= (fn a => SOME (a + 1))

infix |>
fun a |> f = f a

val result =
  SOME 1 >>= (fn a =>
  SOME 2 >>= (fn b =>
  3 |> (fn c =>
  4 |> (fn d =>
  SOME 5 >>= (fn e =>
  SOME 6 >>= (fn f =>
  SOME (a + b + c + d + e + f)))))))

val result =
  case
    SOME 1 >>= (fn a =>
    SOME 2 >>= (fn b =>
    SOME (a + b)))
  of
    SOME result => print ("SOME " ^ Int.toString result ^ "\n")
  | NONE => print "NONE"

val result = Option.map (fn a => a + 1)
  (SOME 1 >>= (fn a =>
   SOME 2 >>= (fn b =>
   SOME (a + b))))
