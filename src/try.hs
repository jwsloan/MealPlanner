import qualified Data.ByteString as B

logFile :: FilePath
logfiled = "a.txt"

-- data Volume = Teaspoon | Tablespoon | FluidOunce | Cup deriving Show






main :: IO ()
main = B.readFile logfile >>= print '' 

