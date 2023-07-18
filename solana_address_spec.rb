require 'rspec'
require_relative 'solana_address.rb'

describe SolanaAddress do
    describe '#valid?' do
      it 'returns true for a valid Solana address' do
        valid_address = 'HPwfZUd7wqrBAyLUgkU8GmGvG44J3HCqXZ1mhXXpe6um'  # Replace with any valid Base58 encoded Solana address
        solana_address = SolanaAddress.new(valid_address)
  
        expect(solana_address.valid?).to be true
      end
  
      it 'returns true for a valid Solana address #2' do
          valid_address = '39u4UiSpYXhkuEsEso4NEVPfeEAvZjp6ZDvvGjMVgVTt' 
          solana_address = SolanaAddress.new(valid_address)
    
          expect(solana_address.valid?).to be true
      end
  
      it 'returns false for a valid Solana address that has been modified slightly to be invalid' do
          valid_address = 'BM2dDCnu8fyxgcQakNa876sr7LzVNbadwV2EiYm3S'  
          solana_address = SolanaAddress.new(valid_address)
    
          expect(solana_address.valid?).to be false
      end
  
      it 'returns false for an invalid Solana address' do
        invalid_address = 'invalid_address'
        solana_address = SolanaAddress.new(invalid_address)
  
        expect(solana_address.valid?).to be false
      end
  
      it 'returns false for an address with incorrect length' do
        too_short_address = '11111'  # Too short to be a valid Base58 encoded Solana address
        too_long_address = '111111111111111111111111111111111111111111111111111111111111111111111'  # Too long to be a valid Base58 encoded Solana address
  
        short_solana_address = SolanaAddress.new(too_short_address)
        long_solana_address = SolanaAddress.new(too_long_address)
  
        expect(short_solana_address.valid?).to be false
        expect(long_solana_address.valid?).to be false
      end
  
      it 'returns false for an address with invalid characters' do
        address_with_invalid_characters = '!@#$%^&*()'
        solana_address = SolanaAddress.new(address_with_invalid_characters)
  
        expect(solana_address.valid?).to be false
      end
  
      it 'returns false for an address with spaces' do
        address_with_spaces = '1111 1111 1111 1111'
        solana_address = SolanaAddress.new(address_with_spaces)
  
        expect(solana_address.valid?).to be false
      end
  
      it 'returns false for an address that is less than 32 bytes when decoded' do
        address_with_uppercase_letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        solana_address = SolanaAddress.new(address_with_uppercase_letters)
  
        expect(solana_address.valid?).to be false
      end
  
      it 'returns false for an address with `l` and o`' do
        address_with_lowercase_letters = 'abcdefghijklmnopqrstuvwxyz'
        solana_address = SolanaAddress.new(address_with_lowercase_letters)
  
        expect(solana_address.valid?).to be false
      end
  
      it 'returns false for an address that is too short' do
        address_with_alphanumeric_characters = '123ABC'
        solana_address = SolanaAddress.new(address_with_alphanumeric_characters)
  
        expect(solana_address.valid?).to be false
      end
  
      it 'returns false for an address with non-printable characters' do
        address_with_non_printable_characters = "\x00\x01\x02\x03"
        solana_address = SolanaAddress.new(address_with_non_printable_characters)
  
        expect(solana_address.valid?).to be false
      end
    end
  end