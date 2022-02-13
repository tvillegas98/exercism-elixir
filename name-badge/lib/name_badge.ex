defmodule NameBadge do

  def print(id, name, department) do
    id_str = if not is_nil(id), do: "[#{id}] - ", else: ""
    department_str = if not is_nil(department), do: "#{String.upcase(department)}", else: "OWNER"
    "#{id_str}#{name} - #{department_str}"
  end
end
