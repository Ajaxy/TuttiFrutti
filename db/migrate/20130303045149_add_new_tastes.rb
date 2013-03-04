# encoding: utf-8

class AddNewTastes < ActiveRecord::Migration
  def up
    #Taste.create(:code => "Oreo", :sort_order => 52, :name => "Печенье с кремом", :color => "935e26", :yogurt => "зеленое яблоко, ваниль, банан", :fruits => "банан, клубника, голубика", :liquid => "карамель, шоколад", :topings => "ореховая смесь, дробленый арахис, йогуртовые чипсы")
    #Taste.create(:code => "Blueberry_Cheese_Cake", :sort_order => 11, :name => "Черничный чизкейк", :color => "4a5d91", :yogurt => "классический, клубника, малина", :fruits => "голубика, клубника, киви", :liquid => "клубника, шоколад", :topings => "мотчи, ореховая смесь, кокос")

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
