class ChangeSubColumn < ActiveRecord::Migration
  def change
    remove_column :subs, :moderator_id
    add_column :subs, :author_id, :integer 
  end

end
