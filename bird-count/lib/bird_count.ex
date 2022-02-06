defmodule BirdCount do

  def today([]), do: nil

  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]
  def increment_day_count(list), do: [hd(list) + 1 | tl(list)]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([head | tail]) when head != 0, do: has_day_without_birds?(tail)
  def has_day_without_birds?([head | _]) when head == 0, do: true


  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  def busy_days(list), do: count_busy_days(list)

  defp count_busy_days([]), do: 0

  defp count_busy_days([head | tail]) when head >= 5, do: 1 + busy_days(tail)

  defp count_busy_days([head | tail]) when head < 5, do: busy_days(tail)

end
