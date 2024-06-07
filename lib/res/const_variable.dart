import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<String> userTypeList = [
  'Admin',
  'Manager',
  'Agent',
  'Counselor',
  'Admission',
  'Filing',
  'Reception'
];

TextEditingController fullNameController = TextEditingController();
TextEditingController fatherNameController = TextEditingController();
TextEditingController mobileController = TextEditingController();
TextEditingController refmobileController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController dateOfBirthController = TextEditingController();
TextEditingController totalFeesController = TextEditingController();
TextEditingController depositController = TextEditingController();
TextEditingController enterAmountInDollarController = TextEditingController();
TextEditingController accountNumberController = TextEditingController();
TextEditingController ifscCodeController = TextEditingController();
TextEditingController micrCodeController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController companyNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController otherController = TextEditingController();
TextEditingController mailingAddressController = TextEditingController();
TextEditingController postController = TextEditingController();
TextEditingController occuptionController = TextEditingController();
TextEditingController adharCardnoController = TextEditingController();
TextEditingController passportController = TextEditingController();
TextEditingController pteController = TextEditingController();
TextEditingController pteScoreController = TextEditingController();
TextEditingController matricController = TextEditingController();
TextEditingController matricPercentController = TextEditingController();
TextEditingController matricMajorController = TextEditingController();

TextEditingController interController = TextEditingController();
TextEditingController interPercentController = TextEditingController();
TextEditingController interMajorController = TextEditingController();

TextEditingController diplomaController = TextEditingController();
TextEditingController diplomaPercentController = TextEditingController();
TextEditingController diplomaMajorController = TextEditingController();

TextEditingController graduationController = TextEditingController();
TextEditingController graduationPercentController = TextEditingController();
TextEditingController graduationMajorController = TextEditingController();

TextEditingController postGraduationController = TextEditingController();
TextEditingController postGraduationPercentController = TextEditingController();
TextEditingController postGraduationMajorController = TextEditingController();

TextEditingController creditNoController = TextEditingController();
TextEditingController creditNameController = TextEditingController();
TextEditingController creditExpireDateController = TextEditingController();
TextEditingController creditCVVDateController = TextEditingController();

TextEditingController textSearch = TextEditingController();
//all users variables
TextEditingController fNameController = TextEditingController();
TextEditingController lNameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController didController = TextEditingController();
TextEditingController dialerIpController = TextEditingController();
TextEditingController campaignIdController = TextEditingController();
TextEditingController remarkController = TextEditingController();
TextEditingController amountController = TextEditingController();
TextEditingController gicaccountIdController = TextEditingController();
TextEditingController gicaccountCertificateController = TextEditingController();
TextEditingController feeController = TextEditingController();
TextEditingController discountController = TextEditingController();
TextEditingController paidAmoutController = TextEditingController();
TextEditingController pendingController = TextEditingController();
TextEditingController pendencyController = TextEditingController();

FocusNode focusNodeFullName = FocusNode();
FocusNode focusNodeEmail = FocusNode();
FocusNode focusNodePass = FocusNode();
FocusNode focusNodeMobile = FocusNode();
FocusNode focusNodeCity = FocusNode();
FocusNode focusNodeAddress = FocusNode();
FocusNode focusNodeFatherName = FocusNode();
FocusNode focusNodeGender = FocusNode();
FocusNode focusNodeDateOfBirth = FocusNode();
FocusNode focusNodeCountry = FocusNode();
FocusNode focusNodeState = FocusNode();
FocusNode focusNodeVender = FocusNode();
FocusNode focusNodeTotalFees = FocusNode();
FocusNode focusNodeDeposit = FocusNode();
FocusNode focusNodeEnterAmountInDollar = FocusNode();
FocusNode focusNodeBankName = FocusNode();
FocusNode focusNodeAccountNumber = FocusNode();
FocusNode focusNodeIfscCode = FocusNode();
FocusNode focusNodeMicrCode = FocusNode();

bool hasFocusFullName = false;
bool hasFocusFatherName = false;
bool hasFocusEmail = false;
bool hasFocusMobile = false;
bool hasFocusCity = false;
bool hasFocusAddress = false;
bool hasFocusGender = false;
bool hasFocusDateOfBirth = false;
bool hasFocusCountry = false;
bool hasFocusState = false;
bool hasFocusVender = false;
bool hasFocusTotalFees = false;
bool hasFocusDeposit = false;
bool hasFocusEnterAmountInDollar = false;
bool hasFocusBankName = false;
bool hasFocusAccountNumber = false;
bool hasFocusIfscCode = false;
bool hasFocusMicrCode = false;
bool hasFocusPass = false;

String? fullNameError;
String? fatherNameError;
String? mobileError;
String? emailError;
String? dateOfBirthError;
String? cityError;
String? permanentAddressError;
String? totalFeesError;
String? depositError;
String? enterAmountDollarError;
String? accountNumberError;
String? ifscCodeError;
String? micrCodeError;
String? passError;
String? addressError;
String? companyNameError;
RxString fNameErrox = ''.obs;
RxString lNameErrox = ''.obs;
RxString passwordErrox = ''.obs;
RxString phoneErrox = ''.obs;
RxString emailErrox = ''.obs;
RxString dialerIpErrox = ''.obs;
RxString usernameErrox = ''.obs;
RxString didErrox = ''.obs;
RxString campaignIdErrox = ''.obs;
RxString profileImageUrl = ''.obs;
RxString dateofBirth = ''.obs;
RxString passportExpire = ''.obs;
RxString expireCard = ''.obs;

RxString rxlocation = ''.obs;
RxString rxdepartment = ''.obs;
RxString rxmode = ''.obs;
RxString rxvideoCounselor = ''.obs;
RxString rxCountryExpert = ''.obs;
RxString rxExperience = ''.obs;
RxString rxAppointment = ''.obs;
RxString rxFollowupcall = ''.obs;
RxString rxFeedbackAgent = ''.obs;
RxString rxCampaign = ''.obs;
RxString filterDate = ''.obs;

RxString rxagent = ''.obs;
RxString rxSource = ''.obs;
RxString rxStatus = ''.obs;
RxString rxSubStatus = ''.obs;
RxString rxDli = ''.obs;
RxString rxScoreType = ''.obs;
RxString rxServices = ''.obs;
RxString rxWalkin = ''.obs;
RxString rxExamScore = ''.obs;
RxString rxCounsoler = ''.obs;

RxString rxDateTime = ''.obs;
RxString rxFoundType = ''.obs;
RxString rxremark = ''.obs;
RxString rxCity = ''.obs;
RxString rxYear = ''.obs;
RxString rxMonth = ''.obs;
RxString rxInstitute = ''.obs;
RxList rxCourses = [].obs;
RxString rxpaymentType = ''.obs;
RxString rxpaymentMode = ''.obs;
RxString rxsalesType = ''.obs;
RxString rxadmissionType = ''.obs;
List cardExpandFollowups = [];
List cardExpandRefrence = [];
RxBool checkAdmission = false.obs;
RxBool checkFilling = false.obs;
RxBool checkReception = false.obs;
List assignRoleList = [];
List slideList = [];
List selectedList = [];
String selectedValue = '';
RxString leadStatus = ''.obs;
String lastQualification = '';
RxString preferBranch = ''.obs;
RxString preferCountry = ''.obs;
String minimumBand = '';
String pteScore = '';
// ignore: deprecated_member_use
double rWidth =
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
// ignore: deprecated_member_use
double rHeight =
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;
