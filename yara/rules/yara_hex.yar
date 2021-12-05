rule WildcardExample
{
    strings:
       $hex_string = { 74 65 }

    condition:
       $hex_string
}
