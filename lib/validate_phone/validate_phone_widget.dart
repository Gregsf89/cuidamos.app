import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class ValidatePhoneWidget extends StatefulWidget {
  const ValidatePhoneWidget({Key? key}) : super(key: key);

  @override
  _ValidatePhoneWidgetState createState() => _ValidatePhoneWidgetState();
}

class _ValidatePhoneWidgetState extends State<ValidatePhoneWidget> {
  StopWatchTimer? timerController;
  String? timerValue;
  int? timerMilliseconds;
  TextEditingController? pinCodeController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VALIDATE_PHONE_validate_phone_ON_LOAD');
      logFirebaseEvent('validate_phone_navigate_to');

      context.pushNamed(
        'home_dash',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.rightToLeft,
          ),
        },
      );
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'validate_phone'});
    pinCodeController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    timerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: responsiveVisibility(
        context: context,
        tabletLandscape: false,
      )
          ? AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30,
                ),
                onPressed: () async {
                  logFirebaseEvent('VALIDATE_PHONE_arrow_back_rounded_ICN_ON');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    'phone_screen',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.rightToLeft,
                      ),
                    },
                  );
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'xmboib3i' /* Confiirme o código recebido ab... */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF101213),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0,
            )
          : null,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '061w7kec' /* Confirme seu código */,
                    ),
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF101213),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(44, 8, 44, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ehw46kbk' /* Coloque o código que você rece... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 32, 10, 0),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF4B39EF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      enableActiveFill: false,
                      autoFocus: true,
                      showCursor: true,
                      cursorColor: Color(0xFF4B39EF),
                      obscureText: false,
                      hintCharacter: '-',
                      pinTheme: PinTheme(
                        fieldHeight: 50,
                        fieldWidth: 50,
                        borderWidth: 2,
                        borderRadius: BorderRadius.circular(12),
                        shape: PinCodeFieldShape.box,
                        activeColor: Color(0xFF4B39EF),
                        inactiveColor: Color(0xFFF1F4F8),
                        selectedColor: Color(0xFF57636C),
                        activeFillColor: Color(0xFF4B39EF),
                        inactiveFillColor: Color(0xFFF1F4F8),
                        selectedFillColor: Color(0xFF57636C),
                      ),
                      controller: pinCodeController,
                      onChanged: (_) => {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 44),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'VALIDATE_PHONE_CONFIRMAR_&_CONTINUAR_BTN');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('user_info');
                      },
                      text: FFLocalizations.of(context).getText(
                        'xplae4uq' /* Confirmar & Continuar */,
                      ),
                      options: FFButtonOptions(
                        width: 270,
                        height: 50,
                        color: Color(0xFF101213),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFFF1F4F8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  FlutterFlowTimer(
                    timerValue: timerValue ??= StopWatchTimer.getDisplayTime(
                      timerMilliseconds ??= 60000,
                      hours: false,
                      minute: true,
                      second: true,
                      milliSecond: false,
                    ),
                    timer: timerController ??= StopWatchTimer(
                      mode: StopWatchMode.countDown,
                      presetMillisecond: timerMilliseconds ??= 60000,
                      onChange: (value) {
                        setState(() {
                          timerMilliseconds = value;
                          timerValue = StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                            minute: true,
                            second: true,
                            milliSecond: false,
                          );
                        });
                      },
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                    onEnded: () {},
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 44),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('VALIDATE_PHONE_PAGE_Button2_ON_TAP');
                        logFirebaseEvent('Button2_timer');
                        timerController?.onExecute.add(
                          StopWatchExecute.start,
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'fiit2cjv' /* Reenviar SMS */,
                      ),
                      options: FFButtonOptions(
                        width: 270,
                        height: 50,
                        color: Color(0xFF4B39EF),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFFF1F4F8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
