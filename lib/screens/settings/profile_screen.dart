import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  final String _fullName = "Nick Frost";

  final String _bio =
      "\"Find the latest fashion trends, discover unique home decor pieces, and explore effective beauty products while enjoying a seamless and secure e-commerce shopping experience.\"";

  final String _followers = "173";

  final String _posts = "24";

  final String _scores = "450";
  final _formKey = GlobalKey<FormBuilderState>();
  final _formData = FormData();

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    return PortalMasterLayout(
      body: EntranceFader(
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 120,
                      color: AppColors.errorcolor.withOpacity(0.6),
                    ),
                    Align(
                      heightFactor: 0.01,
                      child: Container(
                        height: 100,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        margin: const EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                            color: themeData.cardColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          Assets.images.png.profile.path),
                                      fit: BoxFit.cover)),
                            ),
                            buildSizedboxW(kDefaultPadding),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Admin',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500)),
                                Text('Flutter devlopment',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                screenSize.width >= kScreenWidthLg
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding + kTextPadding),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                flex: 2, child: editProile(lang, themeData)),
                            buildSizedboxW(kDefaultPadding),
                            Container(
                              // pa: const EdgeInsets.only(right: kDefaultPadding),
                              width: screenSize.width / 4,
                              decoration: BoxDecoration(
                                  color: themeData.cardColor,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Stack(
                                children: <Widget>[
                                  _buildCoverImage(screenSize),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding,
                                        vertical: kDefaultPadding),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(
                                            height: screenSize.height / 3.9),
                                        _buildProfileImage(),
                                        _buildStatContainer(),
                                        _buildBio(context),
                                        _buildSeparator(screenSize),
                                        const SizedBox(height: 10.0),
                                        _buildGetInTouch(context),
                                        const SizedBox(height: 8.0),
                                        _buildButtons(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding + kTextPadding),
                        child: Column(
                          children: [
                            editProile(lang, themeData),
                            buildSizedBoxH(kDefaultPadding),
                            Center(
                              child: Container(
                                // margin: const EdgeInsets.only(right: kDefaultPadding),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: themeData.cardColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Stack(
                                  children: <Widget>[
                                    _buildCoverImage(screenSize),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding,
                                          vertical: kDefaultPadding),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                              height: screenSize.height / 3.9),
                                          _buildProfileImage(),
                                          _buildStatContainer(),
                                          _buildBio(context),
                                          _buildSeparator(screenSize),
                                          const SizedBox(height: 10.0),
                                          _buildGetInTouch(context),
                                          const SizedBox(height: 8.0),
                                          _buildButtons(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            buildSizedBoxH(kDefaultPadding),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 2.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        image: DecorationImage(
          image: NetworkImage(
              'https://pbs.twimg.com/profile_banners/3015219910/1559145714/1500x500'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/png/profile.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle statLabelTextStyle = const TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle statCountTextStyle = const TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: statCountTextStyle,
        ),
        Text(
          label,
          style: statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer() {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem("Followers", _followers),
          _buildStatItem("Posts", _posts),
          _buildStatItem("Scores", _scores),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = const TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400, //try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black26,
      margin: const EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        "Get in Touch with ${_fullName.split(" ")[0]},",
        style: const TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => print("followed"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: const Color(0xFF404A5C),
                ),
                child: const Center(
                  child: Text(
                    "FOLLOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () => print("Message"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("MESSAGE",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget editProile(lang, ThemeData themeData) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: themeData.cardColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text('Edit Profile',
              style: GoogleFonts.montserrat(
                  fontSize: kDefaultPadding + kTextPadding,
                  fontWeight: FontWeight.bold)),
          buildSizedBoxH(kDefaultPadding),
          Text(
            'USER INFORMATION',
            style: themeData.textTheme.labelLarge,
          ),
          buildSizedBoxH(kDefaultPadding * 2),
          FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'username',
                        decoration: InputDecoration(
                          labelText: lang.username,
                          hintText: 'test.user',
                          // helperText: '* To test registration fail: admin',
                          border: const OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        enableSuggestions: false,
                        validator: FormBuilderValidators.required(),
                        onSaved: (value) => (_formData.username = value ?? ''),
                      ),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'email',
                        decoration: InputDecoration(
                          labelText: lang.email,
                          hintText: 'test@gmail.com',
                          border: const OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: FormBuilderValidators.required(),
                        onSaved: (value) => (_formData.email = value ?? ''),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'First name',
                        decoration: const InputDecoration(
                          labelText: 'First name',
                          hintText: 'test',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        enableSuggestions: false,
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                        onSaved: (value) => (_formData.firstname = value ?? ''),
                      ),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Last name',
                        decoration: const InputDecoration(
                          labelText: 'Last name',
                          hintText: 'user',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                        onSaved: (value) => (_formData.lastname = value ?? ''),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                const Divider(
                  indent: kDefaultPadding * 2,
                  endIndent: kDefaultPadding * 2,
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                Text(
                  'CONTACT INFORMATION',
                  style: themeData.textTheme.labelLarge,
                ),
                buildSizedBoxH(kDefaultPadding * 2),
                FormBuilderTextField(
                  name: 'Address',
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    hintText: 'A-xyz test near test',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  validator: FormBuilderValidators.required(),
                  onSaved: (value) => (_formData.address = value ?? ''),
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                          name: 'City',
                          decoration: const InputDecoration(
                            labelText: 'City',
                            hintText: 'Surat',
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          enableSuggestions: false,
                          keyboardType: TextInputType.text,
                          validator: FormBuilderValidators.required(),
                          onSaved: (value) => (_formData.city = value ?? '')),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Country',
                        decoration: const InputDecoration(
                          labelText: 'Country',
                          hintText: 'India',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.text,
                        validator: FormBuilderValidators.required(),
                        onSaved: (value) => (_formData.country = value ?? ''),
                      ),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Postal code',
                        decoration: const InputDecoration(
                          labelText: 'Postal code',
                          hintText: '395010',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.required(),
                        onSaved: (value) =>
                            (_formData.postalCode = value ?? ''),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                const Divider(
                    indent: kDefaultPadding * 2,
                    endIndent: kDefaultPadding * 2),
                buildSizedBoxH(kDefaultPadding * 3),
                Text('ABOUT ME', style: themeData.textTheme.labelLarge),
                Text("Built with ❤️ in Flutter",
                    style: themeData.textTheme.labelMedium)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
