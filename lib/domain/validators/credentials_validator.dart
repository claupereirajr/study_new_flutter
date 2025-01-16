import 'package:lucid_validation/lucid_validation.dart';
import 'package:study_new_flutter/domain/dtos/credentials.dart';

class CredentialsValidator extends LucidValidator<Credentials> {
  CredentialsValidator() {
    ruleFor((credentials) => credentials.email, key: 'email')
        .notEmpty(message: 'Email is required')
        .validEmail(message: 'Invalid email format');
    ruleFor((credentials) => credentials.password, key: 'password')
        .notEmpty(message: 'Password is required')
        .minLength(6, message: 'Password must have at least 6 characters')
        .mustHaveLowercase(
            message: 'Password must have at least one lowercase letter')
        .mustHaveUppercase(
            message: 'Password must have at least one uppercase letter')
        .mustHaveNumber(message: 'Password must have at least one number')
        .mustHaveSpecialCharacter(
            message: 'Password must have at least one special character');
  }
}
