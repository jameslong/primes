# First N Primes

Code to:

- Generate first N primes
- Output prime multiplication tables to console

Primes can be generated using lazy Sieve of Eratosthenes and brute force implementations.

## How to run

From iex (`iex -S mix`):

```
iex> Primes.SieveOfEratosthenes.first_n_primes(10)
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

iex> Primes.BruteForce.first_n_primes(10)
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

iex> Primes.prime_multiplication_table(3)
|   | 2 | 3 | 5 |
| 2 | 4 | 6 | 10 |
| 3 | 6 | 9 | 15 |
| 5 | 10 | 15 | 25 |
```

## What I'm pleased with

- Lazy implementation minimises memory use
- Tidy multiplication table code
- Beat brute force!

## If I had more time...

Tidy up:

- Remove duplication in tests
- Clean up sieve implementation to make it more readable
- Add some docs to show example usage of sieve/brute force implementation
- Add exact test (as oppose to sanity check) for first 1000 primes

Performance:

- Use a 'wheel' (e.g. exclude multiples of 3, 5, 7 from testing)
- Use a priority queue instead of a map to store multiples in Sieve implemention
- Profile to optimise Sieve implementation
- Add non-lazy prime generator for comparison (this should be faster)
- Add parallel implemention
- Implement in language supporting mutable data structures - Elixir isn't suited to this!
