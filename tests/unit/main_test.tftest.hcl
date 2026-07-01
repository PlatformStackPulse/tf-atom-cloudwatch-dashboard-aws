# Unit Tests for tf-atom-cloudwatch-dashboard-aws
#
# These tests use a mock AWS provider — no real AWS calls are made and no
# credentials are required. They assert only on plan-KNOWN values (the tf-label
# `enabled` flag and the generated `id` string), never on computed ARNs/IDs
# which are unknown under a mock provider.
#
# Run with:         terraform test -test-directory=tests/unit
# Run verbose:      terraform test -test-directory=tests/unit -verbose

mock_provider "aws" {}

# Standard tf-label inputs shared by every run block.
variables {
  namespace = "eg"
  stage     = "test"
  name      = "thing"
}

# ---------------------------------------------------------------------------
# Test: module is enabled by default and produces the expected label id
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = output.enabled == true
    error_message = "Module should report enabled = true when enabled is not overridden."
  }

  assert {
    condition     = module.this.id == "eg-test-thing"
    error_message = "tf-label id should be 'eg-test-thing' for namespace=eg, stage=test, name=thing."
  }
}

# ---------------------------------------------------------------------------
# Test: when disabled, the module reports enabled = false
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = output.enabled == false
    error_message = "Module should report enabled = false when enabled = false."
  }
}
