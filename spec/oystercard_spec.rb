require "oystercard"

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it "has a balance of zero" do
    expect(subject.balance).to eq (0)
  end

    describe '#top_up' do

      it { is_expected.to respond_to(:top_up).with(1).argument }

      # it 'can top up the balance' do
      #   expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      # end

      it "can top up the balance" do
        oystercard.top_up(1)
        expect(oystercard.balance).to eq (1)
      end

    end

  it "has a maximum balance of ninety" do
    expect(oystercard.max_balance).to eq (90)
  end




end
