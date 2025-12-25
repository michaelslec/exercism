import gleam/int
import gleam/string

pub fn convert(number: Int) -> String {
  let res = 
    ""
    |> convert_helper(number, 3, "Pling")
    |> convert_helper(number, 5, "Plang")
    |> convert_helper(number, 7, "Plong")

  case string.is_empty(res) {
    True -> int.to_string(number)
    False -> res
  } 
}

fn convert_helper(acc: String, dividend: Int, divisor: Int, sound: String) -> String {
  case dividend % divisor {
    0 -> acc <> sound
    _ -> acc
  }
}