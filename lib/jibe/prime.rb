class Jibe::Prime

  class << self

    def first(n)
      # Must return the first n prime numbers
      primes = []
      i = 2

      while(primes.length < n) do
        primes << i if is_prime?(i)
        i += 1
      end

      primes
    end

    def is_prime?(i)
      strategy2(i)
    end

  protected


    def strategy1(i)
      # check that no number under i is a factor
      possible_factors = (2...i)
      possible_factors.none? do |pf|
        i % pf == 0
      end
    end

    def strategy2(i)
      # check that no number under the square root of i is a factor
      possible_factors = (2..Math.sqrt(i))
      possible_factors.none? do |pf|
        i % pf == 0
      end
    end

  end

end