// strategy: I want to actually use enums to capture valid simple tokens, and initialize them with raw values, then handle failed case as nil token

enum SimpleToken: Character {
    case hash = "#"
    case dash = "-"
    case openParen = "("
    case closeParen = ")"
    case openBracket = "["
    case closeBracket = "]"
    case asterisk = "*"
    case underscore = "_"
}
