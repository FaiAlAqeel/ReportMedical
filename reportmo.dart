import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:reportmotor/result.dart';

class ReportMotor extends StatefulWidget {
  const ReportMotor({super.key});

  @override
  State<ReportMotor> createState() => _ReportMotorState();
}

class _ReportMotorState extends State<ReportMotor> {
  TextEditingController _rename = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _fraud = TextEditingController();
  TextEditingController _fraudincident = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _form = TextEditingController();

  Color get buttonColor =>
      _rename.text.isNotEmpty ? Colors.orange : Colors.grey;
  var selectRegion;
  var selectCity;
  var selectedMedical;
  bool check = false;

  String? selectedCountry;
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formGlobalKey,
        child: ListView(padding: EdgeInsets.zero, children: [
          Container(
            height: 171,
            width: 390,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
              ),
              color: Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 204, 211, 224),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 16),
                  child: CircleAvatar(
                    backgroundColor: Color(0xffF2F3F5),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  '   Motor Fraud',
                  style: TextStyle(
                      color: Color(0xff455560),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  '  Report Medical Fraud ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff1A1C1F),
                      fontFamily: 'Bliss 2'),
                ),
              ],
            ),
          ),
          Container(
            height: 1600,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'An intentional act by the cardholder, insured, and  medical services provider to obtain not owed compensation or benefits to them or others through deceiving, concealing, and misrepresenting information ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff455560),
                          fontFamily: 'Bliss 2'),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Reporter Details',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff455560),
                          fontFamily: 'Bliss 2'),
                    ),
                    const SizedBox(height: 12),

                    TextFormField(
                      validator: (val) {
                        if (val!.isNotEmpty) {
                          return null;
                        } else {
                          return 'Please Enter Reporter Name !';
                        }
                      },
                      controller: _rename,
                      decoration: InputDecoration(
                        hintText: 'Reporter Name',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset('assets/images/person.svg'),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(maxHeight: 16),
                        hintStyle: const TextStyle(
                            color: Color(0xff818B9B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: const Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xffFFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xffFFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                              validator: (value) =>
                                  value == null ? 'Field required' : null,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xffFFFFFF),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Color(0xffFFFFFF)),
                                ),
                              ),
                              hint: const Text("Region"),
                              style: const TextStyle(
                                  color: Color(0xff818B9B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              items: ["Asia", "Africa"]
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text("$e"),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  selectRegion = val!;
                                });
                              },
                              value: selectRegion),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: DropdownButtonFormField(
                            validator: (value) =>
                                value == null ? 'Field required' : null,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xffFFFFFF),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xffFFFFFF)),
                              ),
                            ),
                            hint: const Text("City"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            style: const TextStyle(
                                color: Color(0xff818B9B),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            items: ["Riyadh", "Dubai", "Egypt"]
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text("$e"),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                selectCity = val!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      validator: (val) {
                        if (val!.isNotEmpty) {
                          return null;
                        } else {
                          return 'Please Enter your phone !';
                        }
                      },
                      controller: _phone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'ex: 5xxxxxxxx',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset('assets/images/flag.svg'),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(maxHeight: 16),
                        hintStyle: const TextStyle(
                            color: Color(0xff818B9B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: const Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xffFFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xffFFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    // InternationalPhoneNumberInput(
                    //   spaceBetweenSelectorAndTextField: 0,
                    //   keyboardType: TextInputType.phone,
                    //   selectorConfig: SelectorConfig(
                    //     setSelectorButtonAsPrefixIcon: true,
                    //     trailingSpace: false,
                    //   ),
                    //   onInputChanged: (value) {
                    //     selectedCountry = value.toString();
                    //   },
                    //   inputDecoration: InputDecoration(
                    //     hintText: 'ex: 5xxxxxxxx',
                    //     prefixIconConstraints: const BoxConstraints(maxHeight: 16),
                    //     hintStyle: const TextStyle(
                    //         color: Color(0xff818B9B),
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.w400),
                    //     filled: true,
                    //     fillColor: const Color(0xffFFFFFF),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: const BorderSide(
                    //         width: 3,
                    //         color: Color(0xffFFFFFF),
                    //       ),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: const BorderSide(
                    //         width: 3,
                    //         color: Color(0xffFFFFFF),
                    //       ),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 12),

                    TextFormField(
                      onChanged: (val) {
                        formGlobalKey.currentState?.validate();
                      },
                      validator: (value) {
                        print(value);
                        if (value!.isEmpty) {
                          return "Please Enter Your Email !";
                        } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Please Enter a Valid Email !";
                        }
                        return null;
                      },
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: 'ex: email@tawuniya.com.sa',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset('assets/images/massage.svg'),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(maxHeight: 16),
                        hintStyle: const TextStyle(
                            color: Color(0xff818B9B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: const Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xffFFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xffFFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Divider(
                      color: Color.fromARGB(255, 216, 211, 211),
                      height: 25,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Incident Details',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff455560),
                          fontFamily: 'Bliss 2'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      validator: (val) {
                        if (val!.isNotEmpty) {
                          return null;
                        } else {
                          return 'Please Enter date !';
                        }
                      },
                      controller: _date,
                      readOnly: true,
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                            context: context,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Colors
                                        .yellow, // header background color
                                    onPrimary:
                                        Colors.black, // header text color
                                    onSurface: Colors.green, // body text color
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary: Colors.red, // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (selectedDate != null) {
                          setState(() {
                            _date.text =
                                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                          });
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Fraud Incident Date',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset('assets/images/da.svg'),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(maxHeight: 16),
                        hintStyle: const TextStyle(
                            color: Color(0xff818B9B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: const Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xffFFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xffFFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField(
                      validator: (value) =>
                          value == null ? 'Field required' : null,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset('assets/images/medical.svg'),
                        ),
                        filled: true,
                        fillColor: Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Color(0xffFFFFFF)),
                        ),
                      ),
                      hint: const Text("Medical Provider Name"),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      style: const TextStyle(
                          color: Color(0xff818B9B),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      items: ["Tawuniya", "Bupa", "Malath"]
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text("$e"),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedMedical = val!;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (val) {
                        if (val!.isNotEmpty) {
                          return null;
                        } else {
                          return 'Please Enter Fraud Incident Responsible Name !';
                        }
                      },
                      controller: _fraud,
                      decoration: InputDecoration(
                        hintText: 'Fraud Incident Responsible Name',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset('assets/images/person.svg'),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(maxHeight: 16),
                        hintStyle: const TextStyle(
                            color: Color(0xff818B9B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: const Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xffFFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xffFFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Fraud Incident Details',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff455560),
                          fontFamily: 'Bliss 2'),
                    ),
                    const SizedBox(height: 60),
                    TextFormField(
                      controller: _fraudincident,
                      decoration: InputDecoration(
                        hintText: 'Type here..',
                        hintStyle: const TextStyle(
                            color: Color(0xff818B9B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 100,
                            color: Color(0xffFFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/ta.svg'),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Be detailed as possible when submitting a request in order for us to help you more effectively. The more detailed the information you provide, the faster we will be able to resolve your issue.Below are some tips:',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff455560),
                                    fontFamily: 'Bliss 2'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "• Explain step-by-step how to reproduce the scenario or the problem that you are describing.",
                                  style: TextStyle(
                                      color: Color(0xff455560),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Bliss 2')),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "• If you think a document would help, please include one.",
                                  style: TextStyle(
                                      color: Color(0xff455560),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Bliss 2')),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "• State when the problem started and what changes were made immediately before hand.",
                                  style: TextStyle(
                                      color: Color(0xff455560),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Bliss 2')),
                              SizedBox(height: 18),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 216, 211, 211),
                      height: 25,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Supporting Documents',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff455560),
                          fontFamily: 'Bliss 2'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/arrow.svg'),
                          Text(
                            ' Upload',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Bliss 2'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 54),
                          backgroundColor: Color(0xff8BB2C9)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/ta.svg'),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Allowed files: JPEG, PNG, DOC, DOCX, PDF Maximum Size: 10MB',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff455560),
                                    fontFamily: 'Bliss 2'),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 216, 211, 211),
                      height: 25,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Color(0xffD9DCE1),
                          value: check,
                          onChanged: (val) {
                            setState(() {
                              check = val!;
                            });
                          },
                        ),
                        Expanded(
                          child: const Text(
                            ' I hereby declare that all the above information is true and accurate.',
                            style: TextStyle(
                                color: Color(0xff455560),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Bliss 2'),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 216, 211, 211),
                      height: 25,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    ElevatedButton(
                      child: Text(
                        'Submit Report',
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Bliss 2'),
                      ),
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Result(
                                    rename: _rename.text,
                                    region: selectRegion.toString(),
                                    city: selectCity.toString(),
                                    // phone: selectedCountry.toString(),
                                    email: _email.text,
                                    phone: _phone.text,
                                    fraudin: _fraud.text,
                                    fraudincident: _fraudincident.text,
                                    providerName: selectedMedical.toString(),
                                    date: _date.text,
                                  )));
                        } else {
                          return;
                        }
                      },
                      // onPressed: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) =>
                      //               const Result()));
                      // },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 54),
                          // backgroundColor: Color(0xffF47B20)),
                          backgroundColor: (buttonColor)),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      ' Tawuniya undertakes to maintain the confidentiality of the information of the person who is reporting the fraud in the medical insurance.',
                      style: TextStyle(
                          color: Color(0xff455560),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Bliss 2'),
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
