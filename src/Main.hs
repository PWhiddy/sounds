module Main where
import Data.WAVE

num_channels = 1
sample_rate :: Int
sample_rate = 24000
inv_sample_rate :: Double
inv_sample_rate = 1.0 / (fromInteger (toInteger sample_rate) :: Double)
bits_per_sample = 32

header = WAVEHeader num_channels sample_rate bits_per_sample Nothing

samples :: WAVESamples
samples = fmap ((:[]) . doubleToSample . sin . (*freq)) [1..260000]
  where freq = inv_sample_rate*1200

main :: IO ()
main = do
  --print samples
  putWAVEFile "test.wav" (WAVE header samples)
  --putStrLn $ show $ fmap (show . doubleToSample) [0.1,0.2..1.0]
--}
