# xest &nbsp; ![Build Status](https://travis-ci.org/Auroratide/xest.svg?branch=master)

> xest is prior to 1.0.0 release, and hence it's API is very unstable. Basically, that means things are gonna change a lot! New features will be added, old features will improve, etc. But feel free to give it a spin and provide feedback!

**xest** is a testing library written in Haxe for Haxe! Compared to other libraries, **xest** is _lambda-based_, providing an enormous amount of flexibility and expressibility. You can group tests, generate tests programmically, and much much more.

Here's a little example test! Isn't it cute?

```haxe
import com.auroratide.xest.Xest;

class MyTest extends Xest {
  public function new() {
    example("my first test", () -> {
      expect(1 + 1 == 2);
    });
  }
}
```

## Features

* [Defining tests using lambdas](examples/running/RunningTests.hx)
* [Setup](examples/running/hooks/BeforeEach.hx) and [teardown](examples/running/hooks/AfterEach.hx) test hooks
* [Skipping tests](examples/running/RunningTests.hx)
* [Different kinds of assertions with a single function](examples/expectations/Expectations.hx)
* [Test reporting](examples/reporting/Reporting.hx) (including elapsed time for longer tests)
* [Failure reporting](examples/reporting/Reporting.hx) (including line numbers for debugging)

The following features are planned for the 1.0.0 release:

* Mocking and verifying interactions
* Stubbing method returns
* Running a single test or suite
* More assertion types:
  * Comparisons (<, >)
  * Negated expressions
  * Unary function call
  * Binary function call
  * Iterable expressions

## Usage

**xest** takes the philosophy that the test suite is itself just a program, and hence it relies on the Haxe compiler to build and run the tests. That means you only need to provide one (or more) **hxml files** to define your test suites! For example:

```
# test.hxml
-cp src
--library xest
-main com.auroratide.xest.Xest
--macro include('mypackage')
--interp
```

Then just run `haxe test.hxml` to run the tests!

Note the following:

* `--library xest`: You want this. You _need_ this ( :
* `-main com.auroratide.xest.Xest`: xest provides a class that automatically finds all your test files
* `--macro include('mypackage')`: This tells xest where to find your test classes
* `--interp`: Runs the tests directly rather than outputting a program file. But really, nothing's stopping you from compiling into different platforms to test cross-compatibility!

## Examples

Personally, I like thinking of tests as _example usages_. That is, they show off how to use the module in question whilst verifying that it works. As a result, all of the xest examples are actually just _runnable tests in and of themselves_!

This means there is no wiki or an enormously long readme. xest's tests demonstrate how to use the library, so all the examples are written into code directly. Every file in the **[examples](examples)** folder demonstrates a different aspect of the framework.

See **[Features](#features)** for a list of everything you can do with xest!

# Contributing

I'm happy to take feedback in the form of github issues and code changes in the form of pull requests! Just make sure all the tests pass with:

```
haxe examples/run.hxml
```

You can also see what an error report looks like by running:

```
haxe failures/run.hxml
```
