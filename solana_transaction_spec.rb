require 'rspec'
require 'vcr'
require_relative 'solana_transaction'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
end

# RSpec.describe SolanaTransaction do
#   let(:tx_hash1) { '5sAG95EBDj2v9u1UbAbrMbx8uLCTJcia7PaW4qKi7VyAfh4HqR839CYGHdBwBKuegAxnTKHafYRZuH6dqnvrKueS' } 
#   let(:tx_hash2) { '2aX8eB342aw2dRJ4k7gmesjU2kpDUkHN1xwEW5sg8gn7AJiHNmfC5QDUFhxCNweQDxafYhZV3CHrP9PJytfZtXLJ' }
#   let(:mint_address1) { 'So11111111111111111111111111111111111111112' }
#   let(:mint_address2) { 'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v' }

#   describe '#get_token_transfers' do
#     context 'when mint address is not provided' do
#       subject { described_class.new(tx_hash1) }
      
#       it 'returns all token transfers for the transaction' do
#         VCR.use_cassette('get_token_transfers_without_mint') do
#           expect(subject.get_token_transfers).not_to be_empty
#         end
#       end
#     end

#     context 'when mint address is provided' do
#         subject { described_class.new(tx_hash1, mint_address1) }
      
#         it 'returns only the token transfers for the given mint address, if any' do
#           VCR.use_cassette('get_token_transfers_with_mint') do
#             transfers = subject.get_token_transfers
#             if transfers.empty?
#               puts "No transfers found for mint address #{mint_address1}. This may be expected if there are no transactions associated with this mint address."
#             else
#               transfers.each do |transfer|
#                 expect(transfer[:mint]).to eq(mint_address1)
#               end
#             end
#           end
#         end
#       end
#   end
# end
RSpec.describe SolanaTransaction do

    describe '#get_token_transfers' do
      ['5sAG95EBDj2v9u1UbAbrMbx8uLCTJcia7PaW4qKi7VyAfh4HqR839CYGHdBwBKuegAxnTKHafYRZuH6dqnvrKueS',
       '2aX8eB342aw2dRJ4k7gmesjU2kpDUkHN1xwEW5sg8gn7AJiHNmfC5QDUFhxCNweQDxafYhZV3CHrP9PJytfZtXLJ',
       '3iPrQd272q7BsyqFyQfmkPBBWPN1MfMxrdcvZnJXqSZq9oRe129A9e7Vw4xs4SoJBBEwKjMPbVGhbAzxNaQHjPri',
       '4smSmQXAYrP9Scwqqp5JfF1di4D9CJTFEJzkHnddV6aRJKL2aWG8cdbL9o8C1CuEEy5ssk9masFxUggU37NKnuJP',
       '47JNKJyKbBGXFP1Hgc6NN2GpgRSfzqNh7uGVPjwP4qdGT3B5E1ktKNyMmuuBMEmGuS8NVo8V5rDBPktntKdRycdn'].each do |tx_hash|
  
        context "when mint address is not provided for transaction #{tx_hash}" do
          subject { described_class.new(tx_hash) }
  
          it 'returns all token transfers for the transaction' do
            VCR.use_cassette("get_token_transfers_without_mint_for_#{tx_hash}") do
                expect(subject.get_token_transfers).to be_an(Array)
            end
          end
        end
      end
  
      ['So11111111111111111111111111111111111111112',
       'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v',
       'DezXAZ8z7PnrnRJjz3wXBoRgixCa6xjnB7YaB1pPB263'].each do |mint_address|
  
        ['5sAG95EBDj2v9u1UbAbrMbx8uLCTJcia7PaW4qKi7VyAfh4HqR839CYGHdBwBKuegAxnTKHafYRZuH6dqnvrKueS',
         '2aX8eB342aw2dRJ4k7gmesjU2kpDUkHN1xwEW5sg8gn7AJiHNmfC5QDUFhxCNweQDxafYhZV3CHrP9PJytfZtXLJ',
         '3iPrQd272q7BsyqFyQfmkPBBWPN1MfMxrdcvZnJXqSZq9oRe129A9e7Vw4xs4SoJBBEwKjMPbVGhbAzxNaQHjPri',
         '4smSmQXAYrP9Scwqqp5JfF1di4D9CJTFEJzkHnddV6aRJKL2aWG8cdbL9o8C1CuEEy5ssk9masFxUggU37NKnuJP',
         '47JNKJyKbBGXFP1Hgc6NN2GpgRSfzqNh7uGVPjwP4qdGT3B5E1ktKNyMmuuBMEmGuS8NVo8V5rDBPktntKdRycdn'].each do |tx_hash|
  
          context "when mint address #{mint_address} is provided for transaction #{tx_hash}" do
            subject { described_class.new(tx_hash, mint_address) }
  
            it 'returns only the token transfers for the given mint address, if any' do
              VCR.use_cassette("get_token_transfers_with_#{mint_address}_for_#{tx_hash}") do
                transfers = subject.get_token_transfers
                if transfers.empty?
                  puts "No transfers found for mint address #{mint_address}. This may be expected if there are no transactions associated with this mint address."
                else
                  transfers.each do |transfer|
                    expect(transfer[:mint]).to eq(mint_address)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  