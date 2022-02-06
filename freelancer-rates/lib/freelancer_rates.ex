defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    (hourly_rate * 8.0)
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_rate_without_discount = daily_rate(hourly_rate) * 22
    ceil(apply_discount(monthly_rate_without_discount, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount), 1)
  end
end
