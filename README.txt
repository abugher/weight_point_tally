Files:
  bin/
    Scripts.  Symlink these into your PATH.

    bin/tally
      The do-everything script.  Checks weight, tallies foods eaten
      today, takes nutrition information for unknown foods.

    bin/food
      Define or redefine a single food.
      
    bin/weigh-in
      Record or re-record a weight for today.

    bin/analyze
      Provide statistics about historical data.

  lib/
    Libraries.  The guts of the scripts in bin/ .

  state/
    This is a separate repository for individual records.
    
    state/days/
      Daily point total (tally).

    state/foods/
      Each file name and content represent, respectively, the name and
      point value of a food.

    state/weights/
      Daily weigh in.



Formulas:

  https://en.wikipedia.org/wiki/Weight_Watchers#Formulas

  Points per serving:
    (c/50) + (f/12) - (min(r,4)/5)

    c - calories
    f - fat
    r - dietary fiber

  Points per person (break-even target):
    (w / 10) + g + a + h + l + b

    w - weight in pounds
    g - gender-based, 2 for women, 8 for men
    a - age-based:
      4:  17-26
      3:  27-37
      2:  38-47
      1:  48-58
      0:  59+
    h - height-based:
      2:  5'11"+
      1:  5'1"-5'10"
      0:  5'0"-
    l - lifestyle-based; spend most of the day:
      6:  hard work
      4:  walking
      2:  standing
      0:  sitting
    b - breastfeeding:
      10: full breastfeeding
      5:  partial breastfeeding
