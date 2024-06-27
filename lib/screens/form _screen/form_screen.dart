import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/widgets/card_header.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final texttheme = Theme.of(context).textTheme;

    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
            title: Lang.current.form,
            subtitle: Lang.current.formsubTitle,
            icon: Assets.images.png.hourglass
                .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
          ),
          EntranceFader(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding + kTextPadding),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardBody(
                      child: FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderTextField(
                                name: 'text_field',
                                decoration: const InputDecoration(
                                  labelText: 'Text Field',
                                  hintText: 'Hint text',
                                  helperText: 'Helper text',
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                validator: FormBuilderValidators.required(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: ((constraints.maxWidth * 0.5) -
                                            (kDefaultPadding * 0.5)),
                                        child: FormBuilderCheckboxGroup(
                                          name: 'checkbox_group_vertical',
                                          activeColor: AppColors.primaryColor,
                                          orientation:
                                              OptionsOrientation.vertical,
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Checkbox Group Vertical',
                                            border: OutlineInputBorder(),
                                          ),
                                          options: const [
                                            FormBuilderFieldOption(
                                                value: 'Item 1',
                                                child: Text('Item 1')),
                                            FormBuilderFieldOption(
                                                value: 'Item 2',
                                                child: Text('Item 2')),
                                            FormBuilderFieldOption(
                                                value: 'Item 3',
                                                child: Text('Item 3')),
                                            FormBuilderFieldOption(
                                                value: 'Item 4',
                                                child: Text('Item 4')),
                                            FormBuilderFieldOption(
                                                value: 'Item 5',
                                                child: Text('Item 5')),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: kDefaultPadding),
                                      SizedBox(
                                        width: ((constraints.maxWidth * 0.5) -
                                            (kDefaultPadding * 0.5)),
                                        child: FormBuilderCheckboxGroup(
                                          name: 'checkbox_group_horizontal',
                                          wrapSpacing: kDefaultPadding,
                                          activeColor: AppColors.primaryColor,
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Checkbox Group Horizontal',
                                            border: OutlineInputBorder(),
                                          ),
                                          options: const [
                                            FormBuilderFieldOption(
                                                value: 'Item 1',
                                                child: Text('Item 1')),
                                            FormBuilderFieldOption(
                                                value: 'Item 2',
                                                child: Text('Item 2')),
                                            FormBuilderFieldOption(
                                                value: 'Item 3',
                                                child: Text('Item 3')),
                                            FormBuilderFieldOption(
                                                value: 'Item 4',
                                                child: Text('Item 4')),
                                            FormBuilderFieldOption(
                                                value: 'Item 5',
                                                child: Text('Item 5')),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: ((constraints.maxWidth * 0.5) -
                                            (kDefaultPadding * 0.5)),
                                        child: FormBuilderRadioGroup(
                                          name: 'radio_button_group_vertical',
                                          activeColor: AppColors.primaryColor,
                                          orientation:
                                              OptionsOrientation.vertical,
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Radio Button Group Vertical',
                                            border: OutlineInputBorder(),
                                          ),
                                          options: const [
                                            FormBuilderFieldOption(
                                                value: 'Item 1',
                                                child: Text('Item 1')),
                                            FormBuilderFieldOption(
                                                value: 'Item 2',
                                                child: Text('Item 2')),
                                            FormBuilderFieldOption(
                                                value: 'Item 3',
                                                child: Text('Item 3')),
                                            FormBuilderFieldOption(
                                                value: 'Item 4',
                                                child: Text('Item 4')),
                                            FormBuilderFieldOption(
                                                value: 'Item 5',
                                                child: Text('Item 5')),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: kDefaultPadding),
                                      SizedBox(
                                        width: ((constraints.maxWidth * 0.5) -
                                            (kDefaultPadding * 0.5)),
                                        child: FormBuilderRadioGroup(
                                          name: 'radio_button_group_horizontal',
                                          wrapSpacing: kDefaultPadding,
                                          activeColor: AppColors.primaryColor,
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Radio Button Group Horizontal',
                                            border: OutlineInputBorder(),
                                          ),
                                          options: const [
                                            FormBuilderFieldOption(
                                                value: 'Item 1',
                                                child: Text('Item 1')),
                                            FormBuilderFieldOption(
                                                value: 'Item 2',
                                                child: Text('Item 2')),
                                            FormBuilderFieldOption(
                                                value: 'Item 3',
                                                child: Text('Item 3')),
                                            FormBuilderFieldOption(
                                                value: 'Item 4',
                                                child: Text('Item 4')),
                                            FormBuilderFieldOption(
                                                value: 'Item 5',
                                                child: Text('Item 5')),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderFilterChip(
                                name: 'filter_chip',
                                spacing: kDefaultPadding * 0.5,
                                runSpacing: kDefaultPadding * 0.5,
                                checkmarkColor: AppColors.whiteColor,
                                backgroundColor: Colors.indigo.shade100,
                                selectedColor: AppColors.primaryColor,
                                decoration: const InputDecoration(
                                  labelText: 'Multi Choice Chip',
                                  border: OutlineInputBorder(),
                                ),
                                options: [
                                  FormBuilderChipOption(
                                      value: 'Item 1',
                                      child: Text('Item 1',
                                          style: texttheme.labelMedium!
                                              .copyWith(
                                                  color:
                                                      AppColors.whiteColor))),
                                  FormBuilderChipOption(
                                      value: 'Item 2',
                                      child: Text('Item 2',
                                          style: texttheme.labelMedium!
                                              .copyWith(
                                                  color:
                                                      AppColors.whiteColor))),
                                  FormBuilderChipOption(
                                      value: 'Item 3',
                                      child: Text('Item 3',
                                          style: texttheme.labelMedium!
                                              .copyWith(
                                                  color:
                                                      AppColors.whiteColor))),
                                  FormBuilderChipOption(
                                      value: 'Item 4',
                                      child: Text('Item 4',
                                          style: texttheme.labelMedium!
                                              .copyWith(
                                                  color:
                                                      AppColors.whiteColor))),
                                  FormBuilderChipOption(
                                      value: 'Item 5',
                                      child: Text('Item 5',
                                          style: texttheme.labelMedium!
                                              .copyWith(
                                                  color:
                                                      AppColors.whiteColor))),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderChoiceChip(
                                name: 'choice_chip',
                                spacing: kDefaultPadding * 0.5,
                                runSpacing: kDefaultPadding * 0.5,
                                backgroundColor: Colors.indigo.shade100,

                                selectedColor: AppColors.primaryColor, //
                                decoration: const InputDecoration(
                                  labelText: 'Single Choice Chip',
                                  border: OutlineInputBorder(),
                                ),
                                options: [
                                  FormBuilderChipOption(
                                      value: 'Item 1',
                                      child: Text('Item 1',
                                          style: texttheme.labelMedium!
                                              .copyWith(
                                                  color:
                                                      AppColors.whiteColor))),
                                  FormBuilderChipOption(
                                      value: 'Item 2',
                                      child: Text(
                                        'Item 2',
                                        style: texttheme.labelMedium!.copyWith(
                                            color: AppColors.whiteColor),
                                      )),
                                  FormBuilderChipOption(
                                      value: 'Item 3',
                                      child: Text(
                                        'Item 3',
                                        style: texttheme.labelMedium!.copyWith(
                                            color: AppColors.whiteColor),
                                      )),
                                  FormBuilderChipOption(
                                      value: 'Item 4',
                                      child: Text(
                                        'Item 4',
                                        style: texttheme.labelMedium!.copyWith(
                                            color: AppColors.whiteColor),
                                      )),
                                  FormBuilderChipOption(
                                      value: 'Item 5',
                                      child: Text(
                                        'Item 5',
                                        style: texttheme.labelMedium!.copyWith(
                                            color: AppColors.whiteColor),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderDateTimePicker(
                                name: 'date_picker',
                                onChanged: (value) {},
                                inputType: InputType.date,
                                decoration: const InputDecoration(
                                  labelText: 'Date Picker',
                                  border: OutlineInputBorder(),
                                ),
                                initialTime:
                                    const TimeOfDay(hour: 8, minute: 0),
                                initialValue: DateTime.now(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderDateTimePicker(
                                name: 'time_picker',
                                onChanged: (value) {},
                                inputType: InputType.time,
                                decoration: const InputDecoration(
                                  labelText: 'Time Picker',
                                  border: OutlineInputBorder(),
                                ),
                                initialTime:
                                    const TimeOfDay(hour: 8, minute: 0),
                                initialValue: DateTime.now(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderSlider(
                                name: 'slider',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.min(6),
                                ]),
                                onChanged: (value) {},
                                min: 0.0,
                                max: 10.0,
                                initialValue: 7.0,
                                divisions: 20,
                                activeColor: AppColors.primaryColor,
                                inactiveColor:
                                    AppColors.primaryColor.withOpacity(0.3), //
                                decoration: const InputDecoration(
                                  labelText: 'Slider',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderDropdown(
                                name: 'dropdown',
                                decoration: const InputDecoration(
                                  labelText: 'Dropdown',
                                  border: OutlineInputBorder(),
                                  hoverColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                ),

                                focusColor: Colors.transparent,
                                // hint: const Text('Select'),
                                validator: FormBuilderValidators.required(),
                                items: [
                                  'Item 1',
                                  'Item 2',
                                  'Item 3',
                                  'Item 4',
                                  'Item 5'
                                ]
                                    .map((e) => DropdownMenuItem(
                                        value: e, child: Text(e)))
                                    .toList(),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       bottom: kDefaultPadding * 2.0),
                            //   child: FormBuilderAssetPicker(
                            //     name: 'file_picker',
                            //     allowedExtensions: const ['jpg', 'png', 'pdf'],
                            //     allowMultiple: true,
                            //     maxFiles: 5,
                            //     type: FileType.custom,
                            //     decoration: const InputDecoration(
                            //       labelText: 'File Picker',
                            //       border: OutlineInputBorder(),
                            //     ),
                            //     selector: const Row(
                            //       children: [
                            //         Icon(Icons.file_upload),
                            //         Text('Upload'),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderSwitch(
                                activeColor: AppColors.primaryColor,
                                name: 'switch',
                                title: const Text('Receive marketing email'),
                                decoration: const InputDecoration(
                                  labelText: 'Switch',
                                  border: OutlineInputBorder(),
                                  hoverColor: AppColors.primaryColor,
                                  focusColor: AppColors.buttontextColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderCheckbox(
                                name: 'accept_terms',
                                initialValue: false,
                                onChanged: (value) {},
                                title: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'I have read and agree to the ',
                                        style: texttheme.labelLarge!.copyWith(),
                                      ),
                                      const TextSpan(
                                        text: 'Terms and Conditions',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                                validator: FormBuilderValidators.equal(
                                  true,
                                  errorText:
                                      'You must accept terms and conditions to continue',
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                height: 36.0,
                                width: 100.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      // Validation passed.
                                      _formKey.currentState!.save();
                                    } else {
                                      // Validation failed.
                                    }
                                  },
                                  child: Text(lang.submit),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
