# coding: utf-8
require 'active_record'
require 'database_cleaner'
require 'pry'

ActiveRecord::Base.configurations = { 'test' => { :adapter => 'sqlite3', :database => ':memory:' } }
ActiveRecord::Base.establish_connection(:test)

class CreateTables < ActiveRecord::Migration
  def self.up
    create_table(:posts) {|t| t.string :title; t.text :description; }
  end
end

DatabaseCleaner[:active_record].strategy = :transaction

RSpec.configure do |c|
  c.before :all do
    CreateTables.up unless ActiveRecord::Base.connection.table_exists?(:posts)
  end

  c.before :suite do
    DatabaseCleaner.clean_with :truncation
  end

  c.after :each do
    DatabaseCleaner.clean
  end
end
