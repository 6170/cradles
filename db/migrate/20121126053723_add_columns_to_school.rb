class AddColumnsToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :zipcode, :string
    add_column :schools, :school_type, :string
    add_column :schools, :location, :string
    add_column :schools, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :schools, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end
