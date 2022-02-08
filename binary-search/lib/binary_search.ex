defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """



  def search({}, _key), do: :not_found
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    size = tuple_size(numbers)
    mid_length = div(size, 2)
    element = elem(numbers, mid_length)

    cond do
      key < element -> search(numbers, key, 0, mid_length)
      key > element -> search(numbers, key, mid_length + 1, tuple_size(numbers))
      key == element -> {:ok, mid_length}
    end

  end

  defp search(_numbers, _key, left, right) when left >= right, do: :not_found

  defp search(numbers, key, left, right) do

    mid_length = div((right + left), 2)
    element = elem(numbers, mid_length)

    cond do
      key < element -> search(numbers, key, 0, mid_length)
      key > element -> search(numbers, key, mid_length + 1, right)
      key == element -> {:ok, mid_length}
    end

  end


end
