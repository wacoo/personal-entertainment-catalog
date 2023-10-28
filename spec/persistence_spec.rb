require 'rspec'
require_relative '../persistence'

RSpec.describe Persistence do
  let(:persistence) { Persistence.new }

  describe '#initialize' do
    it 'creates a db directory' do
      expect(File.directory?('db')).to be_truthy
    end
  end

  describe '#save' do
    it 'saves an object list to a file' do
      file_name = 'test_file'
      obj_list = [{ name: 'John', age: 30 }, { name: 'Alice', age: 25 }]

      persistence.save(file_name, obj_list)

      expect(File.exist?("db/#{file_name}.json")).to be_truthy
    end
  end

  describe '#load' do
    it 'returns an empty array for a non-existing file' do
      file_name = 'non_existing_file'

      loaded_obj_list = persistence.load(file_name)

      expect(loaded_obj_list).to eq([])
    end

    it 'returns an empty array for an empty file' do
      file_name = 'empty_file'
      File.write("db/#{file_name}.json", '')

      loaded_obj_list = persistence.load(file_name)

      expect(loaded_obj_list).to eq([])
    end
  end
end
