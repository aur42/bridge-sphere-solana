# bridge-sphere-solana

# solana_address.rb - Solana Address Validation

* Takes in a `string` as a parameter and wraps it into a custom class.
* There is a `valid?` method that returns a `boolean`, depending on whether the `string` is a valid Solana address.

# solana_transaction.rb - Solana Transaction Parsing

* Takes in a Solana transaction hash and (optional) mint currency, and outputs token transfers in that transaction.
* Will filter token transfers based upon the mint currency provided, otherwise will return all token transfers in the transaction.
* Returns an empty array on Solana transactions that do not contain a token transfer.
* Returns a list of token transfers, including the from address, and specifies whether the transfer involves an ATA or the system program.
* Uses Helius API (highly Solana optimized RPC, best response times and most granular data)

# Unit tests

Run `rspec solana_address_spec.rb` 
Run `rspec solana_transaction_spec.rb`

You can also manually test from CLI with: 
`ruby solana_address <string>`
`ruby solana_transaction <transaction_id> <mint_currency>`


# Working examples

## Solana Address Validation

`ruby solana_address.rb HPwfZUd7wqrBAyLUgkU8GmGvG44J3HCqXZ1mhXXpe6um`
`ruby solana_address.rb 123`
`ruby solana_address.rb So11111111111111111111111111111111111111112`


## Solana Transaction Parsing

`ruby solana_transaction.rb 2aX8eB342aw2dRJ4k7gmesjU2kpDUkHN1xwEW5sg8gn7AJiHNmfC5QDUFhxCNweQDxafYhZV3CHrP9PJytfZtXLJ EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v`
`ruby solana_transaction.rb 2aX8eB342aw2dRJ4k7gmesjU2kpDUkHN1xwEW5sg8gn7AJiHNmfC5QDUFhxCNweQDxafYhZV3CHrP9PJytfZtXLJ So11111111111111111111111111111111111111112`
`ruby solana_transaction.rb 2aX8eB342aw2dRJ4k7gmesjU2kpDUkHN1xwEW5sg8gn7AJiHNmfC5QDUFhxCNweQDxafYhZV3CHrP9PJytfZtXLJ` 

`ruby solana_transaction.rb 3aVFCKwC9YbM47RXixuw6HdxKMXeEsG4NzfDFThsofmuE6SSajYCg659LPcGg164c8wbCmPWWbD6adHbAfAorNuW EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v`
`ruby solana_transaction.rb 3aVFCKwC9YbM47RXixuw6HdxKMXeEsG4NzfDFThsofmuE6SSajYCg659LPcGg164c8wbCmPWWbD6adHbAfAorNuW So11111111111111111111111111111111111111112`
`ruby solana_transaction.rb 3aVFCKwC9YbM47RXixuw6HdxKMXeEsG4NzfDFThsofmuE6SSajYCg659LPcGg164c8wbCmPWWbD6adHbAfAorNuW`
