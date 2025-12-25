import gleam/option.{type Option, Some, None, unwrap}
import gleam/int

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(_, _, health, _) if health > 0 -> None
    Player(_, level, _, _) if level >= 10 -> Some(Player(..player, health: 100, mana: Some(100)))
    _ -> Some(Player(..player, health: 100))
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player {
    Player(_, _, _, None) -> #(Player(..player, health: int.max(player.health - cost, 0)), 0)
    Player(_, _, _, Some(mana)) if mana >= cost -> #(Player(..player, mana: Some(mana - cost)), cost * 2)
    _ -> #(player, 0)
  }
}
