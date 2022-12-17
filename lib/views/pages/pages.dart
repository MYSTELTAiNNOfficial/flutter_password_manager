import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_password_manager/services/services.dart';
import 'package:flutter_password_manager/views/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';

import '../../models/alldatabyiduser/data.dart';
import '../../models/models.dart';

part 'splash.dart';
part 'login.dart';
part 'home.dart';
part 'regis.dart';
part 'menu.dart';
part 'form.dart';
part 'profile.dart';
part 'detail.dart';
