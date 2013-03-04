class AddSortOrderToTastes < ActiveRecord::Migration
  def change
    add_column :tastes, :sort_order, :int
    
    Taste.all.each do |taste|
      taste.update_attributes!(:sort_order => taste.id)
    end
    Taste.find(2).update_attributes(:sort_order => 53)
    Taste.find(11).update_attributes(:sort_order => 2)
  end
end
