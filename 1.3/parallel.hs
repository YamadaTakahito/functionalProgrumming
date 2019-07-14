import Prelude
import Data.Int
import Control.Parallel.Strategies


isPrime :: Int32 -> Bool
isPrime x = all(\n -> x `mod` n/= 0) [2 .. toEnum (floor $sqrt$fromIntegral x)]

arr :: [Int32]
arr = [2 .. 1000000]

main :: IO()
main = do
    let arr' = map isPrime arr `using`
    parListChunk 256 rpar
    putStr "primes:" >> print(length $ filter id arr')