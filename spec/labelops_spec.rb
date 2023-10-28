require_relative '../label'
require_relative '../persistence'
require_relative '../label_ops'

RSpec.describe LabelOps do
  let(:label_ops) { LabelOps.new }

  describe '#initialize' do
    it 'initializes labels as an empty array' do
      expect(label_ops.labels).to be_empty
    end

    it 'initializes an instance of Persistence' do
      expect(label_ops.instance_variable_get(:@persist)).to be_an_instance_of(Persistence)
    end
  end

  describe '#create_label' do
    it 'adds a new label to the labels array' do
      allow(label_ops).to receive(:get_user_input).and_return('Test Label', 'Test Color')
      label_ops.create_label
      expect(label_ops.labels).not_to be_empty
    end
  end

  describe '#list_all_labels' do
    context 'when labels are present' do
      before do
        label1 = Label.new('Label 1', 'Red')
        label2 = Label.new('Label 2', 'Blue')
        label_ops.instance_variable_set(:@labels, [label1, label2])

        allow(label_ops).to receive(:puts)
        label_ops.list_all_labels
      end

      it "displays the 'LABELS' header" do
        expect(label_ops).to have_received(:puts).with('________LABELS__________')
      end
    end
  end
end
