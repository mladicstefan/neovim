#!/usr/bin/env bash
set -e

BUILD_DIR="$HOME/.cargo/build-tmp"
mkdir -p "$BUILD_DIR"

echo "Using build dir: $BUILD_DIR"
echo ""

tools=(
    "cargo-watch"
    "cargo-audit"
    "cargo-nextest"
    "cargo-expand"
    "cargo-deny"
    "cargo-machete"
    "cargo-edit"
    "flamegraph"
    "cargo-fuzz"
)

failed=()

for tool in "${tools[@]}"; do
    echo "━━━ Installing $tool ━━━"
    local extra_flags=""
    [[ "$tool" == "cargo-nextest" ]] && extra_flags="--locked"
    if cargo install "$tool" --target-dir "$BUILD_DIR" $extra_flags; then
        echo "✓ $tool installed"
    else
        echo "✗ $tool failed"
        failed+=("$tool")
    fi
    echo ""
done

# cargo-udeps requires nightly
echo "━━━ Installing cargo-udeps (nightly) ━━━"
if cargo +nightly install cargo-udeps --target-dir "$BUILD_DIR"; then
    echo "✓ cargo-udeps installed"
else
    echo "✗ cargo-udeps failed"
    failed+=("cargo-udeps")
fi

# miri via rustup
echo "━━━ Installing miri via rustup ━━━"
if rustup component add miri; then
    echo "✓ miri installed"
else
    echo "✗ miri failed"
    failed+=("miri")
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ ${#failed[@]} -eq 0 ]; then
    echo "✓ All tools installed successfully"
else
    echo "✗ Failed: ${failed[*]}"
    echo "  Retry with:"
    for f in "${failed[@]}"; do
        echo "  cargo install $f --target-dir $BUILD_DIR"
    done
fi
