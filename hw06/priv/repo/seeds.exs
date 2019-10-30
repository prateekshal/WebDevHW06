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
alias Hw06.Jobs.Job

Repo.insert!(%Job{name: "Cyborg Arm",desc: "Cyborg Arm", jobid: "VAOR-01", budget: 20.00})
Repo.insert!(%Job{name: "Sobriety Pill", desc: "Sobriety Pill", jobid: "VAOR-02", budget: 45.00})
