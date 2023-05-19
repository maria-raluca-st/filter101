class NLTKWordTokenizer {
  List<String> tokenize(String text,
      {bool convertParentheses = false, bool returnStr = false}) {
    List<String> tokens = [];
    String currentToken = '';

    for (int i = 0; i < text.length; i++) {
      String currentChar = text[i];

      if (_isWordCharacter(currentChar)) {
        currentToken += currentChar;
      } else {
        if (currentToken.isNotEmpty) {
          tokens.add(currentToken);
          currentToken = '';
        }

        if (_isParenthesis(currentChar)) {
          if (convertParentheses) {
            currentToken = _convertParenthesis(currentChar);
          } else {
            currentToken = currentChar;
          }
          tokens.add(currentToken);
          currentToken = '';
        }
      }
    }

    if (currentToken.isNotEmpty) {
      tokens.add(currentToken);
    }

    if (returnStr) {
      return [tokens.join(' ')];
    }

    return tokens;
  }

  bool _isWordCharacter(String char) {
    String pattern = r'[A-Za-z0-9]';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(char);
  }

  bool _isParenthesis(String char) {
    return char == '(' || char == ')';
  }

  String _convertParenthesis(String char) {
    return char == '(' ? '-LRB-' : '-RRB-';
  }
}
