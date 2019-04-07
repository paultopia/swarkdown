
// strategy: initialize a Token for each valid special character, expressing its properties.  Then keep valid tokens in a set or some other O(1) lookup device, when a character is seen, if it's a valid token (remember newlines count as special characters here), handle it by building into the tree, if it isn't, it's an ordinary character 

class Token: Hashable, Equatable {
    static func == (lhs: Token, rhs: Token) -> Bool {
        return lhs.character == rhs.character
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(character)
    }
    
    let character: String
    let continuation: Token?  // for tokens like ** that should be combined into one.
    let takesMultipleContinuations: Bool // for "##" etc.
    let termination: Token? // for open tokens
    let requiredPredecessor: Token? // for close tokens, as well as compound tokens like ( in link
    
    init(_ simpleToken: String){
        character = simpleToken
        continuation = nil
        termination = nil
        requiredPredecessor = nil
        takesMultipleContinuations = false
    }
    
    init(char: String, contin: Token, multiple: Bool, term: Token, predecessor: Token){
        character = char
        continuation = contin
        takesMultipleContinuations = multiple
        termination = term
        requiredPredecessor = predecessor
    }
}

class Tokenizer {
    var validTokens: [Token]
    init(){
        validTokens = [Token]()
        
    }
}

// probably most complex case I can think of right now is links.  for links, '[' is opening token, "]" is close token, and ( is continuation.  I think I'm going to use the required-predecessor 
