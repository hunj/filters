# Filters
Filters is a basic concept in signal processing. A filter repeatedly takes an input value and produces an output value.

-------

## Class Hierarchy
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
A generic `Filter` can be constructed as following, and has some rules:

* Filter:
  - Variables:
    `input` Current input. Set by `Filter#input`.
  - Constructor: `input, n=nil` where n-value should be given for N-filters.
  - Methods:
    + `input(input)` has rules to check valid input
      1. Check for valid input type (See Error Handling)
      2. Convert input type (String -> Float)
      3. `current` <- input
    + `output` method displays the output
    + `reset` method resets the filter (wipeout the input history)

Each filter may have the following, depending on the type:

- `operate` method: (do operations depending on what the filter is)
- `n` value is an optional n-parameter to support functioning on last n inputs. It was easily implemented thanks to @eerohele's [RingBuffer](https://gist.github.com/eerohele/1904422) structure
- `reset` method: this method takes in an array and wipe out the elements. The method is written in a separate module named `Resettable`.

## Error Handling
To prevent invalid input, an error handling module is implemented in a separate file. It includes exceptions (or errors) such as:

+ `NilPointerError` is raised when input is nil
+ `InvalidInputError` is raised for invalid input, e.g. `nil`, `""` (empty string), and `/[^0-9.]/`
+ `IncomparableError` is raised if the arguments' types cannot be compared (e.g. String compared to Integer)
+ UnsupportedMethodError < NoMethodError
 
## Resettable
A `resettable` module is implemented to support the reset function for filters under ScalarLinearFilter.

## etc.
Files containing helper methods for complicated things (e.g. factorial calculation for BinomialFilter) is included.

------

# File Structure
* All Filter classes are in `./filters` folder.
* All optional classes (helpers, etc) are in `./lib` folder.

# Instructions:
* To build, `make build`
* To test, `make test`
* To generate doc, `make doc`
* To clean up the doc, `make clean`
