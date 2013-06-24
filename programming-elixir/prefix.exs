prefix = fn p -> fn s -> "#{p} #{s}" end end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")
