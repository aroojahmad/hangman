defmodule Dictionary do
  #module attribute created at compile time
  @word_list "assets/words.txt"
  |> File.read!()
  |> String.split(~r/\n/, trim: true)

  #transforming word list
  def random_word do
    @word_list
    |> Enum.random()
  end



end
