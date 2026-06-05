#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

required_files=(
  ".xgc2/product.yml"
  ".xgc2/scripts/build_debs_in_docker.sh"
  ".xgc2/scripts/check_installed_packages.sh"
  ".xgc2/scripts/check_package_compliance.sh"
  ".xgc2/scripts/package_debs.sh"
  ".xgc2/scripts/publish_apt_repo.sh"
  ".github/workflows/build-debs.yml"
  "README.md"
  "CMakeLists.txt"
  "package_ROS1.xml"
  "msg/CustomMsg.msg"
  "msg/CustomPoint.msg"
)

for file in "${required_files[@]}"; do
  test -f "${REPO_ROOT}/${file}" || {
    echo "missing required file: ${file}" >&2
    exit 1
  }
done

grep -q "id: livox-ros-driver2" "${REPO_ROOT}/.xgc2/product.yml"
grep -q "ros-noetic-livox-ros-driver2" "${REPO_ROOT}/.xgc2/scripts/package_debs.sh"
grep -q "install(DIRECTORY config/" "${REPO_ROOT}/CMakeLists.txt"

echo "Package compliance check passed"
