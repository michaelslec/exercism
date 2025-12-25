import gleam/list.{fold}
import gleam/int

pub fn convert(number: Int) -> String {
  let res = fold(
    [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")],
    "",
    fn(acc, curr) {
      acc <> case number % curr.0 == 0 {True -> curr.1 _ -> ""}
    })

  case res { "" -> int.to_string(number) _ -> res}
}
