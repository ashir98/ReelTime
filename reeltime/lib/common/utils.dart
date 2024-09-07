import 'package:intl/intl.dart';
import 'package:reeltime/models/detail_model.dart';

const String apiKey = "f28b55e3b3a47ba32dbe2e95e70d787c";
const String baseUrl = "https://api.themoviedb.org/3/";
const String imgUrl = "https://image.tmdb.org/t/p/w780";





String convertMinutesToHoursAndMinutes(int minutes) {
  // Calculate hours and minutes
  int hours = minutes ~/ 60; // Integer division
  int remainingMinutes = minutes % 60; // Remainder

  // Return formatted string
  return "${hours}h  ${remainingMinutes}m";
}



String showYearAndGenre(DateTime year, List<Genre> genres) {
  // Format the year
  String movieYear = DateFormat('yyyy').format(year);
  
  // Get the first two genres and join them with '/'
  String movieGenre = genres.length > 1
      ? '${genres[0].name}/${genres[1].name}' // Display first two genres
      : genres.isNotEmpty 
        ? genres[0].name                // If only one genre is present
        : 'No Genre';              // If no genres are available
  
  // Combine the year and the genres
  return '$movieYear · $movieGenre';
}




String formatCurrencyAmount(int budget) {
  // Check if the budget is valid and greater than zero
  if (budget <= 0) {
    return 'Budget not available';
  }

  // Convert the budget into millions or billions and add 'M' or 'B'
  if (budget >= 1000000000) {
    return '\$${(budget / 1000000000).toStringAsFixed(1)}B'; // For billions
  } else if (budget >= 1000000) {
    return '\$${(budget / 1000000).toStringAsFixed(0)}M'; // For millions
  } else {
    return '\$${NumberFormat('#,###').format(budget)}'; // For lower amounts
  }
}





String formatLanguages(String languageCode) {
  String language = "";

  switch (languageCode) {
    case "en": 
      language = "English";
      break;
    case "es": 
      language = "Spanish";
      break;
    case "fr": 
      language = "French";
      break;
    case "ja": 
      language = "Japanese";
      break;
    case "de": 
      language = "German";
      break;
    case "it": 
      language = "Italian";
      break;
    case "zh": 
      language = "Chinese";
      break;
    case "ko": 
      language = "Korean";
      break;
    case "pt": 
      language = "Portuguese";
      break;
    case "ru": 
      language = "Russian";
      break;
    case "hi": 
      language = "Hindi";
      break;
    case "ar": 
      language = "Arabic";
      break;
    case "tr": 
      language = "Turkish";
      break;
    case "nl": 
      language = "Dutch";
      break;
    case "pl": 
      language = "Polish";
      break;
    case "sv": 
      language = "Swedish";
      break;
    case "no": 
      language = "Norwegian";
      break;
    case "fi": 
      language = "Finnish";
      break;
    case "da": 
      language = "Danish";
      break;
    case "el": 
      language = "Greek";
      break;
    case "he": 
      language = "Hebrew";
      break;
    case "th": 
      language = "Thai";
      break;
    case "vi": 
      language = "Vietnamese";
      break;
    default:
      language = "Unknown";
  }

  return language;
}


