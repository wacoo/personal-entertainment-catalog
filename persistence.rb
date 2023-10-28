require 'json'
require 'fileutils'

class Persistence
  def initialize
    FileUtils.mkdir_p('db')
  end

  def save(file_name, obj_list)
    pretty_json = JSON.pretty_generate(obj_list)
    File.write("db/#{file_name}.json", pretty_json)
  end

  def load(file_name)
    if File.exist?("db/#{file_name}.json") && !File.empty?("db/#{file_name}.json")
      json = File.read("db/#{file_name}.json")
      hash_list = JSON.parse(json)
      return hash_list
    end
    []
  end
end
