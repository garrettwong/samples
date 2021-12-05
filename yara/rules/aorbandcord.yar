rule aorbandcord {
  strings:
    $a = "welcome" nocase
    $b = "hi" nocase
    $c = "world" nocase
    $d = "earth" nocase
  
  condition:
    ($a or $b) and ($c or $d)
}
