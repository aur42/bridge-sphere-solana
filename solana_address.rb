require 'base58'
require 'rbnacl'

class SolanaAddress

  BASE58_REGEX = /^[1-9A-HJ-NP-Za-km-z]{32,44}$/  # Regex for Base58 encoded Solana address

  def initialize(address)
    @address = address
  end

  def valid?

    # Check if address matches the base58 regex
    return false unless BASE58_REGEX.match?(@address)

    # Check if base58 encoding and length is valid
    decoded_address = Base58.base58_to_binary(@address, :bitcoin)
    return false unless decoded_address.length == 32

    # Check if key is a valid ed25519 key
    begin
      RbNaCl::PublicKey.new(decoded_address)
      true
    rescue RbNaCl::LengthError
      false
    end
  end
end

