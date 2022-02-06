defmodule KitchenCalculator do

  #We don't care which type of unit we receive, we just care about the volume
  def get_volume({_, volume} = volume_pair) do
    volume
  end

  def to_milliliter(volume_pair) do
    milliliters = case volume_pair do
      {:milliliter, volume} -> volume
      {:cup, volume} -> volume * 240
      {:fluid_ounce, volume} -> volume * 30
      {:teaspoon, volume} -> volume * 5
      {:tablespoon, volume} -> volume * 15
    end
    {:milliliter, milliliters}
  end

  # def to_milliliter({:milliliter, volume} = volume_pair) do
  #   {:milliliter, volume}
  # end

  # def to_milliliter({:cup, volume} = volume_pair) do
  #   {:milliliter, volume * 240}
  # end

  # def to_milliliter({:fluid_ounce, volume} = volume_pair) do
  #   {:milliliter, volume * 30}
  # end

  # def to_milliliter({:teaspoon, volume} = volume_pair) do
  #   {:milliliter, volume * 5}
  # end

  # def to_milliliter({:tablespoon, volume} = volume_pair) do
  #   {:milliliter, volume * 15}
  # end

  def from_milliliter({:milliliter, volume} = volume_pair, unit) do
    converted_unit = case unit do
      :milliliter -> volume
      :cup -> volume / 240
      :fluid_ounce -> volume / 30
      :teaspoon -> volume / 5
      :tablespoon -> volume / 15
    end
    {unit, converted_unit}
  end

  def convert(volume_pair, unit) do
    {unit, elem(from_milliliter(to_milliliter(volume_pair), unit), 1)}
  end
end
