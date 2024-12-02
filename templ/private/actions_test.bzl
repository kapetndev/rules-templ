"""Unit tests for templ actions."""

load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load("//templ/private:actions.bzl", "templ_command_line")

def _templ_command_line_impl(ctx):
    env = unittest.begin(ctx)
    asserts.equals(
        env,
        "'/bin/templ' generate -f 'mysource.templ' -stdout $@ > 'mysource.go'",
        templ_command_line(
            "/bin/templ",
            "mysource.templ",
            "mysource.go",
        ),
    )
    return unittest.end(env)

templ_command_line_test = unittest.make(_templ_command_line_impl)

def actions_test_suite():
    unittest.suite(
        "actions_tests",
        templ_command_line_test,
    )
