#!/usr/bin/env elixir

defmodule PS2 do

  def collection(name) do
      {:ok, bin} = :file.read_file name
      :lists.foldl(fn x, xcc ->
                 [_title|discs] = String.split(x,"\n")
#                 :io.format('~ts: [~ts]~n',[studio,title])
                 :lists.foldl(fn y, _cc ->
                    :io.format('~ts~n',[y])
                 end, 0, discs)
                 length(discs) + xcc
         end, 0,  String.split(bin, "\n\n"))
  end

  def games do
      {:ok, bin} = :file.read_file "bundles.txt"
#     {:ok, bin} = :file.read_file "playstation2.txt"
      :lists.foldl(fn x, acc -> :io.format 'Line: ~ts~n', [x] ; acc + 1
         end, 0,  String.split(bin, "|-"))
  end

end

case System.argv() do
 _ -> :io.format('Copyright © 2024 Namdak Tonpa. ~n')
#      :io.format('Count: ~p ~n', [PS2.collection "gran-turismo.txt"])
      :io.format('Count: ~p ~n', [PS2.collection "grand-theft-auto.txt"])
end
