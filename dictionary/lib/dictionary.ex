defmodule Dictionary do
  #module attribute created at compile time

  alias Dictionary.Impl.WordList

  @opaque t :: WordList.t

  @spec start() :: t
  defdelegate start, to: WordList, as: :word_list

  #transforming word list
  @spec random_word(t) :: String.t
  defdelegate random_word(word_list), to: WordList

end
