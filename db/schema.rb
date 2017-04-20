# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170420163859) do

  create_table "collaborations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "team_name"
    t.string   "purpose"
    t.integer  "member_limit"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "collaborations_students", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "collaboration_id"
    t.index ["student_id", "collaboration_id"], name: "index_collaborations_students_on_student_id_and_collaboration_id", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "thesis_id"
    t.integer  "student_id"
    t.string   "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thesis_id", "student_id"], name: "index_projects_on_thesis_id_and_student_id", using: :btree
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",      limit: 50
    t.string   "last_name",       limit: 25
    t.string   "user_name",       limit: 50
    t.string   "email"
    t.string   "student_number",  limit: 10
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "password_digest"
    t.string   "profile_pic"
  end

  create_table "temp", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "team_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "student_name"
  end

  create_table "theses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",      limit: 20
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "attachment"
  end

end
