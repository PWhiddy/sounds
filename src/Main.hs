module Main where
import Data.WAVE

num_channels = 1
sample_rate :: Int
sample_rate = 24000

inv_sample_rate :: Double
inv_sample_rate = 1.0 / (fromInteger (toInteger sample_rate) :: Double)
bits_per_sample = 32
sound_duration = 8
sample_count = sound_duration * sample_rate
base_freq = 650
tau = 2*pi

header = WAVEHeader num_channels sample_rate bits_per_sample Nothing

sample_times :: [Double]
sample_times = take sample_count [0, inv_sample_rate..]

samples :: WAVESamples
samples = fmap ((:[]) . doubleToSample . wave) sample_times

wave :: Double -> Double
wave t = sin ( tb + 400 * sin ( 0.003 * tb  ) )
  where tb = t * base_freq * tau

main :: IO ()
main = do
  putWAVEFile "test.wav" (WAVE header samples)
  --putStrLn $ show $ fmap (show . doubleToSample) [0.1,0.2..1.0]
