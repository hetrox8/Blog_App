ActiveRecord::Schema[7.1].define(version: 2023_10_25_143040) do
  enable_extension "plpgsql"

  create_table_comments
  create_table_likes
  create_table_posts
  create_table_users

  add_foreign_key
end

def create_table_comments
  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.bigint "posts_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["posts_id"], name: "index_comments_on_posts_id"
  end

def create_table_likes
  create_table "likes", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_likes_on_author_id"
    t.index ["post_id"], name: "index_likes_on_post_id"
  end

def create_table_posts
  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.text "text"
    t.integer "comments_counter", default: 0
    t.integer "likes_counter", default: 0
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
  end

def create_table_users
  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "photo"
    t.text "bio"
    t.integer "posts_counter", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "posts", column: "posts_id"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users", column: "author_id"
  add_foreign_key "posts", "users", column: "author_id"
end
