import 'package:flutter/material.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/size_config.dart';

class CustomSelectionDropdown extends StatefulWidget {
  const CustomSelectionDropdown(
      {Key? key, this.label, this.onCurrencySelected, this.dropdownList})
      : super(key: key);
  final Function(String?)? onCurrencySelected;
  final List<String>? dropdownList;
  final String? label;
  @override
  _CustomSelectionDropdownState createState() =>
      _CustomSelectionDropdownState();
}

class _CustomSelectionDropdownState extends State<CustomSelectionDropdown>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _turnsAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _turnsAnimation =
        _animationController.drive(Tween<double>(begin: 0, end: 0.5));
    if (widget.dropdownList != null) {
      currencies = widget.dropdownList!;
    }
    super.initState();
  }

  void rotate() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  bool _dropdownOpen = false;
  List<String> currencies = [
    'NGN Naira',
    'NGN Naira',
    'NGN Naira',
    'NGN Naira',
    'NGN Naira',
    'NGN Naira',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            rotate();
            if (widget.onCurrencySelected != null) {
              widget.onCurrencySelected!(null);
            }
            setState(() {
              _dropdownOpen = !_dropdownOpen;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SimpleText(
                widget.label ?? 'Select Currency',
                size: 14,
                weight: FontWeight.w400,
              ),
              RotationTransition(
                turns: _turnsAnimation,
                child: Icon(Icons.expand_more_rounded),
              ),
            ],
          ),
        ),
        if (_dropdownOpen)
          Container(
            height: SizeConfig.height(172),
            margin: EdgeInsets.symmetric(
              vertical: SizeConfig.height(4),
              horizontal: SizeConfig.width(10),
            ),
            decoration: BoxDecoration(
              color: AppColors.appWhite,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  color: AppColors.appBlack.withOpacity(0.15),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: IconButton(
                      onPressed: () {
                        if (widget.onCurrencySelected != null)
                          widget.onCurrencySelected!(null);
                        rotate();
                        setState(() {
                          _dropdownOpen = false;
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColors.appBlackVariant,
                      )),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (_, index) => InkWell(
                      onTap: () {
                        if (widget.onCurrencySelected != null)
                          widget.onCurrencySelected!(currencies[index]);
                        rotate();
                        setState(() {
                          _dropdownOpen = false;
                        });
                      },
                      child: SizedBox(
                        height: SizeConfig.height(40),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.width(9),
                          ),
                          child: SimpleText(
                            currencies[index],
                          ),
                        ),
                      ),
                    ),
                    itemCount: currencies.length,
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
