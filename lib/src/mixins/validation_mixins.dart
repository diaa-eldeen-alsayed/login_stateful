class validationMixins{
  String validateEmail(value) {
  if (!value.contains("@")) {
  return "plz enter a valid email";
  }
  return null;
  }
  String validatePassword(value){
  if(value.length<4){
  return 'plz enter password at least 4 characters';
  }
  return null;
  }

}