rule yara_for_fun {
  meta: 
    author = "Garrett"
    last_updated = "2021-12-05"
    category = "low"
    confidence = "high"
    killchain_phase = "post"
    description = "Find a script that hacks your environment"
  
  strings:
    $s = "testing"

  condition:
    $s
}
