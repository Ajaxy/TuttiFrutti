# encoding: utf-8

class AddNewTastes < ActiveRecord::Migration
  def up
    add_column :tastes, :soy, :boolean, :default => false

    Taste.find(5).update_attributes(:soy => true)
    Taste.find(38).update_attributes(:soy => true)
  end

  def down
    remove_column :tastes, :soy

    Taste.destroy(:code => "Oreo")
    Taste.destroy(:code => "Blueberry_Cheese_Cake")
  end
end
