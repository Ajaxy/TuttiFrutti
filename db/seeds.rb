require "csv"

file    = Rails.root.join("db/tastes.csv")
columns = %w[id code name yogurt fruits topings liquid color votes]

CSV.foreach(file, col_sep: "\t") do |row|
  attrs = Hash[columns.zip(row)]
  attrs["votes"] ||= 0
  Taste.create!(attrs)
end
