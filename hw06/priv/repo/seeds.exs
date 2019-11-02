# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hw06.Repo.insert!(%Hw06.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Hw06.Repo
alias Hw06.Users.User

pw = Argon2.hash_pwd_salt("password12345")

alice = Repo.insert!(%User{name: "Alice", email: "alice@example.com", password_hash: pw, ismanager: true})
Repo.insert!(%User{name: "Bob", email: "bob@example.com", password_hash: pw, ismanager: false, managerid: alice.id})