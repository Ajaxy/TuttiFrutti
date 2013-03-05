# encoding: utf-8

class AddNewSoyTastes < ActiveRecord::Migration
  def up
    Taste.create(:code => "Oreo", :sort_order => 52, :name => "Печенье с кремом", :color => "935e26", :yogurt => "зеленое яблоко, ваниль, банан", :fruits => "банан, клубника, голубика", :liquid => "карамель, шоколад", :topings => "ореховая смесь, дробленый арахис, йогуртовые чипсы")
    Taste.create(:code => "Blueberry_Cheese_Cake", :sort_order => 11, :name => "Черничный чизкейк", :color => "4a5d91", :yogurt => "классический, клубника, малина", :fruits => "голубика, клубника, киви", :liquid => "клубника, шоколад", :topings => "мотчи, ореховая смесь, кокос")
  end

  def down
    Taste.destroy(:code => "Oreo")
    Taste.destroy(:code => "Blueberry_Cheese_Cake")
  end
end
