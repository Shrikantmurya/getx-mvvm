
import 'package:get/get.dart';

class Validate{
  
  static String? validatePassword( String value, bool required)
{
  const minLength = 8;
  final specialCharPattern = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');

  if (value.isEmpty) {
    return required ? 'errorPassword'.tr : '';
  }
  // if (value.length < minLength) {
  //   return 'Password must be at least 8 characters.';
  // }
  // You can add more complex validation criteria here if needed.
 return '';
}

static String? validateCity(String value) {
// Regular expression to match a city name with letters, spaces, and hyphens
  final RegExp cityRegExp = RegExp(r"^[A-Za-z -]+$");
  if(value.isEmpty)
  {
    return 'Please enter  City.';
  }
  if (!cityRegExp.hasMatch(value)) {
    return 'Please enter a valid City.';
  }
  return null;
}
static String? validateAddress(String value) {
// Regular expression to match a city name with letters, spaces, and hyphens
  final RegExp cityRegExp = RegExp(r"^[A-Za-z -]+$");
  if(value.isEmpty)
  {
    return 'Please enter Address.';
  }

  return null;
}
static String? validateUsername(String value,  bool required) {
  if(value.isEmpty)
  {
    return required ? 'errorUsername'.tr : '';
  }

  return '';
}
static String? validateDid(String value, bool required) {
  if(value.isEmpty)
  {
    return required ? 'errorDid'.tr : '';
  }

  return '';
}

static String? validateDialerIp(String value, required) {
  if(value.isEmpty)
  {
    return required ? 'errorDialerIp'.tr : '';
  }

  return '';
}


static String? validateCampaignId(String value, required) {
  if(value.isEmpty)
  {
    return required ? 'errorCampaignId'.tr : '';
  }

  return '';
}

static String? validateFirstName(String value, bool required) {

  final RegExp firstNameRegExp = RegExp(r"^[A-Za-z ]+$");
  if(value.isEmpty)
  {
    return required ? 'errorFname'.tr : '';
  }
  if (!firstNameRegExp.hasMatch(value))
  {
    return 'invalidChar'.tr;
  }
return '';
}
static String? validateLastName(String value, bool required) {
  final RegExp lastNameRegExp = RegExp(r"^[A-Za-z ]+$");
  // Regular expression to match a city name with letters, spaces, and hyphens
  if(value.isEmpty)
  {
    return required ? 'errorLname'.tr : '';
  }
  if (!lastNameRegExp.hasMatch(value))
  {
    return 'invalidChar'.tr;
  }
  return '';
}



static String? validateEmail(String value,bool required) {
  final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if(value.isEmpty)
    {
      return required ? 'errorEmail'.tr : '';
    }
  if (!emailPattern.hasMatch(value)) {
    return 'validEmail'.tr;
  }
  return '';
}
static String? validateMobile(String value, bool required) {
value = value.replaceAll(RegExp(r'[^0-9]'), '');
if(value.isEmpty)
  {
    return required ? 'errorPhone'.tr : '';
  }
  if (value.length != 10)
  {
    return 'validMobile'.tr;
  }
// if (value.length != 10 || !value.startsWith('0'))
// {
//   return   'Please enter  valid 10-digit numeric  Mobile Number.';
// }
 return '';
}


static String? validateFullName(String value) {
  final RegExp fullNameRegExp = RegExp(r"^[A-Za-z ]+$");
  // Regular expression to match a city name with letters, spaces, and hyphens
  if(value.isEmpty)
  {
    return 'Please enter Full Name.';
  }
  if (!fullNameRegExp.hasMatch(value))
  {
    return 'Full Name contains invalid characters.';
  }
  return null;
}
static String? validateFatherName(String value) {
  final RegExp fullNameRegExp = RegExp(r"^[A-Za-z ]+$");
  // Regular expression to match a city name with letters, spaces, and hyphens
  if(value.isEmpty)
  {
    return 'Please enter Father Name.';
  }
  if (!fullNameRegExp.hasMatch(value))
  {
    return 'Father Name contains invalid characters.';
  }
  return null;
}

static String? validateDateOfBirth(String value) {
  // Define a regular expression for common date formats (MM/DD/YYYY or YYYY-MM-DD)
  RegExp dateRegExp = RegExp(r'^\d{4}-\d{2}-\d{2}$|^\d{2}/\d{2}/\d{4}$');

  if(value.isEmpty)
  {
    return 'Please enter Date Of Birth.';
  }
  if (!dateRegExp.hasMatch(value)) {
    return "Date of birth format is invalid";
  }
  return null;
}
static String? validatePermanentAddress(String value) {
  if(value.isEmpty)
  {
    return 'Please enter Permanent Address.';
  }

  return null;
}
static String? validateTotalFees(String value) {
  if(value.isEmpty)
  {
    return 'Please enter Total Fee.';
  }

  return null;
}
static String? validateDeposit(String value) {
  if(value.isEmpty)
  {
    return 'Please enter Deposite.';
  }

  return null;
}
static String? validateEnterAmountInDollar(String value) {
  if(value.isEmpty)
  {
    return 'Please enter Inter Amount In Dolar.';
  }

  return null;
}
static String? validateCompany(String value) {
  if(value.isEmpty)
  {
    return 'Please enter Validate Company';
  }

  return null;
}
static String? validateAccountNumber(String value) {
  if(value.isEmpty)
  {
    return 'Please enter Validate Account Number.';
  }
  if (value.isEmpty || value.length < 10 || value.length > 20) {
    return 'Please enter valid Account Number.';
    // Not a valid account number based on this example rule
  }

  return null;
}

static String? validateAccountIfscCode(String value) {
// Regular expression to match a city name with letters, spaces, and hyphens
  final RegExp ifscRegExp = RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$');
  if(value.isEmpty)
  {
    return 'Please enter IFSC Code.';
  }
  if (value.length != 11 || !ifscRegExp.hasMatch(value)) {
    return 'Please enter valid  IFSC Code.'; // Not a valid IFSC code based on the defined rules
  }
  return null;
}

static String? validateAccountMicrCode(String value) {
// Regular expression to match a city name with letters, spaces, and hyphens
  final RegExp micrRegExp = RegExp(r'^[0-9]{9}$|^([0-9]{6}[\D][0-9]{2})$');
  if(value.isEmpty)
  {
    return 'Please enter MICR Code.';
  }
  if ((!micrRegExp.hasMatch(value))) {
    return 'Please enter valid MICR Code.'; // Not a valid MICR code based on the defined rules
  }
  return null;
}
static String? validateSpinner(String value) {
// Regular expression to match a city name with letters, spaces, and hyphens
  if(value.isEmpty)
  {
    return 'Please Select at least one options Gender.';
  }

  return null;
}



}