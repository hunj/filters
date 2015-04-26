# Filters
Filters: a basic concept in signal processing.
A filter repeatedly takes an input value and produces an output value.

## Class Hierarchy:
- Filter
  * FilterCascade
  * IdentityFilter
  * CompareFilter
    - MaxFilter(input, n=nil)
    - MinFilter(input, n=nil)
  * MeanFilter(input, n=nil)
  * ScalarLinearFilter
    - FIRFilter
      + GainFilter
      + BinomialFilter

## Generic construction
A generic "Filter" can be constructed as follows:
Filter:
  - Variables:
    @input: Current input. Set by Filter#input.
  - Constructor: params: input, n=nil; n-value is for N-filters
  - Methods:
    + #input(input):
      1. check for valid input type (See Error Handling)
      2. convert input type (String -> Float)
      3. @current <- input
    + #output: displays the output
    + #reset: resets the filter (wipeout the input history)

Each filter may have the following, depending on the type:
- #operate method: (do operations depending on what the filter is)
- @n (optional n-parameter to support functioning on last n inputs)
- #reset method: take in an array, wipe out the elements. The method will be written in a separate module.

## Error Handling:
Implemented in a separate file.
- Exceptions:
  + NilPointerError: raised when input is nil
  + InvalidInputError: raised for invalid input, e.g. nil, "", [^0-9.]
  + IncomparableError: raised if the arguments' types cannot be compared
  + UnsupportedMethodError < NoMethodError
 
## Resettable
"Resettable" module is required to support the reset function for filters under ScalarLinearFilter.

## etc.
Files containing helper methods for complicated things (e.g. factorial calculation for BinomialFilter) is required.

# File Structure
* All Filter classes are in /filters/ folder.
* All optional classes (helpers, etc) are in /lib/ folder.

# Instructions:
* To build, `make build`
* To test, `make test`
* To generate doc, `make doc`
* To clean up the doc, `make clean`