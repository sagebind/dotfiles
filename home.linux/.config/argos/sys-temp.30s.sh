#!/usr/bin/env bash

ACPI_TEMP=$(sensors -j 2>/dev/null | jq -r '.["acpitz-acpi-0"].temp1.temp1_input | round')

echo "<small>$ACPI_TEMP °C</small> | iconName=temperature-symbolic"
