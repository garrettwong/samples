rule regexphello {
  strings:
    $re1 = /hello|welcome/
    $re2 = /\s(world|earth)/

  condition:
    $re1 and $re2
}
