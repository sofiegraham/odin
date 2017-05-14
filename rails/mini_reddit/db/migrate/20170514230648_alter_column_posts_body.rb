class AlterColumnPostsBody < ActiveRecord::Migration[5.0]
  def self.up
    change_table :posts do |t|
      t.change :body, :text
    end
  end
  def self.down
    change_table :posts do |t|
      t.change :body, :string
    end
  end
end
