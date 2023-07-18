require 'httparty'
require 'json'

class SolanaTransaction

    HELIUS_API_KEY = "8f23e0f7-7d0e-4518-a84f-5ccd23b58099"
    HELIUS_API_URL = "https://api.helius.xyz/v0/transactions/?api-key=#{HELIUS_API_KEY}"
    
    def initialize(tx_hash, mint_address = nil)
        @tx_hash = tx_hash
        @mint_address = mint_address
    end
    
    def get_token_transfers
        response = HTTParty.post(
        HELIUS_API_URL,
        body: {
            transactions: [@tx_hash]
        }.to_json,
        headers: { 'Content-Type' => 'application/json' })
        if response.code == 200
            filter_for_token_transfers(response.body)
        else
            "Error: #{response.body}"
        end
    end

    private

    def filter_for_token_transfers(response_body)
        json = JSON.parse(response_body)
        json.map do |transaction|
            token_transfers = transaction['tokenTransfers']
            token_transfers.map do |transfer|
                next if @mint_address && transfer['mint'] != @mint_address
                    {
                        from_user_account: transfer['fromUserAccount'],
                        from_token_account: transfer['fromTokenAccount'],
                        to_user_account: transfer['toUserAccount'],
                        to_token_account: transfer['toTokenAccount'],
                        token_amount: transfer['tokenAmount'],
                        mint: transfer['mint'],
                        from_account_is_ATA: !transfer['fromTokenAccount'].nil?
                    }
            end.compact
        end.compact.flatten
    end
end


# If you want to test this file from the command line, uncomment the following lines:
# if __FILE__ == $0
#     transaction = SolanaTransaction.new(ARGV[0], ARGV[1])
#     result = transaction.get_token_transfers
#     puts JSON.pretty_generate(result)
# end

