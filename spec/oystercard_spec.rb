require "oystercard"

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it "has a balance of zero" do
    expect(subject.balance).to eq (0)
  end

    describe "#top_up" do

      it { is_expected.to respond_to(:top_up).with(1).argument }

      # it 'can top up the balance' do
      #   expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      # end

      it "can top up the balance" do
        oystercard.top_up(1)
        expect(oystercard.balance).to eq (1)
      end

    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end


    describe "#deduct" do

      it "can have a fare deducted from the balance" do
        oystercard.top_up(10)
        oystercard.deduct(5)
        expect(oystercard.balance).to eq (5)
      end

      it "raises an error if the balance drops below the minimum balance" do
        minimum_balance = Oystercard::MINIMUM_BALANCE
        oystercard.top_up(10)
        oystercard.deduct(7)
        expect { oystercard.deduct 1}.to raise_error "Insufficient funds. Please top up"
      end

    end



    it 'is initially not in a journey' do
      expect(oystercard).not_to be_in_journey
    end

    it "can touch in" do
      oystercard.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "can touch out" do
      oystercard.top_up(10)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end


    it 'will not touch in if below minimum balance' do
      expect{ subject.touch_in }.to raise_error "Insufficient balance to touch in"
    end

    it "will deduct the minimum charge upon touch in" do
      oystercard.top_up(10)
      subject.touch_in
      expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
    end







end
