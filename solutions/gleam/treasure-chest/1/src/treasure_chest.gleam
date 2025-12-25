// Please define the TreasureChest generic custom type
pub type TreasureChest(treasure_type) {
  TreasureChest(password: String, treasure: treasure_type)
}

// Please define the UnlockResult generic custom type
pub type UnlockResult(treasure_type) {
  Unlocked(treasure: treasure_type)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest {
    TreasureChest(pass, treasure) if pass == password -> Unlocked(treasure)
    _ -> WrongPassword
  }
}
