import 'package:flutter/material.dart';

class CompleteProfileBioView extends StatefulWidget {
  const CompleteProfileBioView({super.key});

  @override
  State<CompleteProfileBioView> createState() => _CompleteProfileBioViewState();
}

class _CompleteProfileBioViewState extends State<CompleteProfileBioView> {
  final _key = GlobalKey<FormState>();
  TextEditingController bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    bioController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return
        // BlocListener<ProfileCubit, ProfileState>(
        // listener: (context, state) {
        //   if (state is ProfileFailure) {
        //     context.showFlushBar(
        //       type: FlushBarType.error,
        //       description: state.errorMessage,
        //     );
        //   }
        // },
        // child:
        Form(
      key: _key,
      child: Column(
        children: [
          SizedBox(
            width: width,
            child: CustomTextField(
              hintText: "Bio",
              controller: bioController,
              maxLines: 5,
              onChange: (v) {},
              validator: (v) {
                if ((v ?? "").isEmpty) {
                  return "Please write a brief about yourself";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? errorText;
  final String hintText;
  final String? labelText;

  final String? svgPrefixIconPath;
  final Widget? prefixIcon;
  final String? svgSuffixIconPath;
  final VoidCallback? suffixIconPress;
  final VoidCallback? onTap;
  final bool? isEnabled;

  final String? Function(String? value)? onSave;
  final dynamic Function(String? value)? onChange;
  final String? Function(String? value)? validator;

  final bool? isPasswordField;
  final int? maxLines;
  final int? maxLength;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final TextStyle? textStyle;
  final double? width;

  final InputBorder? border;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.textStyle,
    this.labelText,
    this.svgPrefixIconPath,
    this.prefixIcon,
    this.svgSuffixIconPath,
    this.suffixIconPress,
    this.onTap,
    this.isEnabled = true,
    this.onSave,
    this.onChange,
    this.errorText,
    this.isPasswordField = false,
    this.maxLines,
    this.maxLength,
    this.suffixIconColor,
    this.prefixIconColor,
    this.validator,
    this.width,
    this.border,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width * 0.8,
      child: GestureDetector(
        onTap: widget.onTap,
        child: TextFormField(
          maxLength: widget.maxLength,
          maxLines: widget.maxLines ?? 1,
          keyboardType: TextInputType.text,
          controller: widget.controller,
          onTap: widget.onTap,
          onChanged:
              widget.onChange != null ? (v) => widget.onChange!(v) : null,
          obscuringCharacter: "*",
          enabled: widget.isEnabled,
          cursorColor: const Color(0xFFE6E6FA),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            errorMaxLines: 2,
            // isDense: true,
            errorText: widget.errorText,
            filled: true,
            fillColor: Colors.white,
            disabledBorder: widget.border ??
                OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
                ),
            enabledBorder: widget.border ??
                OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
                ),
            border: widget.border ??
                OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
                ),
            focusedBorder: widget.border ??
                OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(17),
                ),
            hintText: widget.hintText,
            // labelText: widget.labelText,
            labelStyle: widget.textStyle,
            prefixIcon: widget.prefixIcon ??
                (widget.svgPrefixIconPath == null
                    ? null
                    : Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 13, end: 13),
                        child: SizedBox(
                          child: Image.asset(
                            widget.svgPrefixIconPath!,
                            color: Colors.red,
                            height: 0,
                            width: 0,
                          ),
                        ),
                      )),
            suffixIcon: widget.isPasswordField == true
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 14,
                        end: 14,
                      ),
                      child: Image.asset(
                        "assets/icons/${isObscure ? "eye" : "eye_bold"}.svg",
                        color: widget.suffixIconColor,
                        height: 0,
                        width: 0,
                      ),
                    ),
                  )
                : widget.svgSuffixIconPath == null
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: widget.suffixIconPress,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 14,
                            end: 14,
                          ),
                          child: Image.asset(
                            widget.svgSuffixIconPath!,
                            color: Colors.red,
                            height: 0,
                            width: 0,
                          ),
                        ),
                      ),
          ),
          obscureText: isObscure && widget.isPasswordField!,
          onSaved: widget.onSave == null ? null : (v) => widget.onSave!(v),
          validator:
              widget.validator == null ? null : (v) => widget.validator!(v),
        ),
      ),
    );
  }
}
