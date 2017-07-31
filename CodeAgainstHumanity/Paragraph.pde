// formatParagraph() -- this function takes two parameters as
// input: a single long line of text, and a desired paragraph
// width (in pixels).  It returns a new String in which 
// newline characters ('\n') have been inserted in the correct
// locations to break the long line into a paragraph of shorter
// lines that all fit within the desired linewidth.  Use to
// format questions and answers to fit the width of your card.
String formatParagraph( String text, float linewidth )
{
  // You do **NOT** need to understand how this function works.
  // There's nothing in here that's beyond what we taught in 
  // class, but the logic is admittedly a bit complex.  That's
  // why we're providing the function here.  You just need to
  // use it at the right place in your code.
  
  String result = "";
  String[] words = splitTokens( text );

  String line = "";

  for ( int idx = 0; idx < words.length; ++idx ) {
    String wd = words[idx];
    if ( textWidth( wd ) > linewidth ) {
      // This is a looong word.  Need to treat it specially.
      if ( line.length() > 0 ) {
        result = addLine( result, line );
      }
      result = addLine( result, wd );
      line = "";
    } else if ( textWidth( line + " " + wd ) > linewidth ) {
      // The new word is too long.  Break a line.
      result = addLine( result, line );
      line = wd;
    } else if ( line.length() > 0 ) {
      line = line + " " + wd;
    } else {
      line = wd;
    }
  }
  if ( line.length() > 0 ) {
    // Stick in the residual line.
    result = addLine( result, line );
  }

  return result;
}

// A quick helper function used by formatParagraph().  It's
// like adding two strings together, but it inserts a newline
// when necessary.  You should never have to call this function
// directly -- just ignore it.
String addLine( String start, String aline )
{
  if( start.length() == 0 ) {
    return aline;
  } else {
    return start + "\n" + aline;
  }
}