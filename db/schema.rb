ActiveRecord::Schema[7.1].define(version: 202_310_261_812_49) do
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.text 'text'
    t.bigint 'post_id', null: false
    t.bigint 'author_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'post_id', null: false
    t.bigint 'author_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'text'
    t.integer 'comments_counter', default: 0
    t.integer 'likes_counter', default: 0
    t.bigint 'author_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'photo'
    t.text 'bio'
    t.integer 'posts_counter', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'comments', ['author_id'], name: 'index_comments_on_author_id'
  add_index 'comments', ['post_id'], name: 'index_comments_on_post_id'
  add_index 'likes', ['author_id'], name: 'index_likes_on_author_id'
  add_index 'likes', ['post_id'], name: 'index_likes_on_post_id'
  add_index 'posts', ['author_id'], name: 'index_posts_on_author_id'

  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users', column: 'author_id'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'likes', 'users', column: 'author_id'
  add_foreign_key 'posts', 'users', column: 'author_id'
end
