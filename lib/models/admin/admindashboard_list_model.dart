class AdmindashboardListModel {
  bool? success;
  dynamic data;
  dynamic statusCode;

  AdmindashboardListModel({this.success, this.data, this.statusCode});

  AdmindashboardListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  String? username;
  String? pofileUrl;
  String? wishMessage;
  String? welcomeText;
  dynamic topCounselor;
  dynamic topBranch;
  dynamic collectionbyreg;
  dynamic registration;
  dynamic offerletters;
  dynamic ttfees;
  dynamic institutefees;
  dynamic files;
  dynamic visa;
  dynamic gic;
  dynamic walkin;
  dynamic call;
  dynamic support;
  dynamic gicRequest;
  dynamic admissionsPercentage;
  List? earningExpense;
  List? updowncountry;

  Data(
      {this.username,
      this.pofileUrl,
      this.wishMessage,
      this.welcomeText,
      this.topCounselor,
      this.topBranch,
      this.collectionbyreg,
      this.registration,
      this.offerletters,
      this.ttfees,
      this.institutefees,
      this.files,
      this.visa,
      this.gic,
      this.walkin,
      this.call,
      this.support,
      this.gicRequest,
      this.admissionsPercentage,
      this.earningExpense,
      this.updowncountry});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    pofileUrl = json['pofileUrl'];
    wishMessage = json['wishMessage'];
    welcomeText = json['welcomeText'];
    topCounselor = json['top_counselor'] != null
        ? new TopCounselor.fromJson(json['top_counselor'])
        : null;
    topBranch = json['top_branch'] != null
        ? new TopBranch.fromJson(json['top_branch'])
        : null;
    collectionbyreg = json['collectionbyreg'] != null
        ? new Collectionbyreg.fromJson(json['collectionbyreg'])
        : null;
    registration = json['registration'] != null
        ? new Registration.fromJson(json['registration'])
        : null;
    offerletters = json['offerletters'] != null
        ? new Offerletters.fromJson(json['offerletters'])
        : null;
    ttfees =
        json['ttfees'] != null ? new Ttfees.fromJson(json['ttfees']) : null;
    institutefees = json['institutefees'] != null
        ? new Institutefees.fromJson(json['institutefees'])
        : null;
    files = json['files'] != null ? new Files.fromJson(json['files']) : null;
    visa = json['visa'] != null ? new Visa.fromJson(json['visa']) : null;
    gic = json['gic'] != null ? new Gic.fromJson(json['gic']) : null;
    walkin =
        json['walkin'] != null ? new Walkin.fromJson(json['walkin']) : null;
    call = json['call'] != null ? new Call.fromJson(json['call']) : null;
    support =
        json['support'] != null ? new Support.fromJson(json['support']) : null;
    gicRequest = json['gic_request'];
    admissionsPercentage = json['admissions_percentage'] != null
        ? new AdmissionsPercentage.fromJson(json['admissions_percentage'])
        : null;
    if (json['earning_expense'] != null) {
      earningExpense = <EarningExpense>[];
      json['earning_expense'].forEach((v) {
        earningExpense!.add(new EarningExpense.fromJson(v));
      });
    }
    if (json['updowncountry'] != null) {
      updowncountry = <Updowncountry>[];
      json['updowncountry'].forEach((v) {
        updowncountry!.add(new Updowncountry.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['pofileUrl'] = this.pofileUrl;
    data['wishMessage'] = this.wishMessage;
    data['welcomeText'] = this.welcomeText;
    if (this.topCounselor != null) {
      data['top_counselor'] = this.topCounselor!.toJson();
    }
    if (this.topBranch != null) {
      data['top_branch'] = this.topBranch!.toJson();
    }
    if (this.collectionbyreg != null) {
      data['collectionbyreg'] = this.collectionbyreg!.toJson();
    }
    if (this.registration != null) {
      data['registration'] = this.registration!.toJson();
    }
    if (this.offerletters != null) {
      data['offerletters'] = this.offerletters!.toJson();
    }
    if (this.ttfees != null) {
      data['ttfees'] = this.ttfees!.toJson();
    }
    if (this.institutefees != null) {
      data['institutefees'] = this.institutefees!.toJson();
    }
    if (this.files != null) {
      data['files'] = this.files!.toJson();
    }
    if (this.visa != null) {
      data['visa'] = this.visa!.toJson();
    }
    if (this.gic != null) {
      data['gic'] = this.gic!.toJson();
    }
    if (this.walkin != null) {
      data['walkin'] = this.walkin!.toJson();
    }
    if (this.call != null) {
      data['call'] = this.call!.toJson();
    }
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    data['gic_request'] = this.gicRequest;
    if (this.admissionsPercentage != null) {
      data['admissions_percentage'] = this.admissionsPercentage!.toJson();
    }
    if (this.earningExpense != null) {
      data['earning_expense'] =
          this.earningExpense!.map((v) => v.toJson()).toList();
    }
    if (this.updowncountry != null) {
      data['updowncountry'] =
          this.updowncountry!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopCounselor {
  List<dynamic>? topVisaCounselor;
  List<dynamic>? topIeltsCounselor;

  TopCounselor({this.topVisaCounselor, this.topIeltsCounselor});

  TopCounselor.fromJson(Map<String, dynamic> json) {
    if (json['top_visa_counselor'] != null) {
      topVisaCounselor = [];
      json['top_visa_counselor'].forEach((v) {
        topVisaCounselor!.add(new TopVisaCounselor.fromJson(v));
      });
    }
    if (json['top_ielts_counselor'] != null) {
      topIeltsCounselor =[];
      json['top_ielts_counselor'].forEach((v) {
        topIeltsCounselor!.add(new TopIeltsCounselor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topVisaCounselor != null) {
      data['top_visa_counselor'] =
          this.topVisaCounselor!.map((v) => v.toJson()).toList();
    }
    if (this.topIeltsCounselor != null) {
      data['top_ielts_counselor'] =
          this.topIeltsCounselor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopVisaCounselor {
  String? counselor;
  dynamic count;

  TopVisaCounselor({this.counselor, this.count});

  TopVisaCounselor.fromJson(Map<String, dynamic> json) {
    counselor = json['counselor'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counselor'] = this.counselor;
    data['count'] = this.count;
    return data;
  }
}

class TopIeltsCounselor {
  String? counselor;
  dynamic count;

  TopIeltsCounselor({this.counselor, this.count});

  TopIeltsCounselor.fromJson(Map<String, dynamic> json) {
    counselor = json['counselor'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counselor'] = this.counselor;
    data['count'] = this.count;
    return data;
  }
}

class TopBranch {
  List<dynamic>? topVisaBranch;
  List<dynamic>? topIeltsBranch;

  TopBranch({this.topVisaBranch, this.topIeltsBranch});

  TopBranch.fromJson(Map<String, dynamic> json) {
    if (json['top_visa_branch'] != null) {
      topVisaBranch = [];
      json['top_visa_branch'].forEach((v) {
        topVisaBranch!.add(new TopVisaBranch.fromJson(v));
      });
    }
    if (json['top_ielts_branch'] != null) {
      topIeltsBranch = [];
      json['top_ielts_branch'].forEach((v) {
        topIeltsBranch!.add(new TopIeltsBranch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topVisaBranch != null) {
      data['top_visa_branch'] =
          this.topVisaBranch!.map((v) => v.toJson()).toList();
    }
    if (this.topIeltsBranch != null) {
      data['top_ielts_branch'] =
          this.topIeltsBranch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopVisaBranch {
  String? location;
  dynamic count;

  TopVisaBranch({this.location, this.count});

  TopVisaBranch.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['count'] = this.count;
    return data;
  }
}

class TopIeltsBranch {
  String? location;
  dynamic count;

  TopIeltsBranch({this.location, this.count});

  TopIeltsBranch.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['count'] = this.count;
    return data;
  }
}

class Collectionbyreg {
  dynamic collectionbyregToday;
  dynamic collectionbyregMonthly;
  dynamic collectionbyregThreemonth;

  Collectionbyreg(
      {this.collectionbyregToday,
      this.collectionbyregMonthly,
      this.collectionbyregThreemonth});

  Collectionbyreg.fromJson(Map<String, dynamic> json) {
    collectionbyregToday = json['collectionbyreg_today'] != null
        ? new CollectionbyregToday.fromJson(json['collectionbyreg_today'])
        : null;
    collectionbyregMonthly = json['collectionbyreg_monthly'] != null
        ? new CollectionbyregToday.fromJson(json['collectionbyreg_monthly'])
        : null;
    collectionbyregThreemonth = json['collectionbyreg_threemonth'] != null
        ? new CollectionbyregToday.fromJson(json['collectionbyreg_threemonth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collectionbyregToday != null) {
      data['collectionbyreg_today'] = this.collectionbyregToday!.toJson();
    }
    if (this.collectionbyregMonthly != null) {
      data['collectionbyreg_monthly'] = this.collectionbyregMonthly!.toJson();
    }
    if (this.collectionbyregThreemonth != null) {
      data['collectionbyreg_threemonth'] =
          this.collectionbyregThreemonth!.toJson();
    }
    return data;
  }
}

class CollectionbyregToday {
  dynamic registration;
  dynamic package;
  dynamic received;
  dynamic due;

  CollectionbyregToday(
      {this.registration, this.package, this.received, this.due});

  CollectionbyregToday.fromJson(Map<String, dynamic> json) {
    registration = json['registration'];
    package = json['package'];
    received = json['received'];
    due = json['due'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['registration'] = this.registration;
    data['package'] = this.package;
    data['received'] = this.received;
    data['due'] = this.due;
    return data;
  }
}

class Registration {
  dynamic registrationToday;
  dynamic registrationMonthly;
  dynamic registrationThreemonth;

  Registration(
      {this.registrationToday,
      this.registrationMonthly,
      this.registrationThreemonth});

  Registration.fromJson(Map<String, dynamic> json) {
    registrationToday = json['registration_today'] != null
        ? new RegistrationToday.fromJson(json['registration_today'])
        : null;
    registrationMonthly = json['registration_monthly'] != null
        ? new RegistrationToday.fromJson(json['registration_monthly'])
        : null;
    registrationThreemonth = json['registration_threemonth'] != null
        ? new RegistrationToday.fromJson(json['registration_threemonth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.registrationToday != null) {
      data['registration_today'] = this.registrationToday!.toJson();
    }
    if (this.registrationMonthly != null) {
      data['registration_monthly'] = this.registrationMonthly!.toJson();
    }
    if (this.registrationThreemonth != null) {
      data['registration_threemonth'] = this.registrationThreemonth!.toJson();
    }
    return data;
  }
}

class RegistrationToday {
  dynamic ielts;

  RegistrationToday({this.ielts});

  RegistrationToday.fromJson(Map<String, dynamic> json) {
    ielts = json['ielts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ielts'] = this.ielts;
    return data;
  }
}

class Offerletters {
  dynamic offerlettersToday;
  dynamic offerlettersMonthly;
  dynamic offerlettersThreemonth;

  Offerletters(
      {this.offerlettersToday,
      this.offerlettersMonthly,
      this.offerlettersThreemonth});

  Offerletters.fromJson(Map<String, dynamic> json) {
    offerlettersToday = json['offerletters_today'] != null
        ? new OfferlettersToday.fromJson(json['offerletters_today'])
        : null;
    offerlettersMonthly = json['offerletters_monthly'] != null
        ? new OfferlettersToday.fromJson(json['offerletters_monthly'])
        : null;
    offerlettersThreemonth = json['offerletters_threemonth'] != null
        ? new OfferlettersToday.fromJson(json['offerletters_threemonth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offerlettersToday != null) {
      data['offerletters_today'] = this.offerlettersToday!.toJson();
    }
    if (this.offerlettersMonthly != null) {
      data['offerletters_monthly'] = this.offerlettersMonthly!.toJson();
    }
    if (this.offerlettersThreemonth != null) {
      data['offerletters_threemonth'] = this.offerlettersThreemonth!.toJson();
    }
    return data;
  }
}

class OfferlettersToday {
  dynamic applied;
  dynamic notapplied;
  dynamic received;
  dynamic notreceived;

  OfferlettersToday(
      {this.applied, this.notapplied, this.received, this.notreceived});

  OfferlettersToday.fromJson(Map<String, dynamic> json) {
    applied = json['applied'];
    notapplied = json['notapplied'];
    received = json['received'];
    notreceived = json['notreceived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applied'] = this.applied;
    data['notapplied'] = this.notapplied;
    data['received'] = this.received;
    data['notreceived'] = this.notreceived;
    return data;
  }
}

class Ttfees {
  dynamic ttfeesToday;
  dynamic ttfeesMonthly;
  dynamic ttfeesThreemonth;

  Ttfees({this.ttfeesToday, this.ttfeesMonthly, this.ttfeesThreemonth});

  Ttfees.fromJson(Map<String, dynamic> json) {
    ttfeesToday = json['ttfees_today'] != null
        ? new TtfeesToday.fromJson(json['ttfees_today'])
        : null;
    ttfeesMonthly = json['ttfees_monthly'] != null
        ? new TtfeesToday.fromJson(json['ttfees_monthly'])
        : null;
    ttfeesThreemonth = json['ttfees_threemonth'] != null
        ? new TtfeesToday.fromJson(json['ttfees_threemonth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ttfeesToday != null) {
      data['ttfees_today'] = this.ttfeesToday!.toJson();
    }
    if (this.ttfeesMonthly != null) {
      data['ttfees_monthly'] = this.ttfeesMonthly!.toJson();
    }
    if (this.ttfeesThreemonth != null) {
      data['ttfees_threemonth'] = this.ttfeesThreemonth!.toJson();
    }
    return data;
  }
}

class TtfeesToday {
  dynamic paid;
  dynamic notpaid;

  TtfeesToday({this.paid, this.notpaid});

  TtfeesToday.fromJson(Map<String, dynamic> json) {
    paid = json['paid'];
    notpaid = json['notpaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paid'] = this.paid;
    data['notpaid'] = this.notpaid;
    return data;
  }
}

class Institutefees {
  dynamic institutefeesToday;
  dynamic institutefeesMonthly;
  dynamic institutefeesThreemonth;

  Institutefees(
      {this.institutefeesToday,
      this.institutefeesMonthly,
      this.institutefeesThreemonth});

  Institutefees.fromJson(Map<String, dynamic> json) {
    institutefeesToday = json['institutefees_today'] != null
        ? new InstitutefeesToday.fromJson(json['institutefees_today'])
        : null;
    institutefeesMonthly = json['institutefees_monthly'] != null
        ? new InstitutefeesToday.fromJson(json['institutefees_monthly'])
        : null;
    institutefeesThreemonth = json['institutefees_threemonth'] != null
        ? new InstitutefeesToday.fromJson(json['institutefees_threemonth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.institutefeesToday != null) {
      data['institutefees_today'] = this.institutefeesToday!.toJson();
    }
    if (this.institutefeesMonthly != null) {
      data['institutefees_monthly'] = this.institutefeesMonthly!.toJson();
    }
    if (this.institutefeesThreemonth != null) {
      data['institutefees_threemonth'] = this.institutefeesThreemonth!.toJson();
    }
    return data;
  }
}

class InstitutefeesToday {
  dynamic received;
  dynamic notreceived;

  InstitutefeesToday({this.received, this.notreceived});

  InstitutefeesToday.fromJson(Map<String, dynamic> json) {
    received = json['received'];
    notreceived = json['notreceived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['received'] = this.received;
    data['notreceived'] = this.notreceived;
    return data;
  }
}

class Files {
  dynamic filesToday;
  dynamic filesMonthly;
  dynamic filesThreemonth;

  Files({this.filesToday, this.filesMonthly, this.filesThreemonth});

  Files.fromJson(Map<String, dynamic> json) {
    filesToday = json['files_today'] != null
        ? new FilesToday.fromJson(json['files_today'])
        : null;
    filesMonthly = json['files_monthly'] != null
        ? new FilesToday.fromJson(json['files_monthly'])
        : null;
    filesThreemonth = json['files_threemonth'] != null
        ? new FilesToday.fromJson(json['files_threemonth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filesToday != null) {
      data['files_today'] = this.filesToday!.toJson();
    }
    if (this.filesMonthly != null) {
      data['files_monthly'] = this.filesMonthly!.toJson();
    }
    if (this.filesThreemonth != null) {
      data['files_threemonth'] = this.filesThreemonth!.toJson();
    }
    return data;
  }
}

class FilesToday {
  dynamic lodge;
  dynamic notlodge;

  FilesToday({this.lodge, this.notlodge});

  FilesToday.fromJson(Map<String, dynamic> json) {
    lodge = json['lodge'];
    notlodge = json['notlodge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lodge'] = this.lodge;
    data['notlodge'] = this.notlodge;
    return data;
  }
}

class Visa {
  dynamic visaToday;
  dynamic visaMonthly;
  dynamic visaThreemonth;

  Visa({this.visaToday, this.visaMonthly, this.visaThreemonth});

  Visa.fromJson(Map<String, dynamic> json) {
    visaToday = json['visa_today'] != null
        ? new VisaToday.fromJson(json['visa_today'])
        : null;
    visaMonthly = json['visa_monthly'] != null
        ? new VisaToday.fromJson(json['visa_monthly'])
        : null;
    visaThreemonth = json['visa_threemonth'] != null
        ? new VisaToday.fromJson(json['visa_threemonth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.visaToday != null) {
      data['visa_today'] = this.visaToday!.toJson();
    }
    if (this.visaMonthly != null) {
      data['visa_monthly'] = this.visaMonthly!.toJson();
    }
    if (this.visaThreemonth != null) {
      data['visa_threemonth'] = this.visaThreemonth!.toJson();
    }
    return data;
  }
}

class VisaToday {
  dynamic approved;
  dynamic refused;

  VisaToday({this.approved, this.refused});

  VisaToday.fromJson(Map<String, dynamic> json) {
    approved = json['approved'];
    refused = json['refused'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approved'] = this.approved;
    data['refused'] = this.refused;
    return data;
  }
}

class Gic {
  dynamic gicToday;
  dynamic gicMonthly;
  dynamic gicThreemonth;

  Gic({this.gicToday, this.gicMonthly, this.gicThreemonth});

  Gic.fromJson(Map<String, dynamic> json) {
    gicToday = json['gic_today'] != null
        ? new GicToday.fromJson(json['gic_today'])
        : null;
    gicMonthly = json['gic_monthly'] != null
        ? new GicToday.fromJson(json['gic_monthly'])
        : null;
    gicThreemonth = json['gic_threemonth'] != null
        ? new GicToday.fromJson(json['gic_threemonth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gicToday != null) {
      data['gic_today'] = this.gicToday!.toJson();
    }
    if (this.gicMonthly != null) {
      data['gic_monthly'] = this.gicMonthly!.toJson();
    }
    if (this.gicThreemonth != null) {
      data['gic_threemonth'] = this.gicThreemonth!.toJson();
    }
    return data;
  }
}

class GicToday {
  dynamic admissionApplied;
  dynamic accountOpened;
  dynamic accountPending;

  GicToday({this.admissionApplied, this.accountOpened, this.accountPending});

  GicToday.fromJson(Map<String, dynamic> json) {
    admissionApplied = json['admission_applied'];
    accountOpened = json['account_opened'];
    accountPending = json['account_pending'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admission_applied'] = this.admissionApplied;
    data['account_opened'] = this.accountOpened;
    data['account_pending'] = this.accountPending;
    return data;
  }
}

class Walkin {
  dynamic today;
  dynamic month;

  Walkin({this.today, this.month});

  Walkin.fromJson(Map<String, dynamic> json) {
    today = json['today'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['today'] = this.today;
    data['month'] = this.month;
    return data;
  }
}

class Call {
  dynamic answered;
  dynamic noanswere;

  Call({this.answered, this.noanswere});

  Call.fromJson(Map<String, dynamic> json) {
    answered = json['answered'];
    noanswere = json['noanswere'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answered'] = this.answered;
    data['noanswere'] = this.noanswere;
    return data;
  }
}

class Support {
  dynamic open;
  dynamic closed;

  Support({this.open, this.closed});

  Support.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    closed = json['closed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this.open;
    data['closed'] = this.closed;
    return data;
  }
}

class AdmissionsPercentage {
  String? argentina;
  String? australia;
  String? azairbazan;
  String? canada;
  String? france;
  String? germany;
  String? india;
  String? ireland;
  String? london;
  String? maxico;
  String? paris;
  String? pOLAND;
  String? russia;
  String? singapore;
  String? sweden;
  String? uK;
  String? uAE;
  String? uKnew;
  String? uSA;

  AdmissionsPercentage(
      {this.argentina,
      this.australia,
      this.azairbazan,
      this.canada,
      this.france,
      this.germany,
      this.india,
      this.ireland,
      this.london,
      this.maxico,
      this.paris,
      this.pOLAND,
      this.russia,
      this.singapore,
      this.sweden,
      this.uK,
      this.uAE,
      this.uKnew,
      this.uSA});

  AdmissionsPercentage.fromJson(Map<String, dynamic> json) {
    argentina = json['Argentina.'];
    australia = json['Australia'];
    azairbazan = json['Azairbazan'];
    canada = json['Canada'];
    france = json['France'];
    germany = json['Germany'];
    india = json['India'];
    ireland = json['Ireland'];
    london = json['london'];
    maxico = json['maxico'];
    paris = json['paris'];
    pOLAND = json['POLAND'];
    russia = json['Russia'];
    singapore = json['Singapore'];
    sweden = json['Sweden'];
    uK = json['U.K'];
    uAE = json['UAE'];
    uKnew = json['UK'];
    uSA = json['USA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Argentina.'] = this.argentina;
    data['Australia'] = this.australia;
    data['Azairbazan'] = this.azairbazan;
    data['Canada'] = this.canada;
    data['France'] = this.france;
    data['Germany'] = this.germany;
    data['India'] = this.india;
    data['Ireland'] = this.ireland;
    data['london'] = this.london;
    data['maxico'] = this.maxico;
    data['paris'] = this.paris;
    data['POLAND'] = this.pOLAND;
    data['Russia'] = this.russia;
    data['Singapore'] = this.singapore;
    data['Sweden'] = this.sweden;
    data['U.K'] = this.uK;
    data['UAE'] = this.uAE;
    data['UK'] = this.uKnew;
    data['USA'] = this.uSA;
    return data;
  }
}

class EarningExpense {
  String? title;
  List<dynamic>? value;

  EarningExpense({this.title, this.value});

  EarningExpense.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    return data;
  }
}

class Updowncountry {
  String? image;
  String? label;
  String? percentage;
  bool? updown;

  Updowncountry({this.image, this.label, this.percentage, this.updown});

  Updowncountry.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    label = json['label'];
    percentage = json['percentage'];
    updown = json['updown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['label'] = this.label;
    data['percentage'] = this.percentage;
    data['updown'] = this.updown;
    return data;
  }
}

