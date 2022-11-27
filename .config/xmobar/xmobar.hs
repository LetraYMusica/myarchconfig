import Xmobar

config :: Config
config =
  defaultConfig
       { overrideRedirect = False
       , hideOnStart = True
       , font     = "xft:FreeMonoBold-7"
       , textOffset = 9
       , border = NoBorder
       , bgColor  = "#000000"
       , fgColor  = "#f8f8f2"
       , position = Static { xpos = 0 , ypos = 0, width = 1366, height = 12 }
       , alpha    = 152
       , commands = [ Run $ Weather "MMAS"
                        [ "--template", "<weather> <tempC>°C // Ags "
                        , "-L", "12"
                        , "-H", "27"
                        , "--low"   , "lightblue"
                        , "--normal", "#f8f8f2"
                        , "--high"  , "red"
                        ] 36000
                    , Run $ Cpu
                        [ "-L", "3"
                        , "-H", "51"
                        , "--high"  , "red"
                        , "--normal", "green"
                        ] 10
		    , Run $ DynNetwork
		        [ "-L", "0"
			, "-H", "32"
			, "--high", "green"
			, "-t WiFi: <rx>Up • <tx>Dwn"
			] 10
                    , Run $ Alsa "default" "Master"
                        [ "--template", "Vol. <volumestatus>"
                        , "--suffix"  , "True"
                        , "--"
                        , "--on", ""
                        , "--off", "mute"
                        ]
                    , Run $ Memory ["--template", "Mem: <usedratio>%"] 10
                    , Run $ Swap [] 10
                    , Run $ Date "%a %d/%m %y <fc=#8be9fd>%H:%M</fc>" "date" 10
                    , Run XMonadLog
                    ]
       , sepChar  = "%"
       , alignSep = "}{"
       , template = "%XMonadLog% } %date% { %alsa:default:Master% | %dynnetwork% | %cpu% | %memory% * %swap% | %MMAS% "
       }

main :: IO()
main = xmobar config
