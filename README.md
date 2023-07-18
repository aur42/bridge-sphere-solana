# bridge-sphere-solana

# solana_address.rb - Solana Address Validation

* Takes in a `string` as a parameter and wraps it into a custom class.
* `valid?` method that returns a `boolean`, depending on whether the `string` is a valid Solana address.

# solana_transaction.rb - Solana Transaction Parsing

* Takes in a Solana tx hash and (optional) mint currency, and returns a list of token transfers in that tx.
* Will filter token transfers based upon the mint currency provided, otherwise will return all token transfers in the tx.
* Returns an empty array on Solana transactions that do not contain a token transfer (e.g., votes, oracle, etc.).
* Returns a list of token transfers, including the from address, and whether the transfer involves ATA/system.
* Uses Helius API (highly Solana optimized RPC, best response times and most granular data).

# Unit tests

## rspec
`rspec solana_address_spec.rb` <br/>
`rspec solana_transaction_spec.rb`<br/>

## CLI
`ruby solana_address <string>` <br/>
`ruby solana_transaction <transaction_id> <mint_currency>`<br/>


# Working examples

## Solana Address Validation

`ruby solana_address.rb HPwfZUd7wqrBAyLUgkU8GmGvG44J3HCqXZ1mhXXpe6um`
<br/> <br/>
`ruby solana_address.rb 123`
<br/> <br/>
`ruby solana_address.rb So11111111111111111111111111111111111111112`


## Solana Transaction Parsing

`ruby solana_transaction.rb 2aX8eB342aw2dRJ4k7gmesjU2kpDUkHN1xwEW5sg8gn7AJiHNmfC5QDUFhxCNweQDxafYhZV3CHrP9PJytfZtXLJ EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v`
<br/> <br/>
`ruby solana_transaction.rb 2aX8eB342aw2dRJ4k7gmesjU2kpDUkHN1xwEW5sg8gn7AJiHNmfC5QDUFhxCNweQDxafYhZV3CHrP9PJytfZtXLJ So11111111111111111111111111111111111111112`
<br/> <br/>
`ruby solana_transaction.rb 2aX8eB342aw2dRJ4k7gmesjU2kpDUkHN1xwEW5sg8gn7AJiHNmfC5QDUFhxCNweQDxafYhZV3CHrP9PJytfZtXLJ` 
<br/> <br/>
`ruby solana_transaction.rb 3aVFCKwC9YbM47RXixuw6HdxKMXeEsG4NzfDFThsofmuE6SSajYCg659LPcGg164c8wbCmPWWbD6adHbAfAorNuW EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v`
<br/> <br/>
`ruby solana_transaction.rb 3aVFCKwC9YbM47RXixuw6HdxKMXeEsG4NzfDFThsofmuE6SSajYCg659LPcGg164c8wbCmPWWbD6adHbAfAorNuW So11111111111111111111111111111111111111112`
<br/> <br/>
`ruby solana_transaction.rb 3aVFCKwC9YbM47RXixuw6HdxKMXeEsG4NzfDFThsofmuE6SSajYCg659LPcGg164c8wbCmPWWbD6adHbAfAorNuW`

