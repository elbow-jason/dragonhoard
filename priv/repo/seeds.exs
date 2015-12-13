# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DragonHoard.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias DragonHoard.Repo
alias DragonHoard.User
alias DragonHoard.Shop
alias DragonHoard.Product
alias DragonHoard.MetaItem
alias DragonHoard.Configuration


Repo.insert! %User{
  email: "jgoldberger@leaf.ag",
  pw_hash: "ZZZ",
  roles: ["admin", "user"],
}

Repo.insert! %Shop{
  name: "Jason's Shop"
}

Repo.insert! %Product{
  name: "Cell Phone",
  kind_of: "electronic",
}

Repo.insert! %MetaItem{
  name: "Generic Ring One",
  kind_of: "ring",
}