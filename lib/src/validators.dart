validateEmpty(String ?text){
  if(text == null || text.isEmpty){
    return "Esse campo deve ser preenchido para prosseguir";
  }
}

validateUsername(String? username){
  if(username == null || username.isEmpty) {
    return "Esse campo deve ser preenchido para prosseguir";
  }
  if(username.length < 5){
    return "Esse campo deve ter mais de 5 caracteres (Tem: ${username.length})";
  }
  return null;          
}

validateEmail(String? email){
  if(email == null || email.isEmpty) {
    return "Esse campo deve ser preenchido para prosseguir";
  }
  String regexEmail = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(regexEmail);
  if(!regExp.hasMatch(email)){
    return "O Email inserido é inválido";
  }
  return null;
}

validatePassword(String? passwordCache, String? passwordCacheConfirm){
  if(passwordCache == null || passwordCache.isEmpty) {
    return "Esse campo deve ser preenchido para prosseguir";
  }
  if(passwordCache.length < 6){
    return "Esse campo deve ter mais de 6 caracteres (Tem: ${passwordCache.length})";
  }
  if(passwordCache != passwordCacheConfirm){
    return "As senhas não coincidem";
  }
  return null;
}
