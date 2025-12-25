import gleam/string

pub fn message(log_line: String) -> String {
  let message = string.split_once(log_line, "]: ")
  case message {
    Ok(#(left, right)) -> string.trim(right)
    Error(_) -> ""
  }
}

pub fn log_level(log_line: String) -> String {
  let message = string.split_once(log_line, "]: ")
  case message {
    Ok(#(left, right)) -> string.lowercase(string.slice(left, 1, string.length(left) - 1))
    Error(_) -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  let message = message(log_line)
  let log_level = log_level(log_line)
  message <> " (" <> log_level <> ")"
}
