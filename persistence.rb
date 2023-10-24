class Persistence
    def initialize
        if !Dir.exists?('db')
            Dir.mkdir('db')
        end
    end

    def save(file_name, obj_list)
        File.open("#{file_name}.json", "w") do |file|
            file.write(obj_list)
        end
    end
end

per = Persistence.new