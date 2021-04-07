#!/bin/bash


function tally() {
  if interactive; then
    output "Hit enter at the food prompt to finish.\n"
  fi
  while 
    if interactive; then 
      output "    Food:  "
    fi
    read FOOD
  do
    # Finish if no food is specified.
    if [ "${FOOD}" == "" ]
    then
      break
    fi

    # Check for new food.
    if [ ! -f state/foods/"${FOOD}" ]
    then
      if interactive; then
        output "Unknown food.  Please define.\n\n"
        new_food "${FOOD}"
        output "\n"
      else
        fail "Unknown food:  ${FOOD}"
      fi
    fi

    if interactive; then
      output "Servings:  "
    fi
    read SERVINGS

    # Check validity of input.
    ORIGINAL_SERVINGS="${SERVINGS}"
    eval SERVINGS=$(distill "${SERVINGS}")
    if [ "${SERVINGS}" == "" ]
    then
      fail "Invalid number of servings of ${FOOD}.  (${ORIGINAL_SERVINGS})"
    fi

    # Get points per serving.
    POINTS_PER_SERVING=$(cat state/foods/"${FOOD}")

    # Do the math.
    POINTS=$(
      echo "scale=3; ${POINTS_PER_SERVING} * ${SERVINGS}" \
      | bc
    )

    TALLY=$(
      echo "scale=3; ${TALLY} + ${POINTS}" \
      | bc
    )

    # Output.
    if interactive; then
      output "  Points:  ${POINTS}\n"
      output "   Tally:  ${TALLY}\n"
      output "\n"
    fi

    # Log food and servings.
    echo "${FOOD}" >> "${TAB}"
    echo "${SERVINGS}" >> "${TAB}"
  done
  
  if interactive; then
    output "   Tally:  ${TALLY}\n"
  else
    printf "%s\n" "${TALLY}"
  fi
}
