class ChangeSoyToKindInTastes < ActiveRecord::Migration
  def up
    add_column :tastes, :kind, :integer, default: 0

    Taste.reset_column_information
    Taste.where(soy: true).update_all(kind: 1)

    remove_column :tastes, :soy
  end

  def down
    add_column :tastes, :soy, :boolean, default: false

    Taste.reset_column_information
    Taste.where('kind > 0').update_all(soy: true)

    remove_column :tastes, :kind
  end
end
