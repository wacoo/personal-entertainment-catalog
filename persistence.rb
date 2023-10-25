require 'json'
class Persistence
    def initialize
        if !Dir.exists?('db')
            Dir.mkdir('db')
        end
    end

    def save(file_name, obj_list)
        json = File.read("#{file_name}.json")
        data = JSON.parse(json)
        data
    end

    def load(file_name)
        json = File.read("#{file_name}.json")
        hash_list = JSON.parse(json)
        hash_list
    end
end

per = Persistence.new