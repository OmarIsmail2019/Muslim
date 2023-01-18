abstract class QuranStates {}

class QuranInitialState extends QuranStates {}

class QuranLoadingState extends QuranStates {}

class QuranSuccessState extends QuranStates {}

class QuranErrorState extends QuranStates {}

class SurahLoadingState extends QuranStates {}

class SurahSuccessState extends QuranStates {}

class SurahErrorState extends QuranStates {}

class SuccessPlusFontSizeState extends QuranStates {}

class SuccessMinusFontSizeState extends QuranStates {}

class LoadingRandomAyahOfDay extends QuranStates {}

class SuccessRandomAyahOfDay extends QuranStates {}

class ErrorRandomAyahOfDay extends QuranStates {}

class AdhanLoadingState extends QuranStates {}

class AdhanSuccessState extends QuranStates {}

class AdhanErrorState extends QuranStates {}
