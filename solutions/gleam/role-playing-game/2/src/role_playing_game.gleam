import gleam/option.{type Option, Some, None, unwrap}
import gleam/int

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 -> Some(Player(..player, health: 100, mana: {
      case player.level >= 10 {
        True -> Some(100)
        False -> player.mana
      }
    }))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) if mana >= cost -> #(Player(..player, mana: Some(mana - cost)), cost * 2)
    Some(mana) -> #(player, 0)
    None -> #(Player(..player, health: int.max(player.health - cost, 0)), 0)
  }
}
