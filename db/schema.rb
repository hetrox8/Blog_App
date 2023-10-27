ActiveRecord::Schema[7.1].define(version: 202_310_261_812_49) do
  enable_extension 'plpgsql'

  # Define the 'users' table
  def create_users_table
    create_table 'users', force: :cascade do |t|
      t.string 'name', null: false
      t.string 'photo'
      t.text 'bio'
      t.integer 'posts_counter', default: 0
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
  end

  # Define the 'posts' table
  def create_posts_table
    create_table 'posts', force: :cascade do |t|
      t.string 'title', null: false
      t.text 'text'
      t.integer 'comments_counter', default: 0
      t.integer 'likes_counter', default: 0
      t.bigint 'author_id', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['author_id'], name: 'index_posts_on_author_id'
    end
  end

  # Define other tables in a similar way

  # Call the table definition methods
  create_users_table
  create_posts_table
end
