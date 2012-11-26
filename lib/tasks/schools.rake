require 'csv' 

task :load_schools => :environment do
  School.delete_all
  CSV.foreach('data/boston_school.csv', :headers => true) do |row|
    row = row.to_hash.with_indifferent_access
    latlng = /\((\-?\d+\.\d+), (\-?\d+\.\d+)\)/.match row[:location]
    row[:lat] = latlng[1].to_d
    row[:lng] = latlng[2].to_d
    School.create!(row)
  end
end