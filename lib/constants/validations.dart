String? validateRequired(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return '$fieldName을(를) 입력해주세요';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return '이메일을 입력해주세요';
  }

  if (!RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(value)) {
    return '올바른 이메일 형식을 입력해주세요';
  }

  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.trim().isEmpty) {
    return '휴대폰 번호를 입력해주세요';
  }

  String cleaned = value.replaceAll(RegExp(r'[^0-9]'), '');
  if (cleaned.length != 10) {
    return '올바른 휴대폰 번호를 입력해주세요';
  }

  return null;
}

String? validateUrl(String? value) {
  if (value != null && value.trim().isNotEmpty) {
    if (!RegExp(r'^https?://').hasMatch(value)) {
      return 'http:// 또는 https://로 시작해야 합니다';
    }
  }
  return null;
}

String? validatePassword(
  String? value,
  String newPasswordController, {
  bool isConfirm = false,
}) {
  if (value == null || value.isEmpty) {
    return '비밀번호를 입력해주세요';
  }

  if (value.length < 8) {
    return '비밀번호는 8자 이상이어야 합니다';
  }

  if (!RegExp(
    r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])',
  ).hasMatch(value)) {
    return '영문, 숫자, 특수문자를 포함해야 합니다';
  }

  if (isConfirm && value != newPasswordController) {
    return '새 비밀번호와 일치하지 않습니다';
  }

  return null;
}
