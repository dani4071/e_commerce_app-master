

class danValidator {



  static String? validateUsername(String? username) {
    if(username == null || username.isEmpty) {
      return "Username is required";
    }

    //  define a regular expression pattern for username
    const pattern = r"^[a-zA-Z0-9_-]{3,20}$";

    // create a regExp instance from the pattern
    final regex = RegExp(pattern);

    // use the hasMatch method to check if the username matches the pattern.
    bool isValid = regex.hasMatch(username);

    // check if the username doesnt start or end with an underscore or hyphan.
    if(isValid){
      isValid = !username.startsWith('_') && !username.startsWith('-') && !username.endsWith('_') && !username.endsWith('-');
    }

    if(isValid) {
      return "Username is not valid.";
    }

    return null;
  }


  static String? validateEmptyText(String? fieldname, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldname is required mf';
    }
    return null;
  }


  static String?   validateEmail(String? value){
    if (value == null || value.isEmpty){
      return 'Email is required';
    }


    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)){
      return 'Invalid email address';
    }

    return null;
  }


  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return 'Password is required.';
    }


    if (value.length < 6){
      return 'Password must be at least 6 characters long';
    }


    if(!value.contains(RegExp(r'[A-Z]'))){
      return 'Password must at least contain one upper case';
    }


    if(!value.contains(RegExp(r'[0-9]'))){
      return 'Password must at least contain one number';
    }


    if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return 'Password must contain at least one special character x';
    }

    return null;
  }


  static String? validatePhoneNumber(String? value) {

    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }


    final phoneRegExp = RegExp(r'^\d{10}$');

    if(!phoneRegExp.hasMatch(value)){
      return 'invalid phone number format (10 digits required)';
    }

    return null;
    // REGEXP, BROWSE IT!!!!!!!!!



  }
}