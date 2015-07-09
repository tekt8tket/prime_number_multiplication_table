require 'jibe'
require 'prime'

RSpec.describe Jibe::Prime do

  it 'runs rspec' do
    expect(true).to eq(true)
  end

  describe '.first' do
    subject { described_class.first(num_primes) }

    context 'passes 5' do
      let(:num_primes) { 5 }

      it 'returns the correct number of primes' do
        expect(subject.length).to eq(num_primes)
      end

      it 'returns only prime numbers' do
        expected_primes = Prime.first(num_primes)

        expect(subject).to eq(expected_primes)
      end
    end
  end

end