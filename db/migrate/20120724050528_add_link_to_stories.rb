class AddLinkToStories < ActiveRecord::Migration
  def change
    remove_column :stories, :link
    add_column :stories, :link, :string, :unique => true
  end
end


def add_column(table, column, type, *options)

end